# nvm, lazy-loaded: sourcing nvm.sh costs ~400ms per shell, so only put the
# default node on PATH now and load nvm itself the first time `nvm` is run.
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] || return 0

_nvm_default=$(<"$NVM_DIR/alias/default") 2>/dev/null
_nvm_bins=("$NVM_DIR"/versions/node/v${_nvm_default#v}*/bin(Nn))
# Default alias isn't a plain version (e.g. lts/*): fall back to newest installed
(( $#_nvm_bins )) || _nvm_bins=("$NVM_DIR"/versions/node/v*/bin(Nn))
(( $#_nvm_bins )) && path=("$_nvm_bins[-1]" $path)
unset _nvm_default _nvm_bins

nvm() {
    unfunction nvm
    source "$NVM_DIR/nvm.sh" --no-use
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
    nvm "$@"
}
