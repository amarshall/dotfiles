# Dot Files #
I have a love affair with my terminal. This is my collection of
terminal configuration files that (attempt to) make daily use of the
terminal easier, faster, and perhaps even more enjoyable. It’s all
about strengthening the bond `;)`.

## Installation ##
Symlink all root level contents (except `localrcs/`) to an
identically-named symlink, preceded with a dot (`.`), in your home
directory.

## Environment ##
Currently targeting primarily Mac OS X with
[Homebrew](http://mxcl.github.com/homebrew). Running with no known
problems on Ubuntu 10.04 Server as well. Likes
[RVM](https://rvm.beginrescueend.com/).

Originally Bash-only, but since have added ZSH support. Most of the
Bash features and configuration have been ported over, though the ZSH
prompt intentionally stands in stark contrast to the Bash prompt. That
may be backported to the Bash configuration, though.

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

### Bash & ZSH ###
- `extract` command to uncompress most common formats.
- `play` command as a quick shortcut for Emacs games (Tetris, Pong,
  Snake, etc.).
- `pman` & `tman` commands to open a man page in Preview or Textmate,
  respectively (Mac only).

### IRB & Rails ###
- Loads IRB gems (e.g. [Wirble](http://pablotron.org/software/wirble/),
  [Hirb](http://tagaholic.me/2009/03/13/hirb-irb-on-the-good-stuff.html),
  etc.) in the Rails console if they are included in RVM’s “global”
  gemset, even if they aren’t listed in the current app’s Gemfile.

## Credits ##
Original inspiration from [Ryan Bates](https://github.com/ryanb/dotfiles).

Various parts inspired by or adapted from
[Brian Racer](https://github.com/anveo/dotfiles) &
[Todd Werth](https://github.com/twerth/dotfiles).
Other credits not listed here may be noted in comments.
