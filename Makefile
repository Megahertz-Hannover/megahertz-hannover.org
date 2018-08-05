PATH := $(PWD)/node_modules/.bin:$(PATH)

outputs = build/fonts build/logo-web.svg \
	$(shell find | grep -vP 'node_modules/|build|.git' \
		| grep -P '\.(pug|sass)$$' \
		| sed 's@\.pug$$@.html@; s@\.sass$$@.css@; s@^@build/@')

.PHONY: all clean

all: $(outputs)
	echo "$(outputs)"

clean:
	rm -fvr "build/"*

build/%.html: %.pug
	pug < $< > $@

build/%.css: %.sass
	node-sass --output-style compressed $< > $@

build/%: %
	cp -r $< $@
