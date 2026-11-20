/*
 * fontconfig/fontconfig/fontconfig.h
 *
 * Copyright © 2001 Keith Packard
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of the author(s) not be used in
 * advertising or publicity pertaining to distribution of the software without
 * specific, written prior permission.  The authors make no
 * representations about the suitability of this software for any purpose.  It
 * is provided "as is" without express or implied warranty.
 *
 * THE AUTHOR(S) DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */
package fontconfig

import "core:c"
import "core:c/libc"

when ODIN_OS == .Linux || ODIN_OS == .Darwin {
	foreign import lib "system:fontconfig"
} else when ODIN_OS == .Windows {
	foreign import lib "system:fontconfig.lib"
} else {
	#panic("fontconfig: unsupported os")
}

when ODIN_ARCH == .amd64 && ODIN_OS != .Windows {
	Va_List_Arg :: ^libc.va_list
} else {
	Va_List_Arg :: libc.va_list
}

Char8 :: u8
Char16 :: c.ushort
Char32 :: c.uint
Bool :: c.int
Object :: c.int
False :: Bool(0)
True :: Bool(1)
Dont_Care :: Bool(2)

MAJOR :: 2
MINOR :: 18
REVISION :: 3
VERSION :: MAJOR * 10000 + MINOR * 100 + REVISION
CACHE_VERSION_NUMBER :: 12
CACHE_SNAP_VERSION_NUMBER :: 0
NEXT_CACHE_VERSION_NUMBER :: 0
CACHE_MIN_COMPAT_VERSION :: 9
CACHE_VERSION :: "12"
FAMILY :: "family"
STYLE :: "style"
SLANT :: "slant"
WEIGHT :: "weight"
SIZE :: "size"
ASPECT :: "aspect"
PIXEL_SIZE :: "pixelsize"
SPACING :: "spacing"
FOUNDRY :: "foundry"
ANTIALIAS :: "antialias"
HINTING :: "hinting"
HINT_STYLE :: "hintstyle"
VERTICAL_LAYOUT :: "verticallayout"
AUTOHINT :: "autohint"
GLOBAL_ADVANCE :: "globaladvance"
WIDTH :: "width"
FILE :: "file"
INDEX :: "index"
FT_FACE :: "ftface"
RASTERIZER :: "rasterizer"
OUTLINE :: "outline"
SCALABLE :: "scalable"
COLOR :: "color"
VARIABLE :: "variable"
SCALE :: "scale"
SYMBOL :: "symbol"
DPI :: "dpi"
RGBA :: "rgba"
MINSPACE :: "minspace"
SOURCE :: "source"
CHARSET :: "charset"
LANG :: "lang"
FONTVERSION :: "fontversion"
FULLNAME :: "fullname"
FAMILYLANG :: "familylang"
STYLELANG :: "stylelang"
FULLNAMELANG :: "fullnamelang"
CAPABILITY :: "capability"
FONTFORMAT :: "fontformat"
EMBOLDEN :: "embolden"
EMBEDDED_BITMAP :: "embeddedbitmap"
DECORATIVE :: "decorative"
LCD_FILTER :: "lcdfilter"
FONT_FEATURES :: "fontfeatures"
FONT_VARIATIONS :: "fontvariations"
NAMELANG :: "namelang"
PRGNAME :: "prgname"
HASH :: "hash"
POSTSCRIPT_NAME :: "postscriptname"
FONT_HAS_HINT :: "fonthashint"
ORDER :: "order"
DESKTOP_NAME :: "desktop"
NAMED_INSTANCE :: "namedinstance"
FONT_WRAPPER :: "fontwrapper"
GENERIC_FAMILY :: "genericfamily"
CACHE_SUFFIX :: ".cache-" + CACHE_VERSION
DIR_CACHE_FILE :: "fonts.cache-" + CACHE_VERSION
USER_CACHE_FILE :: ".fonts.cache-" + CACHE_VERSION
CHARWIDTH :: "charwidth"
CHAR_WIDTH :: CHARWIDTH
CHAR_HEIGHT :: "charheight"
MATRIX :: "matrix"
WEIGHT_THIN :: 0
WEIGHT_EXTRALIGHT :: 40
WEIGHT_ULTRALIGHT :: WEIGHT_EXTRALIGHT
WEIGHT_LIGHT :: 50
WEIGHT_DEMILIGHT :: 55
WEIGHT_SEMILIGHT :: WEIGHT_DEMILIGHT
WEIGHT_BOOK :: 75
WEIGHT_REGULAR :: 80
WEIGHT_NORMAL :: WEIGHT_REGULAR
WEIGHT_MEDIUM :: 100
WEIGHT_DEMIBOLD :: 180
WEIGHT_SEMIBOLD :: WEIGHT_DEMIBOLD
WEIGHT_BOLD :: 200
WEIGHT_EXTRABOLD :: 205
WEIGHT_ULTRABOLD :: WEIGHT_EXTRABOLD
WEIGHT_BLACK :: 210
WEIGHT_HEAVY :: WEIGHT_BLACK
WEIGHT_EXTRABLACK :: 215
WEIGHT_ULTRABLACK :: WEIGHT_EXTRABLACK
SLANT_ROMAN :: 0
SLANT_ITALIC :: 100
SLANT_OBLIQUE :: 110
WIDTH_ULTRACONDENSED :: 50
WIDTH_EXTRACONDENSED :: 63
WIDTH_CONDENSED :: 75
WIDTH_SEMICONDENSED :: 87
WIDTH_NORMAL :: 100
WIDTH_SEMIEXPANDED :: 113
WIDTH_EXPANDED :: 125
WIDTH_EXTRAEXPANDED :: 150
WIDTH_ULTRAEXPANDED :: 200
SPACING_PROPORTIONAL :: 0
SPACING_DUAL :: 90
SPACING_MONO :: 100
SPACING_CHARCELL :: 110
PROPORTIONAL :: SPACING_PROPORTIONAL
DUAL :: SPACING_DUAL
MONO :: SPACING_MONO
CHARCELL :: SPACING_CHARCELL
RGBA_UNKNOWN :: 0
RGBA_RGB :: 1
RGBA_BGR :: 2
RGBA_VRGB :: 3
RGBA_VBGR :: 4
RGBA_NONE :: 5
HINT_NONE :: 0
HINT_SLIGHT :: 1
HINT_MEDIUM :: 2
HINT_FULL :: 3
LCD_NONE :: 0
LCD_DEFAULT :: 1
LCD_LIGHT :: 2
LCD_LEGACY :: 3
FAMILY_UNKNOWN :: 0
FAMILY_SERIF :: 1
FAMILY_SANS :: 2
FAMILY_MONO :: 3
FAMILY_CURSIVE :: 4
FAMILY_FANTASY :: 5
FAMILY_SYSTEM_UI :: 6
FAMILY_UI_SERIF :: 7
FAMILY_UI_SANS :: 8
FAMILY_UI_MONO :: 9
FAMILY_UI_ROUNDED :: 10
FAMILY_EMOJI :: 11
FAMILY_MATH :: 12
FAMILY_FANGSONG :: 13
WARN_INVALID_ATTR :: (1 << 0)
CHARSET_MAP_SIZE :: (256 / 32)
CHARSET_DONE :: Char32(0xffffffff)
UTF8_MAX_LEN :: 6

Warning_Flag :: enum c.int {
	Invalid_Attr = 0,
}

Warning_Flags :: bit_set[Warning_Flag;c.uint]

Type :: enum c.int {
	Unknown  = -1,
	Void     = 0,
	Integer  = 1,
	Double   = 2,
	String   = 3,
	Bool     = 4,
	Matrix   = 5,
	Char_Set = 6,
	FT_Face  = 7,
	Lang_Set = 8,
	Range    = 9,
}

Result :: enum c.int {
	Match         = 0,
	No_Match      = 1,
	Type_Mismatch = 2,
	No_Id         = 3,
	Out_Of_Memory = 4,
}

Value_Binding :: enum c.int {
	Weak   = 0,
	Strong = 1,
	Same   = 2,
	End    = 0x7fffffff,
}

Match_Kind :: enum c.int {
	Pattern = 0,
	Font    = 1,
	Scan    = 2,
	End     = 3,
}

Lang_Result :: enum c.int {
	Equal             = 0,
	Different_Country = 1,
	Different_Lang    = 2,
}

Set_Name :: enum c.int {
	System      = 0,
	Application = 1,
}

Endian :: enum c.int {
	Big    = 0,
	Little = 1,
}

Match_Kind_Begin :: Match_Kind.Pattern
Lang_Different_Territory :: Lang_Result.Different_Country

Char_Set :: struct {
	_opaque: [0]u8,
}

Pattern :: struct {
	_opaque: [0]u8,
}

Lang_Set :: struct {
	_opaque: [0]u8,
}

Range :: struct {
	_opaque: [0]u8,
}

Atomic :: struct {
	_opaque: [0]u8,
}

Config :: struct {
	_opaque: [0]u8,
}

File_Cache :: struct {
	_opaque: [0]u8,
}

Blanks :: struct {
	_opaque: [0]u8,
}

Str_List :: struct {
	_opaque: [0]u8,
}

Str_Set :: struct {
	_opaque: [0]u8,
}

Cache :: struct {
	_opaque: [0]u8,
}

Matrix :: struct {
	xx, xy, yx, yy: c.double,
}

Object_Type :: struct {
	object: cstring,
	type:   Type,
}

Constant :: struct {
	name:   cstring,
	object: cstring,
	value:  c.int,
}

Pattern_Iter :: struct {
	dummy1, dummy2: rawptr,
}

Config_File_Info_Iter :: struct {
	dummy1, dummy2, dummy3: rawptr,
}

Value :: struct {
	type: Type,
	u:    struct #raw_union {
		s: cstring,
		i: c.int,
		b: Bool,
		d: c.double,
		m: ^Matrix,
		c: ^Char_Set,
		f: rawptr,
		l: ^Lang_Set,
		r: ^Range,
	},
}

Font_Set :: struct {
	nfont, sfont: c.int,
	fonts:        [^]^Pattern,
}

Object_Set :: struct {
	nobject, sobject: c.int,
	objects:          [^]cstring,
	nobjIds:          c.int,
	objIds:           [^]Object,
}

Destroy_Func :: #type proc "c" (data: rawptr)
Filter_Font_Set_Func :: #type proc "c" (font: ^Pattern, user_data: rawptr) -> Bool

@(default_calling_convention = "c")
foreign lib {
	@(link_name = "FcBlanksCreate")
	blanks_create :: proc() -> ^Blanks ---
	@(link_name = "FcBlanksDestroy")
	blanks_destroy :: proc(b: ^Blanks) ---
	@(link_name = "FcBlanksAdd")
	blanks_add :: proc(b: ^Blanks, ucs4: Char32) -> Bool ---
	@(link_name = "FcBlanksIsMember")
	blanks_is_member :: proc(b: ^Blanks, ucs4: Char32) -> Bool ---
	@(link_name = "FcCacheDir")
	cache_dir :: proc(c: ^Cache) -> cstring ---
	@(link_name = "FcCacheCopySet")
	cache_copy_set :: proc(c: ^Cache) -> ^Font_Set ---
	@(link_name = "FcCacheSubdir")
	cache_subdir :: proc(cache: ^Cache, i: c.int) -> cstring ---
	@(link_name = "FcCacheNumSubdir")
	cache_num_subdir :: proc(cache: ^Cache) -> c.int ---
	@(link_name = "FcCacheNumFont")
	cache_num_font :: proc(cache: ^Cache) -> c.int ---
	@(link_name = "FcDirCacheUnlink")
	dir_cache_unlink :: proc(dir: cstring, config: ^Config) -> Bool ---
	@(link_name = "FcDirCacheValid")
	dir_cache_valid :: proc(cache_file: cstring) -> Bool ---
	@(link_name = "FcDirCacheClean")
	dir_cache_clean :: proc(cache_dir: cstring, verbose: Bool) -> Bool ---
	@(link_name = "FcCacheCreateTagFile")
	cache_create_tag_file :: proc(config: ^Config) ---
	@(link_name = "FcDirCacheCreateUUID")
	dir_cache_create_uuid :: proc(dir: cstring, force: Bool, config: ^Config) -> Bool ---
	@(link_name = "FcDirCacheDeleteUUID")
	dir_cache_delete_uuid :: proc(dir: cstring, config: ^Config) -> Bool ---
	@(link_name = "FcConfigHome")
	config_home :: proc() -> cstring ---
	@(link_name = "FcConfigEnableHome")
	config_enable_home :: proc(enable: Bool) -> Bool ---
	@(link_name = "FcConfigGetFilename")
	config_get_filename :: proc(config: ^Config, url: cstring) -> cstring ---
	@(link_name = "FcConfigFilename")
	config_filename :: proc(url: cstring) -> cstring ---
	@(link_name = "FcConfigCreate")
	config_create :: proc() -> ^Config ---
	@(link_name = "FcConfigReference")
	config_reference :: proc(config: ^Config) -> ^Config ---
	@(link_name = "FcConfigDestroy")
	config_destroy :: proc(config: ^Config) ---
	@(link_name = "FcConfigSetCurrent")
	config_set_current :: proc(config: ^Config) -> Bool ---
	@(link_name = "FcConfigGetCurrent")
	config_get_current :: proc() -> ^Config ---
	@(link_name = "FcConfigUptoDate")
	config_upto_date :: proc(config: ^Config) -> Bool ---
	@(link_name = "FcConfigBuildFonts")
	config_build_fonts :: proc(config: ^Config) -> Bool ---
	@(link_name = "FcConfigGetFontDirs")
	config_get_font_dirs :: proc(config: ^Config) -> ^Str_List ---
	@(link_name = "FcConfigGetConfigDirs")
	config_get_config_dirs :: proc(config: ^Config) -> ^Str_List ---
	@(link_name = "FcConfigGetConfigFiles")
	config_get_config_files :: proc(config: ^Config) -> ^Str_List ---
	@(link_name = "FcConfigGetCache")
	config_get_cache :: proc(config: ^Config) -> cstring ---
	@(link_name = "FcConfigGetBlanks")
	config_get_blanks :: proc(config: ^Config) -> ^Blanks ---
	@(link_name = "FcConfigGetCacheDirs")
	config_get_cache_dirs :: proc(config: ^Config) -> ^Str_List ---
	@(link_name = "FcConfigGetRescanInterval")
	config_get_rescan_interval :: proc(config: ^Config) -> c.int ---
	@(link_name = "FcConfigSetRescanInterval")
	config_set_rescan_interval :: proc(config: ^Config, rescanInterval: c.int) -> Bool ---
	@(link_name = "FcConfigGetFonts")
	config_get_fonts :: proc(config: ^Config, set: Set_Name) -> ^Font_Set ---
	@(link_name = "FcConfigAcceptFont")
	config_accept_font :: proc(config: ^Config, font: ^Pattern) -> Bool ---
	@(link_name = "FcConfigAcceptFilename")
	config_accept_filename :: proc(config: ^Config, filename: cstring) -> Bool ---
	@(link_name = "FcConfigAcceptFilter")
	config_accept_filter :: proc(config: ^Config, font: ^Pattern) -> Bool ---
	@(link_name = "FcConfigAppFontAddFile")
	config_app_font_add_file :: proc(config: ^Config, file: cstring) -> Bool ---
	@(link_name = "FcConfigAppFontAddDir")
	config_app_font_add_dir :: proc(config: ^Config, dir: cstring) -> Bool ---
	@(link_name = "FcConfigAppFontClear")
	config_app_font_clear :: proc(config: ^Config) ---
	@(link_name = "FcConfigPreferAppFont")
	config_prefer_app_font :: proc(config: ^Config, flag: Bool) ---
	@(link_name = "FcConfigSetWarningFlags")
	config_set_warning_flags :: proc(config: ^Config, warn: Warning_Flags, flag: Bool) ---
	@(link_name = "FcConfigGetWarningFlags")
	config_get_warning_flags :: proc(config: ^Config) -> Warning_Flags ---
	@(link_name = "FcConfigSubstituteWithPat")
	config_substitute_with_pat :: proc(config: ^Config, p: ^Pattern, p_pat: ^Pattern, kind: Match_Kind) -> Bool ---
	@(link_name = "FcConfigSubstitute")
	config_substitute :: proc(config: ^Config, p: ^Pattern, kind: Match_Kind) -> Bool ---
	@(link_name = "FcConfigGetSysRoot")
	config_get_sys_root :: proc(config: ^Config) -> cstring ---
	@(link_name = "FcConfigSetSysRoot")
	config_set_sys_root :: proc(config: ^Config, sysroot: cstring) ---
	@(link_name = "FcConfigSetFontSetFilter")
	config_set_font_set_filter :: proc(config: ^Config, filter_func: Filter_Font_Set_Func, destroy_data_func: Destroy_Func, user_data: rawptr) -> ^Config ---
	@(link_name = "FcConfigFileInfoIterInit")
	config_file_info_iter_init :: proc(config: ^Config, iter: ^Config_File_Info_Iter) ---
	@(link_name = "FcConfigFileInfoIterNext")
	config_file_info_iter_next :: proc(config: ^Config, iter: ^Config_File_Info_Iter) -> Bool ---
	@(link_name = "FcConfigFileInfoIterGet")
	config_file_info_iter_get :: proc(config: ^Config, iter: ^Config_File_Info_Iter, name: ^cstring, description: ^cstring, enabled: ^Bool) -> Bool ---
	@(link_name = "FcCharSetCreate")
	char_set_create :: proc() -> ^Char_Set ---
	// deprecated alias for FcCharSetCreate
	@(link_name = "FcCharSetNew")
	char_set_new :: proc() -> ^Char_Set ---
	@(link_name = "FcCharSetDestroy")
	char_set_destroy :: proc(fcs: ^Char_Set) ---
	@(link_name = "FcCharSetAddChar")
	char_set_add_char :: proc(fcs: ^Char_Set, ucs4: Char32) -> Bool ---
	@(link_name = "FcCharSetDelChar")
	char_set_del_char :: proc(fcs: ^Char_Set, ucs4: Char32) -> Bool ---
	@(link_name = "FcCharSetCopy")
	char_set_copy :: proc(src: ^Char_Set) -> ^Char_Set ---
	@(link_name = "FcCharSetEqual")
	char_set_equal :: proc(a: ^Char_Set, b: ^Char_Set) -> Bool ---
	@(link_name = "FcCharSetIntersect")
	char_set_intersect :: proc(a: ^Char_Set, b: ^Char_Set) -> ^Char_Set ---
	@(link_name = "FcCharSetUnion")
	char_set_union :: proc(a: ^Char_Set, b: ^Char_Set) -> ^Char_Set ---
	@(link_name = "FcCharSetSubtract")
	char_set_subtract :: proc(a: ^Char_Set, b: ^Char_Set) -> ^Char_Set ---
	@(link_name = "FcCharSetMerge")
	char_set_merge :: proc(a: ^Char_Set, b: ^Char_Set, changed: ^Bool) -> Bool ---
	@(link_name = "FcCharSetHasChar")
	char_set_has_char :: proc(fcs: ^Char_Set, ucs4: Char32) -> Bool ---
	@(link_name = "FcCharSetCount")
	char_set_count :: proc(a: ^Char_Set) -> Char32 ---
	@(link_name = "FcCharSetIntersectCount")
	char_set_intersect_count :: proc(a: ^Char_Set, b: ^Char_Set) -> Char32 ---
	@(link_name = "FcCharSetSubtractCount")
	char_set_subtract_count :: proc(a: ^Char_Set, b: ^Char_Set) -> Char32 ---
	@(link_name = "FcCharSetIsSubset")
	char_set_is_subset :: proc(a: ^Char_Set, b: ^Char_Set) -> Bool ---
	@(link_name = "FcCharSetFirstPage")
	char_set_first_page :: proc(a: ^Char_Set, map_: [^]Char32, next: ^Char32) -> Char32 ---
	@(link_name = "FcCharSetNextPage")
	char_set_next_page :: proc(a: ^Char_Set, map_: [^]Char32, next: ^Char32) -> Char32 ---
	@(link_name = "FcCharSetCoverage")
	char_set_coverage :: proc(a: ^Char_Set, page: Char32, result: ^Char32) -> Char32 ---
	@(link_name = "FcValuePrint")
	value_print :: proc(v: Value) ---
	@(link_name = "FcPatternPrint")
	pattern_print :: proc(p: ^Pattern) ---
	@(link_name = "FcFontSetPrint")
	font_set_print :: proc(s: ^Font_Set) ---
	@(link_name = "FcConfigGetDefaultLangs")
	config_get_default_langs :: proc(config: ^Config) -> ^Str_Set ---
	@(link_name = "FcGetDefaultLangs")
	get_default_langs :: proc() -> ^Str_Set ---
	@(link_name = "FcConfigSetDefaultSubstitute")
	config_set_default_substitute :: proc(config: ^Config, pattern: ^Pattern) ---
	@(link_name = "FcDefaultSubstitute")
	default_substitute :: proc(pattern: ^Pattern) ---
	@(link_name = "FcFileIsDir")
	file_is_dir :: proc(file: cstring) -> Bool ---
	@(link_name = "FcFileScan")
	file_scan :: proc(set: ^Font_Set, dirs: ^Str_Set, cache: ^File_Cache, blanks: ^Blanks, file: cstring, force: Bool) -> Bool ---
	@(link_name = "FcDirScan")
	dir_scan :: proc(set: ^Font_Set, dirs: ^Str_Set, cache: ^File_Cache, blanks: ^Blanks, dir: cstring, force: Bool) -> Bool ---
	@(link_name = "FcDirSave")
	dir_save :: proc(set: ^Font_Set, dirs: ^Str_Set, dir: cstring) -> Bool ---
	@(link_name = "FcDirCacheLoad")
	dir_cache_load :: proc(dir: cstring, config: ^Config, cache_file: ^cstring) -> ^Cache ---
	@(link_name = "FcDirCacheRescan")
	dir_cache_rescan :: proc(dir: cstring, config: ^Config) -> ^Cache ---
	@(link_name = "FcDirCacheRead")
	dir_cache_read :: proc(dir: cstring, force: Bool, config: ^Config) -> ^Cache ---
	@(link_name = "FcDirCacheLoadFile")
	dir_cache_load_file :: proc(cache_file: cstring, file_stat: rawptr) -> ^Cache ---
	@(link_name = "FcDirCacheUnload")
	dir_cache_unload :: proc(cache: ^Cache) ---
	@(link_name = "FcFontSetCreate")
	font_set_create :: proc() -> ^Font_Set ---
	@(link_name = "FcFontSetDestroy")
	font_set_destroy :: proc(s: ^Font_Set) ---
	@(link_name = "FcFontSetAdd")
	font_set_add :: proc(s: ^Font_Set, font: ^Pattern) -> Bool ---
	@(link_name = "FcInitLoadConfig")
	init_load_config :: proc() -> ^Config ---
	@(link_name = "FcInitLoadConfigAndFonts")
	init_load_config_and_fonts :: proc() -> ^Config ---
	@(link_name = "FcInit")
	init :: proc() -> Bool ---
	@(link_name = "FcFini")
	fini :: proc() ---
	@(link_name = "FcGetVersion")
	get_version :: proc() -> c.int ---
	@(link_name = "FcInitReinitialize")
	init_reinitialize :: proc() -> Bool ---
	@(link_name = "FcInitBringUptoDate")
	init_bring_upto_date :: proc() -> Bool ---
	@(link_name = "FcGetLangs")
	get_langs :: proc() -> ^Str_Set ---
	@(link_name = "FcLangNormalize")
	lang_normalize :: proc(lang: cstring) -> cstring ---
	@(link_name = "FcLangGetCharSet")
	lang_get_char_set :: proc(lang: cstring) -> ^Char_Set ---
	@(link_name = "FcLangSetCreate")
	lang_set_create :: proc() -> ^Lang_Set ---
	@(link_name = "FcLangSetDestroy")
	lang_set_destroy :: proc(ls: ^Lang_Set) ---
	@(link_name = "FcLangSetCopy")
	lang_set_copy :: proc(ls: ^Lang_Set) -> ^Lang_Set ---
	@(link_name = "FcLangSetAdd")
	lang_set_add :: proc(ls: ^Lang_Set, lang: cstring) -> Bool ---
	@(link_name = "FcLangSetDel")
	lang_set_del :: proc(ls: ^Lang_Set, lang: cstring) -> Bool ---
	@(link_name = "FcLangSetHasLang")
	lang_set_has_lang :: proc(ls: ^Lang_Set, lang: cstring) -> Lang_Result ---
	@(link_name = "FcLangSetCompare")
	lang_set_compare :: proc(lsa: ^Lang_Set, lsb: ^Lang_Set) -> Lang_Result ---
	@(link_name = "FcLangSetContains")
	lang_set_contains :: proc(lsa: ^Lang_Set, lsb: ^Lang_Set) -> Bool ---
	@(link_name = "FcLangSetEqual")
	lang_set_equal :: proc(lsa: ^Lang_Set, lsb: ^Lang_Set) -> Bool ---
	@(link_name = "FcLangSetHash")
	lang_set_hash :: proc(ls: ^Lang_Set) -> Char32 ---
	@(link_name = "FcLangSetGetLangs")
	lang_set_get_langs :: proc(ls: ^Lang_Set) -> ^Str_Set ---
	@(link_name = "FcLangSetUnion")
	lang_set_union :: proc(a: ^Lang_Set, b: ^Lang_Set) -> ^Lang_Set ---
	@(link_name = "FcLangSetSubtract")
	lang_set_subtract :: proc(a: ^Lang_Set, b: ^Lang_Set) -> ^Lang_Set ---
	@(link_name = "FcObjectSetCreate")
	object_set_create :: proc() -> ^Object_Set ---
	@(link_name = "FcObjectSetAdd")
	object_set_add :: proc(os: ^Object_Set, object: cstring) -> Bool ---
	@(link_name = "FcObjectSetDestroy")
	object_set_destroy :: proc(os: ^Object_Set) ---
	@(link_name = "FcObjectSetVaBuild")
	object_set_va_build :: proc(first: cstring, va: Va_List_Arg) -> ^Object_Set ---
	@(link_name = "FcObjectSetBuild")
	object_set_build :: proc(first: cstring, #c_vararg args: ..any) -> ^Object_Set ---
	@(link_name = "FcFontSetList")
	font_set_list :: proc(config: ^Config, sets: [^]^Font_Set, nsets: c.int, p: ^Pattern, os: ^Object_Set) -> ^Font_Set ---
	@(link_name = "FcFontList")
	font_list :: proc(config: ^Config, p: ^Pattern, os: ^Object_Set) -> ^Font_Set ---
	@(link_name = "FcAtomicCreate")
	atomic_create :: proc(file: cstring) -> ^Atomic ---
	@(link_name = "FcAtomicLock")
	atomic_lock :: proc(atomic: ^Atomic) -> Bool ---
	@(link_name = "FcAtomicNewFile")
	atomic_new_file :: proc(atomic: ^Atomic) -> cstring ---
	@(link_name = "FcAtomicOrigFile")
	atomic_orig_file :: proc(atomic: ^Atomic) -> cstring ---
	@(link_name = "FcAtomicReplaceOrig")
	atomic_replace_orig :: proc(atomic: ^Atomic) -> Bool ---
	@(link_name = "FcAtomicDeleteNew")
	atomic_delete_new :: proc(atomic: ^Atomic) ---
	@(link_name = "FcAtomicUnlock")
	atomic_unlock :: proc(atomic: ^Atomic) ---
	@(link_name = "FcAtomicDestroy")
	atomic_destroy :: proc(atomic: ^Atomic) ---
	@(link_name = "FcFontSetMatch")
	font_set_match :: proc(config: ^Config, sets: [^]^Font_Set, nsets: c.int, p: ^Pattern, result: ^Result) -> ^Pattern ---
	@(link_name = "FcFontMatch")
	font_match :: proc(config: ^Config, p: ^Pattern, result: ^Result) -> ^Pattern ---
	@(link_name = "FcFontRenderPrepare")
	font_render_prepare :: proc(config: ^Config, pat: ^Pattern, font: ^Pattern) -> ^Pattern ---
	@(link_name = "FcFontSetSort")
	font_set_sort :: proc(config: ^Config, sets: [^]^Font_Set, nsets: c.int, p: ^Pattern, trim: Bool, csp: ^^Char_Set, result: ^Result) -> ^Font_Set ---
	@(link_name = "FcFontSort")
	font_sort :: proc(config: ^Config, p: ^Pattern, trim: Bool, csp: ^^Char_Set, result: ^Result) -> ^Font_Set ---
	@(link_name = "FcFontSetSortDestroy")
	font_set_sort_destroy :: proc(fs: ^Font_Set) ---
	@(link_name = "FcMatrixCopy")
	matrix_copy :: proc(mat: ^Matrix) -> ^Matrix ---
	@(link_name = "FcMatrixEqual")
	matrix_equal :: proc(mat1: ^Matrix, mat2: ^Matrix) -> Bool ---
	@(link_name = "FcMatrixMultiply")
	matrix_multiply :: proc(result: ^Matrix, a: ^Matrix, b: ^Matrix) ---
	@(link_name = "FcMatrixRotate")
	matrix_rotate :: proc(m: ^Matrix, cosine: c.double, sine: c.double) ---
	@(link_name = "FcMatrixScale")
	matrix_scale :: proc(m: ^Matrix, sx: c.double, sy: c.double) ---
	@(link_name = "FcMatrixShear")
	matrix_shear :: proc(m: ^Matrix, sh: c.double, sv: c.double) ---
	// Deprecated.  Does nothing.  Returns FcFalse.
	@(link_name = "FcNameRegisterObjectTypes")
	name_register_object_types :: proc(types: [^]Object_Type, ntype: c.int) -> Bool ---
	// Deprecated.  Does nothing.  Returns FcFalse.
	@(link_name = "FcNameUnregisterObjectTypes")
	name_unregister_object_types :: proc(types: [^]Object_Type, ntype: c.int) -> Bool ---
	@(link_name = "FcNameGetObjectType")
	name_get_object_type :: proc(object: cstring) -> ^Object_Type ---
	// Deprecated.  Does nothing.  Returns FcFalse.
	@(link_name = "FcNameRegisterConstants")
	name_register_constants :: proc(consts: [^]Constant, nconsts: c.int) -> Bool ---
	// Deprecated.  Does nothing.  Returns FcFalse.
	@(link_name = "FcNameUnregisterConstants")
	name_unregister_constants :: proc(consts: [^]Constant, nconsts: c.int) -> Bool ---
	@(link_name = "FcNameGetConstant")
	name_get_constant :: proc(string: cstring) -> ^Constant ---
	@(link_name = "FcNameGetConstantFor")
	name_get_constant_for :: proc(string: cstring, object: cstring) -> ^Constant ---
	@(link_name = "FcNameConstant")
	name_constant :: proc(string: cstring, result: ^c.int) -> Bool ---
	@(link_name = "FcNameGetConstantNameFrom")
	name_get_constant_name_from :: proc(object: cstring, value: c.int) -> cstring ---
	@(link_name = "FcNameParse")
	name_parse :: proc(name: cstring) -> ^Pattern ---
	@(link_name = "FcNameUnparse")
	name_unparse :: proc(pat: ^Pattern) -> cstring ---
	@(link_name = "FcPatternCreate")
	pattern_create :: proc() -> ^Pattern ---
	@(link_name = "FcPatternDuplicate")
	pattern_duplicate :: proc(p: ^Pattern) -> ^Pattern ---
	@(link_name = "FcPatternReference")
	pattern_reference :: proc(p: ^Pattern) ---
	@(link_name = "FcPatternFilter")
	pattern_filter :: proc(p: ^Pattern, os: ^Object_Set) -> ^Pattern ---
	@(link_name = "FcValueDestroy")
	value_destroy :: proc(v: Value) ---
	@(link_name = "FcValueEqual")
	value_equal :: proc(va: Value, vb: Value) -> Bool ---
	@(link_name = "FcValueSave")
	value_save :: proc(v: Value) -> Value ---
	@(link_name = "FcPatternDestroy")
	pattern_destroy :: proc(p: ^Pattern) ---
	@(link_name = "FcPatternObjectCount")
	pattern_object_count :: proc(pat: ^Pattern) -> c.int ---
	@(link_name = "FcPatternEqual")
	pattern_equal :: proc(pa: ^Pattern, pb: ^Pattern) -> Bool ---
	@(link_name = "FcPatternEqualSubset")
	pattern_equal_subset :: proc(pa: ^Pattern, pb: ^Pattern, os: ^Object_Set) -> Bool ---
	@(link_name = "FcPatternHash")
	pattern_hash :: proc(p: ^Pattern) -> Char32 ---
	@(link_name = "FcPatternAdd")
	pattern_add :: proc(p: ^Pattern, object: cstring, value: Value, append: Bool) -> Bool ---
	@(link_name = "FcPatternAddWeak")
	pattern_add_weak :: proc(p: ^Pattern, object: cstring, value: Value, append: Bool) -> Bool ---
	@(link_name = "FcPatternGet")
	pattern_get :: proc(p: ^Pattern, object: cstring, id: c.int, v: ^Value) -> Result ---
	@(link_name = "FcPatternGetWithBinding")
	pattern_get_with_binding :: proc(p: ^Pattern, object: cstring, id: c.int, v: ^Value, b: ^Value_Binding) -> Result ---
	@(link_name = "FcPatternDel")
	pattern_del :: proc(p: ^Pattern, object: cstring) -> Bool ---
	@(link_name = "FcPatternRemove")
	pattern_remove :: proc(p: ^Pattern, object: cstring, id: c.int) -> Bool ---
	@(link_name = "FcPatternAddInteger")
	pattern_add_integer :: proc(p: ^Pattern, object: cstring, i: c.int) -> Bool ---
	@(link_name = "FcPatternAddDouble")
	pattern_add_double :: proc(p: ^Pattern, object: cstring, d: c.double) -> Bool ---
	@(link_name = "FcPatternAddString")
	pattern_add_string :: proc(p: ^Pattern, object: cstring, s: cstring) -> Bool ---
	@(link_name = "FcPatternAddMatrix")
	pattern_add_matrix :: proc(p: ^Pattern, object: cstring, s: ^Matrix) -> Bool ---
	@(link_name = "FcPatternAddCharSet")
	pattern_add_char_set :: proc(p: ^Pattern, object: cstring, c: ^Char_Set) -> Bool ---
	@(link_name = "FcPatternAddBool")
	pattern_add_bool :: proc(p: ^Pattern, object: cstring, b: Bool) -> Bool ---
	@(link_name = "FcPatternAddLangSet")
	pattern_add_lang_set :: proc(p: ^Pattern, object: cstring, ls: ^Lang_Set) -> Bool ---
	@(link_name = "FcPatternAddRange")
	pattern_add_range :: proc(p: ^Pattern, object: cstring, r: ^Range) -> Bool ---
	@(link_name = "FcPatternGetInteger")
	pattern_get_integer :: proc(p: ^Pattern, object: cstring, n: c.int, i: ^c.int) -> Result ---
	@(link_name = "FcPatternGetDouble")
	pattern_get_double :: proc(p: ^Pattern, object: cstring, n: c.int, d: ^c.double) -> Result ---
	@(link_name = "FcPatternGetString")
	pattern_get_string :: proc(p: ^Pattern, object: cstring, n: c.int, s: ^cstring) -> Result ---
	@(link_name = "FcPatternGetMatrix")
	pattern_get_matrix :: proc(p: ^Pattern, object: cstring, n: c.int, s: ^^Matrix) -> Result ---
	@(link_name = "FcPatternGetCharSet")
	pattern_get_char_set :: proc(p: ^Pattern, object: cstring, n: c.int, c: ^^Char_Set) -> Result ---
	@(link_name = "FcPatternGetBool")
	pattern_get_bool :: proc(p: ^Pattern, object: cstring, n: c.int, b: ^Bool) -> Result ---
	@(link_name = "FcPatternGetLangSet")
	pattern_get_lang_set :: proc(p: ^Pattern, object: cstring, n: c.int, ls: ^^Lang_Set) -> Result ---
	@(link_name = "FcPatternGetRange")
	pattern_get_range :: proc(p: ^Pattern, object: cstring, id: c.int, r: ^^Range) -> Result ---
	@(link_name = "FcPatternVaBuild")
	pattern_va_build :: proc(p: ^Pattern, va: Va_List_Arg) -> ^Pattern ---
	@(link_name = "FcPatternBuild")
	pattern_build :: proc(p: ^Pattern, #c_vararg args: ..any) -> ^Pattern ---
	@(link_name = "FcPatternFormat")
	pattern_format :: proc(pat: ^Pattern, format: cstring) -> cstring ---
	@(link_name = "FcRangeCreateDouble")
	range_create_double :: proc(begin: c.double, end: c.double) -> ^Range ---
	@(link_name = "FcRangeCreateInteger")
	range_create_integer :: proc(begin: Char32, end: Char32) -> ^Range ---
	@(link_name = "FcRangeDestroy")
	range_destroy :: proc(range_: ^Range) ---
	@(link_name = "FcRangeCopy")
	range_copy :: proc(r: ^Range) -> ^Range ---
	@(link_name = "FcRangeGetDouble")
	range_get_double :: proc(range_: ^Range, begin: ^c.double, end: ^c.double) -> Bool ---
	@(link_name = "FcPatternIterStart")
	pattern_iter_start :: proc(pat: ^Pattern, iter: ^Pattern_Iter) ---
	@(link_name = "FcPatternIterNext")
	pattern_iter_next :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> Bool ---
	@(link_name = "FcPatternIterEqual")
	pattern_iter_equal :: proc(p1: ^Pattern, i1: ^Pattern_Iter, p2: ^Pattern, i2: ^Pattern_Iter) -> Bool ---
	@(link_name = "FcPatternFindIter")
	pattern_find_iter :: proc(pat: ^Pattern, iter: ^Pattern_Iter, object: cstring) -> Bool ---
	@(link_name = "FcPatternIterIsValid")
	pattern_iter_is_valid :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> Bool ---
	@(link_name = "FcPatternIterGetObject")
	pattern_iter_get_object :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> cstring ---
	@(link_name = "FcPatternIterValueCount")
	pattern_iter_value_count :: proc(pat: ^Pattern, iter: ^Pattern_Iter) -> c.int ---
	@(link_name = "FcPatternIterGetValue")
	pattern_iter_get_value :: proc(pat: ^Pattern, iter: ^Pattern_Iter, id: c.int, v: ^Value, b: ^Value_Binding) -> Result ---
	@(link_name = "FcWeightFromOpenType")
	weight_from_open_type :: proc(ot_weight: c.int) -> c.int ---
	@(link_name = "FcWeightFromOpenTypeDouble")
	weight_from_open_type_double :: proc(ot_weight: c.double) -> c.double ---
	@(link_name = "FcWeightToOpenType")
	weight_to_open_type :: proc(fc_weight: c.int) -> c.int ---
	@(link_name = "FcWeightToOpenTypeDouble")
	weight_to_open_type_double :: proc(fc_weight: c.double) -> c.double ---
	@(link_name = "FcStrCopy")
	str_copy :: proc(s: cstring) -> cstring ---
	@(link_name = "FcStrCopyFilename")
	str_copy_filename :: proc(s: cstring) -> cstring ---
	@(link_name = "FcStrPlus")
	str_plus :: proc(s1: cstring, s2: cstring) -> cstring ---
	@(link_name = "FcStrFree")
	str_free :: proc(s: cstring) ---
	@(link_name = "FcStrDowncase")
	str_downcase :: proc(s: cstring) -> cstring ---
	@(link_name = "FcStrCmpIgnoreCase")
	str_cmp_ignore_case :: proc(s1: cstring, s2: cstring) -> c.int ---
	@(link_name = "FcStrCmp")
	str_cmp :: proc(s1: cstring, s2: cstring) -> c.int ---
	@(link_name = "FcStrStrIgnoreCase")
	str_str_ignore_case :: proc(s1: cstring, s2: cstring) -> cstring ---
	@(link_name = "FcStrStr")
	str_str :: proc(s1: cstring, s2: cstring) -> cstring ---
	@(link_name = "FcUtf8ToUcs4")
	utf8_to_ucs4 :: proc(src_orig: [^]u8, dst: ^Char32, len: c.int) -> c.int ---
	@(link_name = "FcUtf8Len")
	utf8_len :: proc(string: [^]u8, len: c.int, nchar: ^c.int, wchar: ^c.int) -> Bool ---
	@(link_name = "FcUcs4ToUtf8")
	ucs4_to_utf8 :: proc(ucs4: Char32, dest: [^]u8) -> c.int ---
	@(link_name = "FcUtf16ToUcs4")
	utf16_to_ucs4 :: proc(src_orig: [^]u8, endian: Endian, dst: ^Char32, len: c.int) -> c.int ---
	@(link_name = "FcUtf16Len")
	utf16_len :: proc(string: [^]u8, endian: Endian, len: c.int, nchar: ^c.int, wchar: ^c.int) -> Bool ---
	@(link_name = "FcStrBuildFilename")
	str_build_filename :: proc(path: cstring, #c_vararg args: ..any) -> cstring ---
	@(link_name = "FcStrDirname")
	str_dirname :: proc(file: cstring) -> cstring ---
	@(link_name = "FcStrBasename")
	str_basename :: proc(file: cstring) -> cstring ---
	@(link_name = "FcStrSetCreate")
	str_set_create :: proc() -> ^Str_Set ---
	@(link_name = "FcStrSetMember")
	str_set_member :: proc(set: ^Str_Set, s: cstring) -> Bool ---
	@(link_name = "FcStrSetEqual")
	str_set_equal :: proc(sa: ^Str_Set, sb: ^Str_Set) -> Bool ---
	@(link_name = "FcStrSetAdd")
	str_set_add :: proc(set: ^Str_Set, s: cstring) -> Bool ---
	@(link_name = "FcStrSetAddFilename")
	str_set_add_filename :: proc(set: ^Str_Set, s: cstring) -> Bool ---
	@(link_name = "FcStrSetDel")
	str_set_del :: proc(set: ^Str_Set, s: cstring) -> Bool ---
	@(link_name = "FcStrSetDestroy")
	str_set_destroy :: proc(set: ^Str_Set) ---
	@(link_name = "FcStrListCreate")
	str_list_create :: proc(set: ^Str_Set) -> ^Str_List ---
	@(link_name = "FcStrListFirst")
	str_list_first :: proc(list: ^Str_List) ---
	@(link_name = "FcStrListNext")
	str_list_next :: proc(list: ^Str_List) -> cstring ---
	@(link_name = "FcStrListDone")
	str_list_done :: proc(list: ^Str_List) ---
	@(link_name = "FcConfigParseAndLoad")
	config_parse_and_load :: proc(config: ^Config, file: cstring, complain: Bool) -> Bool ---
	@(link_name = "FcConfigParseAndLoadFromMemory")
	config_parse_and_load_from_memory :: proc(config: ^Config, buffer: cstring, complain: Bool) -> Bool ---
	@(link_name = "FcConfigFileGenerate")
	config_file_generate :: proc(config: ^Config, pat: ^Pattern, font_path: cstring) -> cstring ---
}

matrix_init :: proc(m: ^Matrix) {
	m^ = Matrix {
		xx = 1,
		yy = 1,
	}
}

is_upper :: proc(ch: c.int) -> bool {
	return 'A' <= ch && ch <= 'Z'
}

is_lower :: proc(ch: c.int) -> bool {
	return 'a' <= ch && ch <= 'z'
}

to_lower :: proc(ch: c.int) -> c.int {
	return is_upper(ch) ? ch - 'A' + 'a' : ch
}
