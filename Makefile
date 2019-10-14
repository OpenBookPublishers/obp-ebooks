
FORMATS := book.pdf book.epub book.mobi
TARGETS := $(patsubst %, output/%, $(FORMATS))

all: $(TARGETS)

install:
	echo TBD

clean:
	rm -f -- $(TARGETS)
