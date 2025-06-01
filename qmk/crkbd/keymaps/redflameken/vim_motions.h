#ifndef VIM_MOTIONS_H
#define VIM_MOTIONS_H

// Normal Mode
void vim_norm_w(void);
void vim_norm_b(void);
void vim_norm_y(void);
void vim_norm_i(bool shifted);
void vim_norm_o(bool shifted);
void vim_norm_p(bool shifted);
void vim_norm_a(bool shifted);
void vim_norm_s(bool shifted);
void vim_norm_d(bool shifted);
void vim_norm_g(bool shifted);
void vim_norm_c(bool shifted);
void vim_norm_v(bool shifted);
void vim_undo(void);
void vim_redo(void);

// D layer
void vim_d_d(void);
void vim_d_h(void);
void vim_d_j(void);
void vim_d_k(void);
void vim_d_l(void);
void vim_d_w(void);
void vim_d_b(void);

// C layer
void vim_c_c(void);
void vim_c_h(void);
void vim_c_j(void);
void vim_c_k(void);
void vim_c_l(void);
void vim_c_w(void);
void vim_c_b(void);

// Y Layer
void vim_y_y(void);
void vim_y_h(void);
void vim_y_j(void);
void vim_y_k(void);
void vim_y_l(void);
void vim_y_w(void);
void vim_y_b(void);

// G Layer
void vim_g_g(void);

#endif
