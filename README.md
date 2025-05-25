# My dotfiles

## Configs

### Zsh

Minimal config with starship and a few plugins and aliases

![zsh screenshot](./assets/zsh_screenshot.png)

**Requirements**

- git
- fzf > 4.0
- starship

**Usage**

Copy or Link the configuration files

```bash
cp ./config/zshrc ~/.zshrc
cp ./config/profile ~/.profile
cp ./config/starship.toml ~/.config/starship.toml
#or
ln -s "$(realpath ./config/zshrc)" ~/.zshrc
ln -s "$(realpath ./config/profile)" ~/.profile
ln -s "$(realpath ./config/starship.toml)" ~/.config/starship.toml
```

