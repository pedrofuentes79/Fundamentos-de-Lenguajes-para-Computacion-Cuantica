# LaTeX compilation Makefile

# Main document name (without .tex extension)
DOC = informe

# Default target
all: $(DOC).pdf

# Compile PDF
$(DOC).pdf: $(DOC).tex
	pdflatex $(DOC).tex
	pdflatex $(DOC).tex  # Run twice for cross-references

# Clean auxiliary files
clean:
	rm -f $(DOC).aux $(DOC).log $(DOC).out $(DOC).toc $(DOC).lof $(DOC).lot

# Clean all generated files
cleanall: clean
	rm -f $(DOC).pdf

# View PDF (requires a PDF viewer)
view: $(DOC).pdf
	xdg-open $(DOC).pdf &

# Continuous compilation (requires inotify-tools)
watch:
	while true; do \
		inotifywait -e modify $(DOC).tex; \
		make; \
	done

.PHONY: all clean cleanall view watch
