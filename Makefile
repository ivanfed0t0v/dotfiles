default: help

alacritty: ## Install config for Alacritty term
	@echo Installing config for Alacritty
	rm -rf ~/.config/alacritty
	ln -s $(PWD)/alacritty ~/.config/

desktop:
	@echo Installing .desktop files to run wayland apps
	mkdir -p ~/.local/share/applications
	ln -sf $(PWD)/desktop/firefox-wl.desktop ~/.local/share/applications
	ln -sf $(PWD)/desktop/telegramdesktop-wl.desktop ~/.local/share/applications

fonts: ## Install beautiful fonts for the user
	@echo Installing fonts
	mkdir -p ~/.local/share/fonts
	curl -fLo /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip
	unzip -o /tmp/font.zip -d ~/.local/share/fonts
	fc-cache -vf ~/.local/share/fonts

sway: ## Install config for Sway
	@echo Installing config for Sway
	rm -rf ~/.config/sway
	ln -s $(PWD)/sway ~/.config/

termite:
	@echo Installing config for Termite
	rm -rf ~/.config/termite
	ln -s $(PWD)/termite ~/.config/

vscode: ## Install config for Visual Studio Code
	@echo Installing config for Visual Studio Code
	ln -fs $(PWD)/Code/settings.json ~/.config/Code/User/

waybar: ## Install config for Waybar
	@echo Installing config for Waybar
	rm -rf ~/.config/waybar
	ln -s $(PWD)/waybar ~/.config/

zsh: ## Install config for ZSH
	@echo Installing .zshrc and oh-my-zsh
	sh -c "`curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh`"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	ln -fs $(PWD)/zsh/.zshrc ~/.zshrc
	rm ~/.zshrc.pre-oh-my-zsh

.PHONY: help alacritty desktop fonts sway termite vscode waybar zsh

help: ## Show help topics
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
