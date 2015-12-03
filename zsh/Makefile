install:
	rm -rf ~/.zshrc ~/.oh-my-zsh
	ln -s `pwd`/zshrc ~/.zshrc
	ln -s `pwd`/oh-my-zsh ~/.oh-my-zsh
	cd ~/.oh-my-zsh/custom/plugins/ && rm -rf zsh-syntax-highlighting && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
	cd ~/.oh-my-zsh/custom/plugins/ && rm -rf zsh-completions && git clone https://github.com/zsh-users/zsh-completions
