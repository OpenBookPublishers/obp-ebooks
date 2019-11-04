
# N.B.: `$@` is the file to be generated
#       `$<` is the inputs used to generate it
#       `$^` is also the inputs used to generate it


SOURCE := book.indd
FORMATS := book.pdf book.epub book.mobi
OUTPUT := output
TARGETS := $(patsubst %, $(OUTPUT)/%, $(FORMATS))

all: $(TARGETS)

install:
	echo TBD

$(OUTPUT)/book.epub: ./book.epub
	cp book.epub repos/obp-epub-fixup/
	bash repos/obp-epub-fixup/run book
	cp repos/obp-epub-fixup/book_new.epub output
#	bin/fixup-epub $< > $@

$(OUTPUT)/book.xml: $(OUTPUT)/book.epub
	bin/epub2xml $< -o $@

$(OUTPUT)/book.mobi: ./book.epub
	bin/epub2mobi $< > $@

.PHONY: clean check bundle

clean:
	bash repos/obp-epub-fixup/clean -y
#	rm -f -- $(TARGETS)

# TODOs:

# "EPub-rough" -> # manual, to be scripted
#  EPub -> XML; # obp-gen-xml
#  EPub -> Mobi # calibre-mobigen
#  EPub -> HTMLreader # obp-gen-readers
#  PDFi -> PDFreader # obp-gen-readers
#  PDFi -> "Chapter PDFs" # chapter-splitter
