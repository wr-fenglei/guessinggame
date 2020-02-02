all: readme.md
readme.md: guessinggame.sh
	@echo "# Guessinggame" > README.md
	@date +"%F %T" >> README.md
	@echo "## The number of lines of code contained in guessinggame.sh is" >> README.md
	@wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md
	@echo "README.md is created."
clean:
	@[ -f ./README.md ] && rm README.md || true && echo "clean succeeded"