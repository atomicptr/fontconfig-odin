package fontconfig

import "core:c"
import "core:strings"

// Gets the integer value of object from pattern
pattern_integer :: proc "contextless" (
	pattern: ^Pattern,
	object: cstring,
	index: c.int = 0,
) -> (
	value: c.int,
	result: Result,
) {
	result = pattern_get_integer(pattern, object, index, &value)
	return
}

// Gets the double value of object from pattern
pattern_double :: proc "contextless" (
	pattern: ^Pattern,
	object: cstring,
	index: c.int = 0,
) -> (
	value: c.double,
	result: Result,
) {
	result = pattern_get_double(pattern, object, index, &value)
	return
}

// Gets the string value of object from pattern
pattern_string :: proc "contextless" (
	pattern: ^Pattern,
	object: cstring,
	index: c.int = 0,
) -> (
	value: cstring,
	result: Result,
) {
	result = pattern_get_string(pattern, object, index, &value)
	return
}

// Gets the boolean value of object from pattern
pattern_bool :: proc "contextless" (
	pattern: ^Pattern,
	object: cstring,
	index: c.int = 0,
) -> (
	value: Bool,
	result: Result,
) {
	result = pattern_get_bool(pattern, object, index, &value)
	return
}

// Creates an object set from objects
object_set_from_slice :: proc "contextless" (objects: []cstring) -> ^Object_Set {
	set := object_set_create()
	if set == nil {
		return nil
	}

	for object in objects {
		if object_set_add(set, object) == 0 {
			object_set_destroy(set)
			return nil
		}
	}

	return set
}

// Finds the best font for name and returns its file path and face index, may return a fallback font
find_font :: proc(
	name: string,
	allocator := context.allocator,
) -> (
	file: string,
	index: c.int,
	ok: bool,
) {
	if strings.contains(name, "\x00") {
		return "", 0, false
	}

	c_name, name_error := strings.clone_to_cstring(name, context.temp_allocator)
	if name_error != nil {
		return "", 0, false
	}
	defer delete(c_name, context.temp_allocator)

	config := init_load_config_and_fonts()
	if config == nil {
		return "", 0, false
	}
	defer config_destroy(config)

	pattern := name_parse(c_name)
	if pattern == nil {
		return "", 0, false
	}
	defer pattern_destroy(pattern)

	if config_substitute(config, pattern, .Pattern) == 0 {
		return "", 0, false
	}
	default_substitute(pattern)

	result: Result
	match := font_match(config, pattern, &result)
	if match == nil {
		return "", 0, false
	}
	defer pattern_destroy(match)

	if result != .Match {
		return "", 0, false
	}

	path, path_result := pattern_string(match, FILE)
	face_index, index_result := pattern_integer(match, INDEX)
	if path_result != .Match || path == nil || index_result != .Match {
		return "", 0, false
	}

	copied_path, copy_error := strings.clone(string(path), allocator)
	if copy_error != nil {
		return "", 0, false
	}

	return copied_path, face_index, true
}
