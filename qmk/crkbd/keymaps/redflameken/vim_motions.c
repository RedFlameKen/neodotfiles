#include "vim_motions.h"
#include QMK_KEYBOARD_H

typedef int bool;

void vim_norm_w(void){
    SEND_STRING(SS_DOWN(X_CTRL) SS_TAP(X_RGHT) SS_UP(X_CTRL));
}

void vim_norm_b(void){
    SEND_STRING(SS_DOWN(X_CTRL) SS_TAP(X_LEFT) SS_UP(X_CTRL));
}

// Change layer to yanker
void vim_norm_y(void){
}

// Change layer to default
void vim_norm_i(bool shifted){
}

void vim_norm_o(bool shifted){
    if(shifted)
        SEND_STRING(SS_TAP(X_END) SS_TAP(X_ENTER));
    else
        SEND_STRING(SS_TAP(X_HOME) SS_TAP(X_ENTER) SS_TAP(X_UP));
}

void vim_norm_p(bool shifted){
    if(shifted)
        SEND_STRING(SS_TAP(X_LEFT) SS_TAP(X_PASTE));
    else
        SEND_STRING(SS_TAP(X_PASTE));
}

// change layer
void vim_norm_a(bool shifted){
}

void vim_norm_s(bool shifted);
void vim_norm_d(bool shifted);
void vim_norm_g(bool shifted);
void vim_norm_c(bool shifted);
void vim_norm_v(bool shifted);
void vim_undo(void);
void vim_redo(void);

