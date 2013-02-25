# Dot Files #
I have a love affair with my terminal. This is my collection of
terminal configuration files that (attempt to) make daily use of the
terminal easier, faster, and perhaps even more enjoyable. It’s all
about strengthening the bond `;)`.

## Installation ##
Clone the repository, `cd` into its directory, then run `./install.sh`.

## Environment ##
Currently targeting primarily Mac OS X with
[Homebrew](http://mxcl.github.com/homebrew). Running with no known
problems on Ubuntu 10.04 Server as well. Likes
[rbenv](https://github.com/sstephenson/rbenv) &
[RVM](https://rvm.beginrescueend.com/). Designed to not load/set items
that are irrelevant on the current platform.

## Customizing ##
Bash, Zsh, & Vim all support "localrc" files in the home directory which are
loaded after all other configuration:

- Bash: `.bashrc_local`
- Zsh: `.zshrc_local`
- Bash & Zsh: `.sh_common_local`
- Vim: `.vimrc_local`

The preferred method of achieving this is by placing the files in the `localrcs`
directory, prefixed with your machine's name (as displayed by `hostname`). When
running the install script these will automatically be linked accordingly. This
allows machine-specific configuration.

## Notable features ##
There’s a lot more than what is listed here, as there are too many
small features to list. Explore the code to find everything.

### Bash ###
- Intelligent shortening of the current working directory in the prompt
  to prevent the prompt from becoming awkwardly long.
- Prompt color changes depending on if connection is via SSH or not.

### ZSH ###
- Minimalist prompt. Doesn’t display directory if home, doesn’t display
  username if it’s your own, doesn’t display machine name if local
  (since hopefully you know what machine you’re on then).
- `c` command for quick switching to code projects (in multiple
  directories), with tab-completion.
- On OS X Lion, includes a port of Bash’s copying of the current
  directory when opening a new tab in Terminal.app.

### Bash & ZSH ###
- `extract` command to uncompress most common formats.
- `play` command as a quick shortcut for Emacs games (Tetris, Pong,
  Snake, etc.).
- `pman` command to open a man page in Preview,
  respectively (Mac only).

## License & Credits ##
Copyright © 2011–2013 J. Andrew Marshall. License is available in the LICENSE file.

Original inspiration from [Ryan Bates](https://github.com/ryanb/dotfiles).

Various parts inspired by or adapted from
[Brian Racer](https://github.com/anveo/dotfiles),
[Todd Werth](https://github.com/twerth/dotfiles),
[Gary Bernhardt](https://github.com/garybernhardt/dotfiles), &
[Pivotal Labs](https://github.com/pivotal/vim-config)/[Case Commons](https://github.com/Casecommons/vim-config).
Other credits not listed here may be noted in comments.
