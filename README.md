# fontconfig-odin

Odin bindings for [Fontconfig](https://www.freedesktop.org/wiki/Software/fontconfig/), using the systems shared library.

Bindings are based on Fontconfig 2.18.3

## Basic usage

### Look up a font

```odin
package main

import fc "./fontconfig"
import "core:fmt"

FONT_NAME :: "DejaVu Sans"

main :: proc() {
	config := fc.init_load_config_and_fonts()
	if config == nil {
		return
	}
	defer fc.config_destroy(config)

	pattern := fc.name_parse(FONT_NAME)
	if pattern == nil {
		return
	}
	defer fc.pattern_destroy(pattern)

	if fc.config_substitute(config, pattern, .Pattern) == 0 {
		return
	}
	fc.default_substitute(pattern)

	result: fc.Result
	font := fc.font_match(config, pattern, &result)
	if font == nil {
		return
	}
	defer fc.pattern_destroy(font)

	if result != .Match {
		return
	}

	file, file_result := fc.pattern_string(font, fc.FILE)
	index, index_result := fc.pattern_integer(font, fc.INDEX)
	if file_result == .Match && index_result == .Match {
		fmt.printf("%s (face %d)\n", file, index)
	}
}
```

### Helper: find_font

```odin
package main

import fc "./fontconfig"
import "core:fmt"

main :: proc() {
	defer free_all(context.temp_allocator)

	file, index, ok := fc.find_font("Liberation Serif,serif:style=Italic", context.temp_allocator)
	if ok {
		fmt.printf("%s (face %d)\n", file, index)
	}
}
```

## License

MIT
