# Dot Files
I have a love affair with my terminal. This is my collection of
terminal configuration files that (attempt to) make daily use of the
terminal easier, faster, and perhaps even more enjoyable. It's all
about strengthening the bond `;)`.

## Installation ##
Symlink all root level contents (except `localrcs/`) to an
identically-named symlink, preceded with a dot (`.`), in your home
directory.

## Environment ##
Currently targeting primarily Mac OS X with
[Homebrew](http://mxcl.github.com/homebrew). Running with no known
problems on Ubuntu 10.04 Server as well. Bash-only. Likes
[RVM](https://rvm.beginrescueend.com/).

## Notable features ##
### Bash ###
- Intelligent shortening of the current working directory in the prompt
  to prevent the prompt from becoming awkwardly long.
- `extract` command to uncompress most common formats.
- `play` command as a quick shortcut for Emacs games (Tetris, Pong,
  Snake, etc.).
- `pman` & `tman` commands to open a man page in Preview or Textmate,
  respectively.
- Prompt color changes depending on if connection is via SSH or not.

### IRB & Rails ###
- Loads IRB gems (e.g. [Wirble](http://pablotron.org/software/wirble/),
  [Hirb](http://tagaholic.me/2009/03/13/hirb-irb-on-the-good-stuff.html),
  etc.) in the Rails console if they are included in RVM's "global"
  gemset, even if they aren't listed in the current app's Gemfile.

## Credits ##
Original inspiration from [Ryan Bates](https://github.com/ryanb/dotfiles).

Various parts inspired by or adapted from
[Brian Racer](https://github.com/anveo/dotfiles) &
[Todd Werth](https://github.com/twerth/dotfiles).
Other credits not listed here may be noted in comments.
