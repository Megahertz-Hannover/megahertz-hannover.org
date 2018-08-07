SHELL = bash

PATH := $(PWD)/node_modules/.bin:$(PATH)


outputs = \
	$(shell find site/ -type f          \
		| grep -vP '/_'                   \
		| grep '^site/[a-zA-Z_-./0-9]*$$'    \
		| sed 's@\.pug$$@.html@; s@\.md$$@.html@; s@\.sass$$@.css@; s@^site/@build/@')

.PHONY: all clean

all: $(outputs)

clean:
	rm -fvr "build/"*

build/%.html: site/%.pug site/_template.pug
	@mkdir -p $(shell dirname $@)
	cd "site" && pug < $< > ../$@ -O '{"basedir": ".", "filename": "."}'

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
			| pug > ../$@ -O '{"basedir": ".", "filename": "."}'

build/%.css: site/%.sass
	@mkdir -p $(shell dirname $@)
	node-sass --output-style compressed $< > $@

build/%: site/%
	@mkdir -p $(shell dirname $@)
	cp $< $@

$(outputs): Makefile
site/index.md site/kontakt.md: site/_meeting.md
