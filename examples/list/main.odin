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

	pattern := fc.pattern_create()
	if pattern == nil {
		fmt.eprintln("Could not allocate font pattern")
		os.exit(1)
	}
	defer fc.pattern_destroy(pattern)

	objects := fc.object_set_from_slice([]cstring{fc.FAMILY, fc.STYLE, fc.FILE})
	if objects == nil {
		fmt.eprintln("Could not allocate object set")
		os.exit(1)
	}
	defer fc.object_set_destroy(objects)

	fonts := fc.font_list(config, pattern, objects)
	if fonts == nil {
		fmt.eprintln("Could not list fonts")
		os.exit(1)
	}
	defer fc.font_set_destroy(fonts)

	for i in 0 ..< int(fonts.nfont) {
		font := fonts.fonts[i]
		family, family_result := fc.pattern_string(font, fc.FAMILY)
		style, style_result := fc.pattern_string(font, fc.STYLE)
		file, file_result := fc.pattern_string(font, fc.FILE)
		if family_result == .Match && style_result == .Match && file_result == .Match {
			fmt.printf("%s — %s: %s\n", family, style, file)
		}
	}
}
