SHELL = bash

PATH := $(PWD)/node_modules/.bin:$(PATH)

outputs = build/fonts build/logo-web.svg \
	$(shell find | grep -vP 'node_modules/|build|.git|^./_' \
		| grep -P '\.(pug|sass|md)$$' \
		| sed 's@\.pug$$@.html@; s@\.md$$@.html@; s@\.sass$$@.css@; s@^@build/@')

.PHONY: all clean

all: $(outputs)
	echo "$(outputs)"

$(outputs): Makefile _meeting.md

clean:
	rm -fvr "build/"*

build/%.html: %.pug _template.pug
	pug < $< > $@

build/%.html: %.md _template.pug
	echo -e                                           \
		"extends _template"                             \
		"\nblock content"                               \
		"\n  include:markdown-it(                       \
				html=true                                   \
				typographer=true                            \
				linkify=true                                \
				quotes=['«\xA0', '\xA0»', '‹\xA0', '\xA0›'] \
				plugins=['markdown-it-include']) $<" \
		| pug -O '{"filename": "$<"}' > $@

build/%.css: %.sass
	node-sass --output-style compressed $< > $@

build/%: %
	cp -rT $< $@
