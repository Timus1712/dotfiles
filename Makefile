.PHONY: vim zsh git awesome st sublime-text-3 roxterm

all: vim zsh git awesome st sublime-text-3 roxterm

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

roxterm:
	cd roxterm && make
