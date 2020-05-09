# Dotfiles

I have a love affair with my terminal. This is my collection of terminal configuration files that (attempt to) make daily use of the terminal easier, faster, and perhaps even more enjoyable. It’s all about strengthening the bond `;)`.

## Installation

Run `./bin/install`. Rerun whenever updating, as configuration files are locked at the last run time.

### Git identities

In order to facilitate using multiple identities for Git, identity-specific configuration is omitted from the default global Git config. Instead, create a file alongside the config file (in `$XDG_CONFIG_HOME/git/`) named `identities` akin to:

```gitconfig
[identity "personal"]
  name = John Doe
  email = john@home.example
[identity "work"]
  name = John Doe
  email = john@work.example
  sshIdentity = ~/.ssh/work/id_rsa
```

Then use `git identity` passing the identity name to set in the local, per-repository configuration.

## Recommended CLI software

### Battle-tested

- [csvkit](https://csvkit.readthedocs.io) (utilities for working with CSV files)
- [fd](https://github.com/sharkdp/fd) (replacement for `find`)
- [fzf](https://github.com/junegunn/fzf) (fuzzy finder)
- [neovim](https://neovim.io/) (replacement for vim)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (replacement for `ag`, `ack`, `grep`)
- [tig](https://jonas.github.io/tig/) (GUI front-end for Git)

### Incubating

- [entr](http://www.entrproject.org/) (file watcher)
- [exa](https://the.exa.website/) (replacement for `ls`)
- [fzz](https://github.com/mrnugget/fzz) (interactively rerun commands)
- [noti](https://github.com/variadico/noti) (cross-platform notifications)
- [rat](https://github.com/ericfreese/rat) (build GUIs from command pipelines)

## License & Credits

Copyright © 2011–Present J. Andrew Marshall. License is available in the LICENSE file.

Original inspiration from [Ryan Bates](https://github.com/ryanb/dotfiles).

Various parts inspired by or adapted from
[Brian Racer](https://github.com/anveo/dotfiles),
[Todd Werth](https://github.com/twerth/dotfiles),
[Gary Bernhardt](https://github.com/garybernhardt/dotfiles), &
[Pivotal Labs](https://github.com/pivotal/vim-config)/[Case Commons](https://github.com/Casecommons/vim-config).
Other credits not listed here may be noted in comments.
