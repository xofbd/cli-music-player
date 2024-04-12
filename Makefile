SHELL := /bin/bash
BUILD_DIR := build

sources := $(filter-out %.sh _%, $(notdir $(wildcard src/*)))
outputs := $(addprefix $(BUILD_DIR)/, $(sources))

.PHONY: all
all: clean $(outputs)

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%: src/% | $(BUILD_DIR)
	bin/compile $^ > $@
	chmod u+x $@

.PHONY: install
install: $(outputs)
	cp $(outputs) $(HOME)/bin

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
