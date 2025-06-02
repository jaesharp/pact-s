.PHONY: all clean

# Directory structure
SRCDIR = src
BUILDDIR = build
TEXFILES = $(wildcard $(SRCDIR)/*.tex)
PDFFILES = $(TEXFILES:$(SRCDIR)/%.tex=$(BUILDDIR)/%.pdf)

# Tectonic configuration
TECTONIC = tectonic
TECTONIC_OPTS = --keep-intermediates --reruns 0

# Default target
all: $(PDFFILES)

# Create build directory if it doesn't exist
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Build PDF files
$(BUILDDIR)/%.pdf: $(SRCDIR)/%.tex | $(BUILDDIR)
	$(TECTONIC) $(TECTONIC_OPTS) -o $(BUILDDIR) $<

# Clean build files
clean:
	rm -rf $(BUILDDIR)/*

# Watch for changes and rebuild
watch:
	while true; do \
		make all; \
		inotifywait -qre close_write $(SRCDIR); \
	done 