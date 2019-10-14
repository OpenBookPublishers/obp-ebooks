
SOURCE := book.indd
FORMATS := book.pdf book.epub book.mobi
OUTPUT := output
TARGETS := $(patsubst %, $(OUTPUT)/%, $(FORMATS))

all: $(TARGETS)

install:
	echo TBD

$(OUTPUT)/book.epub: ./book.epub
	bin/fixup-epub $< > $@

$(OUTPUT)/book.xml: $(OUTPUT)/book.epub
	bin/epub2xml $< -o $@

$(OUTPUT)/book.mobi: ./book.epub
	bin/epub2mobi $< > $@


clean:
	rm -f -- $(TARGETS)
