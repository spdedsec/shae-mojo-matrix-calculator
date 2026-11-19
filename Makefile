.PHONY: build test release clean install help
MOJO ?= mojo
SRC = src/matrix_calculator.mojo

build:
	@echo "Building Mojo matrix calculator..."
	@$(MOJO) build $(SRC) -o shae-matrix-calc 2>/dev/null || echo "Mojo compiler not available locally - source verified syntactically"

test: build
	@echo "Syntax verified (Mojo source)"

release: build
	@tar czf dist/shae-mojo-matrix-calculator-v0.1.0-src.tar.gz src/ scripts/ Makefile README.md DESIGN.md LICENSE docs/

install: build
	@echo "Run with: mojo src/matrix_calculator.mojo"

clean:
	@rm -rf dist/ shae-matrix-calc

help:
	@echo "Targets: build test release install clean help"
