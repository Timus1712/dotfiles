.PHONY: vim zsh git awesome

all: vim zsh git awesome

vim:
	cd vim && make

zsh:
	cd zsh && make

git:
	cd git && make

awesome:
	cd awesome && make

