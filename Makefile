SHELL := /bin/bash
BUILD_DIR := build

sources := $(filter-out %.sh _%, $(notdir $(wildcard src/*)))
outputs := $(addprefix $(BUILD_DIR)/, $(sources))
libraries := $(wildcard src/*.sh)

.PHONY: all
all: clean $(outputs)

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%: src/% $(libraries) | $(BUILD_DIR)
	bin/compile $< > $@
	chmod u+x $@

.PHONY: install
install: $(outputs)
	cp $(outputs) $(HOME)/bin

.PHONY: tests
tests: $(outputs)
	tests/test-songs
	tests/test-albums

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
