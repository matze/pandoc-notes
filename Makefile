OUTPUT=notes.html
STYLESHEET=notes.css
TEMPLATE=notes-template.html

$(OUTPUT): *.md $(STYLESHEET) $(TEMPLATE)
	pandoc -s -S --toc --template=$(TEMPLATE) -c $(STYLESHEET) *.md > $(OUTPUT)

push: $(OUTPUT)
	scp notes.html bloerg.net:/srv/www/blog

clean:
	rm -f $(OUTPUT)
