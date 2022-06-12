SHELL := /bin/sh
.ONESHELL:
.SHELLFLAGS: -euo
.DEFAULT_GOAL: help
.NOTPARALLEL:
.POSIX:

#

# set default CMake generator
ifeq ($(OS),Windows_NT)
	export CMAKE_GENERATOR ?= Visual Studio 17 2022
else ifeq ($(shell uname -s),Darwin)
	export CMAKE_GENERATOR ?= Xcode
else # Linux
	export CMAKE_GENERATOR ?= Ninja
endif

CMAKE ?= cmake
RM ?= $(CMAKE) -E rm -rf

override DOTFILES_ROOT = $(patsubst %/,%,$(strip $(dir $(realpath $(firstword $(MAKEFILE_LIST))))))

BUILDS_DIR ?= $(DOTFILES_ROOT)/Builds

#

.PHONY: help
help:  ## Print this message
	@grep -E '^[a-zA-Z_-]+:.*?\#\# .*$$' $(DOTFILES_ROOT)/Makefile | sort | awk 'BEGIN {FS = ":.*?\#\# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#

$(BUILDS_DIR):
	$(CMAKE) -S $(DOTFILES_ROOT) -B $(BUILDS_DIR)

.PHONY: config
config: $(BUILDS_DIR) ## Configure cmake

#

.PHONY: open
open: config ## Open the dotfiles in an IDE
	$(CMAKE) --open $(BUILDS_DIR)

#

.PHONY: clean
clean: ## Clean the source tree
	$(RM) $(BUILDS_DIR)
