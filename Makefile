OUTPUT=notes.html
STYLESHEET=notes.css
TEMPLATE=notes-template.html
DEST=bloerg.net:/srv/www/blog

$(OUTPUT): *.md $(STYLESHEET) $(TEMPLATE)
	pandoc -s -S --toc --template=$(TEMPLATE) -c $(STYLESHEET) *.md > $(OUTPUT)

push: $(OUTPUT)
	scp $(OUTPUT) $(DEST)
	scp $(STYLESHEET) $(DEST)

clean:
	rm -f $(OUTPUT)
