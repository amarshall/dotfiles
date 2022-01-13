nix_init=~/.nix-profile/etc/profile.d/nix.sh

if [[ -e $nix_init ]]; then
  source "$nix_init"
fi
