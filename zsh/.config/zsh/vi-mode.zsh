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
