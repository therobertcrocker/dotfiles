# dotfiles

Robert's personal shell setup for every VS Code devcontainer: zsh, and a starship prompt with the pastel-powerline preset plus a container module.

Project repos don't carry any of this. VS Code clones this repo into each new container and runs `install.sh`.

<br/>
<br/>

# Setup

Add these lines to your VS Code **user** settings (on the host, not in a project):

```json
"dotfiles.repository": "therobertcrocker/dotfiles",
"dotfiles.targetPath": "~/dotfiles",
"dotfiles.installCommand": "install.sh"
```

They apply when a container is **created**, so rebuild an open container to pick them up.

<br/>

## Files

- **`install.sh`** — installs zsh and starship if they're missing, copies the prompt config, adds the starship init line to `~/.zshrc`, and makes zsh the login shell. Safe to run more than once
- **`starship.toml`** — the prompt config. Edit it here, not in `~/.config/`, or the next container loses the change

The prompt glyphs need a Nerd Font in the **host** terminal (the VS Code terminal font setting). The container can't fix that.
