#include "keycodes.h"
#include "quantum_keycodes.h"
#include QMK_KEYBOARD_H
#include "process_tap_dance.h"
#include "layers.h"
#include "transactions.h"

#define BRIGHTNESS_STEP 64

enum custom_keycodes {
    HLD_MOUSE = SAFE_RANGE,
    RLS_MOUSE,
    BRT_RAISE,
    BRT_LOWER,
};

enum tap_dance_keys {
    TD_MOUSEALT_MOD,
};

tap_dance_action_t tap_dance_actions[] = {
    [TD_MOUSEALT_MOD] = ACTION_TAP_DANCE_DOUBLE(KC_LCTL, KC_LGUI),
};

#define CTL_GUI TD(TD_MOUSEALT_MOD)


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWERTY] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                         KC_Y,     KC_U,   KC_I,    KC_O,    KC_P,    KC_LALT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     KC_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                         KC_H,     KC_J,   KC_K,    KC_L,    KC_SCLN, KC_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                         KC_N,     KC_M,   KC_COMM, KC_DOT,  KC_SLSH, MO(_MEDIA),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         CTL_GUI, MO(_SYMBOLS),KC_SPC, KC_ENT,  KC_BSPC, KC_LGUI
                                      //`--------------------------'  `--------------------------'
  ),
    [_COLEMAK] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     KC_TAB,  KC_Q,    KC_W,    KC_F,    KC_P,    KC_B,                         KC_J,     KC_L,   KC_U,    KC_Y,    KC_SCLN, KC_LALT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     KC_ESC,  KC_A,    KC_R,    KC_S,    KC_T,    KC_G,                         KC_M,     KC_N,   KC_E,    KC_I,    KC_O,    KC_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_D,    KC_V,                         KC_K,     KC_H,   KC_COMM, KC_DOT,  KC_SLSH, MO(_MEDIA),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         CTL_GUI, MO(_SYMBOLS),KC_SPC, KC_ENT,  KC_BSPC, KC_LGUI
                                      //`--------------------------'  `--------------------------'
  ),

    [_MOUSE] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     KC_TAB,  _______, _______, _______, _______, _______,                      MS_WHLU, XXXXXXX, MS_UP,   XXXXXXX, XXXXXXX, MS_ACL2,
  //|--------+--------+--------+--------+--------+--------|                 |--------+--------+--------+--------+--------+--------|
     KC_ESC,  _______, _______, _______, _______, _______,                      MS_WHLD, MS_LEFT, MS_DOWN, MS_RGHT, KC_LGUI, MS_ACL1,
  //|--------+--------+--------+--------+--------+--------|                 |--------+--------+--------+--------+--------+--------|
     KC_LSFT, _______, _______, _______, _______, _______,                      MS_WHLL, MS_WHLR, MS_BTN4, MS_BTN5, TG(_MOUSE),MS_ACL0,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         CTL_GUI,MO(_MOUSEALT),KC_SPC, MS_BTN1, MS_BTN2, MS_BTN3
                                      //`--------------------------'  `--------------------------'
  ),

    [_SYMBOLS] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_DEL, KC_EXLM, KC_AT,   KC_HASH,  KC_DLR, KC_PERC,                      KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_RALT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+-------+--
      KC_ESC, KC_1,    KC_2,    KC_3,     KC_4,   KC_5,                         KC_MINS, KC_EQL,  KC_GRV,  KC_LBRC, KC_RBRC, KC_BSLS,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT,KC_6,    KC_7,    KC_8,     KC_9,   KC_0,                         KC_UNDS, KC_PLUS, KC_TILD, KC_LCBR, KC_RCBR, KC_PIPE,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LCTL, _______,  KC_SPC,     KC_ENT, KC_BSPC, KC_LGUI
                                      //`--------------------------'  `--------------------------'
  ),

    [_MOUSEALT] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     KC_DEL,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                        KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_PSCR,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+-------+--
     KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                         KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_F11,  KC_CAPS,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------
     KC_LSFT, KC_6,    KC_7,    KC_8,    KC_9,    KC_0,                         KC_HOME, KC_END,  KC_PGUP, KC_PGDN, KC_F12,  KC_RALT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------
                                          KC_LCTL, _______,  KC_SPC,    KC_ENT, KC_BSPC, KC_RGUI
                                      //`--------------------------'  `--------------------------'
  ),
    [_MEDIA] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
     KC_LALT, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                        KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_PSCR,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  TG(_CONFIG),KC_MPRV, KC_MNXT, KC_VOLD, KC_VOLU, KC_MPLY,                      KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_F11,  KC_CAPS,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
     KC_LSFT, KC_BRID, KC_BRIU, KC_F20,  KC_MUTE, KC_APP,                       KC_HOME, KC_END,  KC_PGUP, KC_PGDN, KC_F12,  _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LCTL, TG(_MOUSE), KC_SPC, KC_ENT,  KC_DEL,  KC_RGUI
                                      //`--------------------------'  `--------------------------'
  ),
    [_CONFIG] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_SLEP, XXXXXXX, XXXXXXX, PDF(_COLEMAK), PDF(_QWERTY), XXXXXXX,           XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, RLS_MOUSE,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  TG(_CONFIG), XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, HLD_MOUSE,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, BRT_LOWER, BRT_RAISE, XXXXXXX, XXXXXXX, XXXXXXX,                  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),
};

#ifdef ENCODER_MAP_ENABLE
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
  [0] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [1] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [2] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [3] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
};
#endif

#ifndef OLED_ENABLE
#define OLED_ENABLE
#endif

#ifdef OLED_ENABLE

#include "atlas.h"
#include "sync.h"

uint8_t cur_accel = 1;

oled_rotation_t oled_init_user(oled_rotation_t rotation) {
    return OLED_ROTATION_270;
}

void accel_sync_handler(uint8_t in_buflen, const void* in_data, uint8_t out_buflen, void* out_data){
    const master_to_slave_t* m2s = (const master_to_slave_t*)in_data;
    cur_accel = m2s->m2s_data;
}

void brightness_sync_handler(uint8_t in_buflen, const void* in_data, uint8_t out_buflen, void* out_data){
    const master_to_slave_t* m2s = (const master_to_slave_t*)in_data;
    oled_set_brightness(m2s->m2s_data);
}

void keyboard_post_init_user(void){
    transaction_register_rpc(ACCEL_SYNC_ID, accel_sync_handler);
    transaction_register_rpc(BRIGHTNESS_SYNC_ID, brightness_sync_handler);
}

void sendAccelToSlave(uint8_t accel){
    master_to_slave_t m2s = {accel};
    transaction_rpc_send(ACCEL_SYNC_ID, sizeof(m2s), &m2s);
}

void sendBrightnessToSlave(uint8_t brightness){
    master_to_slave_t m2s = {brightness};
    transaction_rpc_send(BRIGHTNESS_SYNC_ID, sizeof(m2s), &m2s);
}

uint8_t oled_get_raise_brightness(void){
    uint8_t newBrightness = oled_get_brightness()+BRIGHTNESS_STEP;
    if(oled_get_brightness() >= (255-BRIGHTNESS_STEP))
        newBrightness = 255;
    return newBrightness;
}

uint8_t oled_get_lower_brightness(void){
    uint8_t newBrightness = oled_get_brightness()-BRIGHTNESS_STEP;
    if(oled_get_brightness() <= BRIGHTNESS_STEP)
        newBrightness = 0;
    return newBrightness;
}

void oled_set_new_brightness(uint8_t brightness){
    oled_set_brightness(brightness);
    sendBrightnessToSlave(brightness);
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    if(record->event.pressed){
        switch (keycode) {
            case KC_MS_ACCEL0:
                sendAccelToSlave(0);
                break;
            case KC_MS_ACCEL1:
                sendAccelToSlave(1);
                break;
            case KC_MS_ACCEL2:
                sendAccelToSlave(2);
                break;
            case HLD_MOUSE:
                SEND_STRING(SS_DOWN(X_BTN1));
                break;
            case RLS_MOUSE:
                SEND_STRING(SS_UP(X_BTN1));
                break;
            case BRT_RAISE:
                oled_set_new_brightness(oled_get_raise_brightness());
                break;
            case BRT_LOWER:
                oled_set_new_brightness(oled_get_lower_brightness());
                break;
            default:
                break;
        }
    }
    return true;
}

void oled_render_slave(void){
    bool capson = host_keyboard_led_state().caps_lock;
    int curLayer = get_highest_layer(layer_state);

    oled_render_rfk();

    oled_set_cursor(0, 4);
    if(capson){
        oled_render_caps();
    } else
        oled_render_blank();

    oled_set_cursor(0, 8);

    if(curLayer == _MOUSE || curLayer == _MOUSEALT){
        render_pika_animation();

        oled_set_cursor(0, 12);
        oled_render_accel_profile(cur_accel);
    } else {
        oled_render_blank();
        oled_set_cursor(0, 12);
        oled_render_blank();
    }
}

bool oled_task_user() {
    if(is_keyboard_master())
        oled_render_layers();
    else {
        oled_render_slave();
    }
    return false;
}

#endif
