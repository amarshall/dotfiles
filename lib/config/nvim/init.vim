func s:fallback(value, fallback)
  if empty(a:value)
    return a:fallback
  else
    return a:value
  endif
endfunc

func s:xdg_config()
  return s:fallback($XDG_CONFIG_HOME, $HOME . "/.config")
endfunc

execute 'source' . fnameescape(s:xdg_config() . "/dotfiles/vim/config/init.vim")
execute 'source' . fnameescape(s:xdg_config() . "/dotfiles/vim/config/settings.vim")
execute 'source' . fnameescape(s:xdg_config() . "/dotfiles/vim/config/mappings.vim")
execute 'source' . fnameescape(s:xdg_config() . "/dotfiles/vim/config/filetypes.vim")
execute 'source' . fnameescape(s:xdg_config() . "/dotfiles/vim/config/packages.vim")
execute 'source' . fnameescape(s:xdg_config() . "/dotfiles/vim/config/plugins.vim")
