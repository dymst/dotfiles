.PHONY: all install uninstall

all: install

install:
	@echo "Installing dotfiles..."
	mkdir -p $(HOME)/.config/herdr
	cp .tmux.conf $(HOME)/.tmux.conf
	cp .vimrc $(HOME)/.vimrc
	cp .lldbinit $(HOME)/.lldbinit
	cp herdr/config.toml $(HOME)/.config/herdr/config.toml
	rm -rf $(HOME)/.config/nvim
	cp -R nvim $(HOME)/.config/nvim
	@echo "Installation complete!"

uninstall:
	@echo "Uninstalling dotfiles..."
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.lldbinit
	rm -rf $(HOME)/.config/nvim
	rm -f $(HOME)/.config/herdr/config.toml
	@echo "Uninstallation complete!"
