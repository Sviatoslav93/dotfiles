zvm_config() {
    ZVM_INIT_MODE=sourcing
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
    ZVM_CURSOR_STYLE_ENABLED=true
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
    ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

zvm_after_lazy_keybindings() {
    zvm_bindkey vicmd 'H' vi-digit-or-beginning-of-line
    zvm_bindkey vicmd 'L' vi-end-of-line
    zvm_bindkey visual 'H' vi-digit-or-beginning-of-line
    zvm_bindkey visual 'L' vi-end-of-line
}

zvm_after_select_vi_mode() {
    local color
    case $ZVM_MODE in
        $ZVM_MODE_NORMAL) color='#a6e3a1' ;;
        $ZVM_MODE_VISUAL|$ZVM_MODE_VISUAL_LINE) color='#f9e2af' ;;
        $ZVM_MODE_REPLACE) color='#b4befe' ;;
        *) color='#cba6f7' ;;
    esac
    printf '\e]12;%s\a' "$color"
}

zshexit() {
    printf '\e]112\a'
}
