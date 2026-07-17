.PHONY: all install uninstall tmux vim lldb herdr nvim uninstall-tmux uninstall-vim uninstall-lldb uninstall-herdr uninstall-nvim

all: install

install: tmux vim lldb herdr nvim
	@echo "Installation complete!"

uninstall: uninstall-tmux uninstall-vim uninstall-lldb uninstall-herdr uninstall-nvim
	@echo "Uninstallation complete!"

tmux:
	@echo "Installing tmux config..."
	cp .tmux.conf $(HOME)/.tmux.conf

uninstall-tmux:
	@echo "Uninstalling tmux config..."
	rm -f $(HOME)/.tmux.conf

vim:
	@echo "Installing vim config..."
	cp .vimrc $(HOME)/.vimrc

uninstall-vim:
	@echo "Uninstalling vim config..."
	rm -f $(HOME)/.vimrc

lldb:
	@echo "Installing lldb config..."
	cp .lldbinit $(HOME)/.lldbinit

uninstall-lldb:
	@echo "Uninstalling lldb config..."
	rm -f $(HOME)/.lldbinit

herdr:
	@echo "Installing herdr config..."
	mkdir -p $(HOME)/.config/herdr
	cp herdr/config.toml $(HOME)/.config/herdr/config.toml

uninstall-herdr:
	@echo "Uninstalling herdr config..."
	rm -f $(HOME)/.config/herdr/config.toml

nvim:
	@echo "Installing neovim config..."
	mkdir -p $(HOME)/.config
	rm -rf $(HOME)/.config/nvim
	cp -R nvim $(HOME)/.config/nvim

uninstall-nvim:
	@echo "Uninstalling neovim config..."
	rm -rf $(HOME)/.config/nvim
