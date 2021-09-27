SHELL = bash

PATH := $(PWD)/node_modules/.bin:$(PATH)


outputs = \
	$(shell find site/ -type f          \
		| grep -viP '/_'                   \
		| grep -iP '^site/[a-z0-9./_-]*$$'    \
		| sed 's@\.pug$$@.html@; s@\.md$$@.html@; s@\.sass$$@.css@; s@^site/@build/@')

.PHONY: all clean

all: $(outputs)

clean:
	rm -fvr "build/"*

build/%.html: site/%.pug site/_template.pug
	@mkdir -p $(shell dirname $@)
	cd "site" && pug3 < $< > ../$@ -O '{"basedir": ".", "filename": "."}'

build/%.html: site/%.md site/_template.pug
	@mkdir -p $(shell dirname $@)
	cd site && echo -e                                \
		"extends _template"                             \
		"\nblock content"                               \
		"\n  include:markdown-it(                       \
				html=true                                   \
				typographer=true                            \
				linkify=true                                \
				quotes=['«\xA0', '\xA0»', '‹\xA0', '\xA0›'] \
				plugins=['markdown-it-include']) $*.md"     \
			| pug3 > ../$@ -O '{"basedir": ".", "filename": "."}'

build/%.css: site/%.sass
	@mkdir -p $(shell dirname $@)
	node-sass --output-style compressed $< > $@

build/%: site/%
	@mkdir -p $(shell dirname $@)
	cp $< $@

$(outputs): Makefile
site/index.md site/kontakt.md: site/_meeting.md

site/index.md: site/_meeting.md
site/kontakt.md: site/_meeting.md
site/english.md: site/_meeting_en.md
