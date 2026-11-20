package main

import fc "../../fontconfig"
import "core:fmt"
import "core:os"

main :: proc() {
	config := fc.init_load_config_and_fonts()
	if config == nil {
		fmt.eprintln("Could not load Fontconfig configuration")
		os.exit(1)
	}
	defer fc.config_destroy(config)

	pattern := fc.name_parse("sans\\-serif")
	if pattern == nil {
		fmt.eprintln("Could not create font pattern")
		os.exit(1)
	}
	defer fc.pattern_destroy(pattern)

	if fc.config_substitute(config, pattern, .Pattern) == 0 {
		fmt.eprintln("Could not substitute font pattern")
		os.exit(1)
	}
	fc.default_substitute(pattern)

	result: fc.Result
	match := fc.font_match(config, pattern, &result)
	if match == nil || result != .Match {
		fmt.eprintln("No matching font")
		os.exit(1)
	}
	defer fc.pattern_destroy(match)

	file, file_result := fc.pattern_string(match, fc.FILE)
	index, index_result := fc.pattern_integer(match, fc.INDEX)
	if file_result != .Match || index_result != .Match {
		fmt.eprintln("Matched font has no file or face index")
		os.exit(1)
	}

	fmt.printf("%s: %d\n", file, index)
}
