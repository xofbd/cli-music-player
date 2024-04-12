SHELL := /bin/bash
outputs := list-albums list-songs play-album play-song

.PHONY: all
all: clean $(outputs)

%: src/%
	bin/compile $^ > $@
	chmod u+x $@

.PHONY: clean
clean:
	rm -f $(outputs) 
