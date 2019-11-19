ifeq ($(THEME),)
	THEME="mlean"
endif

ifeq ($(MARKDOWN_FILE),)
	MARKDOWN_FILE=content/content.md
endif

ifeq ($(TITLE),)
	TITLE=PRESENTATION
endif

all: compile

ss:
	@echo "$(TITLE)"
compile:
	@pandoc -t html5  --template=./template-index.html \
		--standalone --section-divs  --variable transition="linear" \
		--variable title="$(TITLE)" \
		--variable theme="$(THEME)" ./$(MARKDOWN_FILE)  \
		-f markdown_phpextra+pipe_tables+auto_identifiers+pandoc_title_block \
		-o ./index.html
	@sed -i -f ./lib/sed/html.sed ./index.html


autocompile:
	@while inotifywait -qq -e modify,create,delete -r $(MARKDOWN_FILE);do make compile;done

html:
	@pandoc -t html5  \
		./$(MARKDOWN_FILE)  \
		-f markdown_phpextra+pipe_tables+auto_identifiers+pandoc_title_block \
		-o ./breafing.html

build:
	tar czf presentation.tgz \
		./images \
		./css/ \
		./js/ \
		./lib/ \
		./plugin/ \
		./index.html
