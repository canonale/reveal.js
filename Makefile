FOLDER=.
MARKDOWN_FILE=content/content.md
THEME=mlean
TITLE=TITLE

all: compile

compile:
	@pandoc -t html5  --template=./$(FOLDER)/template-index.html \
		--standalone --section-divs  --variable transition="linear" \
		--variable title="$(TITLE)" \
		--variable theme="$(THEME)" ./$(MARKDOWN_FILE)  \
		-f markdown_phpextra+pipe_tables+auto_identifiers+pandoc_title_block \
		-o $(FOLDER)/index.html
	@sed -i -f $(FOLDER)/lib/sed/html.sed $(FOLDER)/index.html

html:
	@pandoc -t html5  \
		./$(MARKDOWN_FILE)  \
		-f markdown_phpextra+pipe_tables+auto_identifiers+pandoc_title_block \
		-o ./breafing.html

build:
	tar czf $(FOLDER).tgz \
		$(FOLDER)/images \
		$(FOLDER)/css/ \
		$(FOLDER)/js/ \
		$(FOLDER)/lib/ \
		$(FOLDER)/plugin/ \
		$(FOLDER)/index.html
