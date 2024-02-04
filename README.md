# Dotfiles

My collection of configuration files.

Files are split into top-level directories for easier organization.

## Symlinking

I create symlinks from the locations that would be read to the actual configuration files here. To do this, I use [GNU Stow](https://www.gnu.org/software/stow/).

### Installation

This should be available in your favorite package manager.

Arch Linux:

```bash
sudo pacman -S stow
```

Ubuntu:

```bash
sudo apt install stow
```

### Usage

To apply the configuration files in `./foo_dir` and `./bar_dir`, perform:

```bash
stow -t ~ foo_dir bar_dir
```
