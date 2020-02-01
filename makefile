all: readme.md
readme.md: guessinggame.sh
	@echo "# Guessinggame" > README.md
	@date +"%F %T" >> README.md
	@echo "## The number of lines of code contained in guessinggame.sh is" >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md
clean:
	rm readme.md