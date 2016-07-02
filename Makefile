PREFIX = /usr

PROGRAM = commandlinefu

build:

install:
	install -m 0755 $(PROGRAM).sh $(PREFIX)/bin/$(PROGRAM)
