#include "action_layer.h"
#include QMK_KEYBOARD_H
#include "oled_driver.h"
#include "timer.h"
#include "atlas.h"
#include "layers.h"

void oled_render_rfk(void){
    oled_write_raw_P(rfk, sizeof(rfk));
}

void oled_render_caps(void){
    oled_write_raw_P(caps, sizeof(caps));
}

void oled_render_blank(void){
    oled_write_raw_P(blank, sizeof(blank));
}

void oled_render_accel0(void){
    oled_write_raw_P(zero_image, sizeof(zero_image));
}

void oled_render_accel1(void){
    oled_write_raw_P(one_image, sizeof(one_image));
}

void oled_render_accel2(void){
    oled_write_raw_P(two_image, sizeof(two_image));
}

void oled_render_accel_profile(uint8_t accel){
    switch(accel){
        case 0:
            oled_render_accel0();
            break;
        case 1:
            oled_render_accel1();
            break;
        case 2:
            oled_render_accel2();
            break;
        default:
            oled_render_blank();
            break;
    }
}

void oled_render_layers(void){
    uint8_t layer = get_highest_layer(layer_state);
    /*oled_clear();*/
    oled_render_default_layer(layer == _QWERTY);
    oled_render_symbol_layer(layer == _SYMBOLS);
    oled_render_media_layer(layer == _MEDIA);
    oled_render_mouse_layer(layer == _MOUSE || layer == _MOUSEALT);
    oled_render_config_layer(layer == _CONFIG);
}

void oled_render_default_layer(bool active){
    oled_set_cursor(0, 0);
    if(active){
        oled_write_raw_P(defaulton, sizeof(defaulton));
        return;
    }
    oled_write_raw_P(defaultoff, sizeof(defaultoff));
}

void oled_render_symbol_layer(bool active){
    oled_set_cursor(0, 3);
    if(active){
        oled_write_raw_P(symbolon, sizeof(symbolon));
        return;
    }
    oled_write_raw_P(symboloff, sizeof(symboloff));
}

void oled_render_media_layer(bool active){
    oled_set_cursor(0, 6);
    if(active){
        oled_write_raw_P(mediaon, sizeof(mediaon));
        return;
    }
    oled_write_raw_P(mediaoff, sizeof(mediaoff));
}

void oled_render_mouse_layer(bool active){
    oled_set_cursor(0, 9);
    if(active){
        oled_write_raw_P(mouseon, sizeof(mouseon));
        return;
    }
    oled_write_raw_P(mouseoff, sizeof(mouseoff));
}

void oled_render_config_layer(bool active){
    oled_set_cursor(0, 12);
    if(active){
        oled_write_raw_P(configon, sizeof(configon));
        return;
    }
    oled_write_raw_P(configoff, sizeof(configoff));
}

#define FRAME_DURATION 250

uint8_t pika_frame = 0;
uint32_t pika_timer = 0;

void render_pika_animation(void){
    if(!is_oled_on())
        return;

    if(timer_elapsed(pika_timer) > FRAME_DURATION){
        pika_timer = timer_read();
        if(pika_frame == 0){
            oled_write_raw_P(pikachu1, sizeof(pikachu1));
            pika_frame = 1;
        } else if (pika_frame == 1){
            oled_write_raw_P(pikachu2, sizeof(pikachu2));
            pika_frame = 0;
        }
    }
}
