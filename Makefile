.PHONY: vim zsh git awesome st

all: vim zsh git awesome st

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

