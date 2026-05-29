# Load modular zsh config
for _zsh_config in ~/.zsh/*.zsh(N); do
  source "$_zsh_config"
done
unset _zsh_config

# Profile-specific configs
for _profile in ~/.akj_profiles/*(N); do
  source "$_profile"
done
unset _profile

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
