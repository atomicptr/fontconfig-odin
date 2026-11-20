package main

import fc "../../fontconfig"
import "core:fmt"

main :: proc() {
	defer free_all(context.temp_allocator)

	queries := []string {
		"DejaVu Sans",
		"Liberation Serif:style=Italic",
		"Noto Sans:lang=ja",
		"Cantarell",
		"Ubuntu:style=Bold",
		"JetBrains Mono,Fira Code,monospace",
		"Source Code Pro:style=Semibold",
		"FiraMono,DejaVu Sans Mono,monospace",
		"Noto Color Emoji",
		"serif:style=Bold Italic",
		"sans\\-serif:lang=ar",
		"monospace:style=Bold",
		"Definitely Not A Real Font,DejaVu Sans,sans\\-serif",
	}

	for query in queries {
		file, index, ok := fc.find_font(query, context.temp_allocator)
		if ok {
			fmt.printf("%s -> %s (face %d)\n", query, file, index)
		} else {
			fmt.printf("%s -> no font found\n", query)
		}
	}
}
