.PHONY: all default prebuild

default: all

prebuild:
	-cp -a  book/*/images/* images/

html: prebuild
	bundle exec asciidoctor -D builds caddy-book.asc

epub3: prebuild
	bundle exec asciidoctor-epub3 -D builds caddy-book.asc

epub3-kf8: prebuild
	bundle exec asciidoctor-epub3 -a ebook-format=kf8 -D builds caddy-book.asc

pdf: prebuild
	bundle exec asciidoctor-pdf -D builds caddy-book.asc 2>/dev/null

all: pdf epub3-kf8 epub3 html
