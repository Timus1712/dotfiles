.PHONY: vim zsh git awesome st

all: vim zsh git awesome st sublime-text-3

vim:
	cd vim && make

zsh:
	cd zsh && make

git:
	cd git && make

awesome:
	cd awesome && make

st:
	cd st && make

sublime-text-3:
	cd sublime-text-3 && make

