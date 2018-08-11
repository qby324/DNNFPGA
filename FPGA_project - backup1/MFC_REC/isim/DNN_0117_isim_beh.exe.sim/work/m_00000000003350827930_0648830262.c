/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/tslab-802-2/Desktop/newtest/FPGA_project - backup1/HMM-Viterbi/sigmoid.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {1025, 0};
static int ng4[] = {1024, 0};
static int ng5[] = {2, 0};
static int ng6[] = {3, 0};



static void Always_40_0(char *t0)
{
    char t11[8];
    char t27[8];
    char t41[8];
    char t57[8];
    char t65[8];
    char t107[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    int t89;
    int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    char *t108;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 4536);
    *((int *)t2) = 1;
    t3 = (t0 + 4248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(41, ng0);

LAB5:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t0 + 2976);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 3136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t5, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(44, ng0);

LAB16:    xsi_set_current_line(45, ng0);
    t7 = (t0 + 2976);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = ((char*)((ng1)));
    memset(t11, 0, 8);
    t12 = (t9 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB20;

LAB17:    if (t23 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t11) = 1;

LAB20:    memset(t27, 0, 8);
    t28 = (t11 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (~(t29));
    t31 = *((unsigned int *)t11);
    t32 = (t31 & t30);
    t33 = (t32 & 1U);
    if (t33 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t28) != 0)
        goto LAB23;

LAB24:    t35 = (t27 + 4);
    t36 = *((unsigned int *)t27);
    t37 = *((unsigned int *)t35);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB25;

LAB26:    memcpy(t65, t27, 8);

LAB27:    t97 = (t65 + 4);
    t98 = *((unsigned int *)t97);
    t99 = (~(t98));
    t100 = *((unsigned int *)t65);
    t101 = (t100 & t99);
    t102 = (t101 != 0);
    if (t102 > 0)
        goto LAB39;

LAB40:
LAB41:    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2176);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    goto LAB15;

LAB9:    xsi_set_current_line(54, ng0);

LAB43:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 1776U);
    t5 = *((char **)t3);
    memset(t11, 0, 8);
    t3 = (t11 + 4);
    t7 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (t14 >> 26);
    t16 = (t15 & 1);
    *((unsigned int *)t11) = t16;
    t17 = *((unsigned int *)t7);
    t18 = (t17 >> 26);
    t19 = (t18 & 1);
    *((unsigned int *)t3) = t19;
    t8 = (t11 + 4);
    t20 = *((unsigned int *)t8);
    t21 = (~(t20));
    t22 = *((unsigned int *)t11);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB44;

LAB45:    xsi_set_current_line(59, ng0);

LAB56:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_signed_lshift(t11, 28, t3, 27, t2, 32);
    t5 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t5, t11, 0, 0, 28, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t11, 0, 8);
    xsi_vlog_signed_add(t11, 32, t3, 27, t2, 32);
    t5 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t5, t11, 0, 0, 28, 0LL);

LAB46:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3136);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t5, 3, t7, 32);
    t8 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t8, t11, 0, 0, 3, 0LL);
    goto LAB15;

LAB11:    xsi_set_current_line(66, ng0);

LAB57:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 3296);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 744);
    t9 = *((char **)t8);
    memset(t11, 0, 8);
    t8 = (t7 + 4);
    t10 = (t9 + 4);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t9);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t10);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t10);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB61;

LAB58:    if (t23 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t11) = 1;

LAB61:    t13 = (t11 + 4);
    t29 = *((unsigned int *)t13);
    t30 = (~(t29));
    t31 = *((unsigned int *)t11);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(77, ng0);

LAB73:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2496);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = (t0 + 2656);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t11, 0, 8);
    t10 = (t5 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB75;

LAB74:    t12 = (t9 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB75;

LAB78:    if (*((unsigned int *)t5) > *((unsigned int *)t9))
        goto LAB76;

LAB77:    t26 = (t11 + 4);
    t14 = *((unsigned int *)t26);
    t15 = (~(t14));
    t16 = *((unsigned int *)t11);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(82, ng0);

LAB85:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2496);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_lshift(t11, 28, t5, 28, t7, 32);
    t8 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t8, t11, 0, 0, 28, 0LL);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2816);
    t5 = (t0 + 2816);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 744);
    t10 = *((char **)t9);
    t9 = ((char*)((ng2)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 32, t10, 32, t9, 32);
    t12 = (t0 + 3296);
    t13 = (t12 + 56U);
    t26 = *((char **)t13);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_minus(t41, 32, t27, 32, t26, 4);
    xsi_vlog_generic_convert_bit_index(t11, t8, 2, t41, 32, 2);
    t28 = (t11 + 4);
    t14 = *((unsigned int *)t28);
    t6 = (!(t14));
    if (t6 == 1)
        goto LAB86;

LAB87:
LAB81:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t5, 4, t7, 32);
    t8 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t8, t11, 0, 0, 4, 0LL);

LAB64:    goto LAB15;

LAB13:    xsi_set_current_line(90, ng0);

LAB88:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 2816);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    memset(t11, 0, 8);
    t8 = (t11 + 4);
    t9 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 1);
    *((unsigned int *)t11) = t15;
    t16 = *((unsigned int *)t9);
    t17 = (t16 >> 1);
    *((unsigned int *)t8) = t17;
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 & 2047U);
    t19 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t19 & 2047U);
    t10 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t10, t11, 0, 0, 11, 0LL);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2176);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    goto LAB15;

LAB19:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t27) = 1;
    goto LAB24;

LAB23:    t34 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB24;

LAB25:    t39 = (t0 + 1616U);
    t40 = *((char **)t39);
    t39 = ((char*)((ng2)));
    memset(t41, 0, 8);
    t42 = (t40 + 4);
    t43 = (t39 + 4);
    t44 = *((unsigned int *)t40);
    t45 = *((unsigned int *)t39);
    t46 = (t44 ^ t45);
    t47 = *((unsigned int *)t42);
    t48 = *((unsigned int *)t43);
    t49 = (t47 ^ t48);
    t50 = (t46 | t49);
    t51 = *((unsigned int *)t42);
    t52 = *((unsigned int *)t43);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB31;

LAB28:    if (t53 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t41) = 1;

LAB31:    memset(t57, 0, 8);
    t58 = (t41 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t41);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t58) != 0)
        goto LAB34;

LAB35:    t66 = *((unsigned int *)t27);
    t67 = *((unsigned int *)t57);
    t68 = (t66 & t67);
    *((unsigned int *)t65) = t68;
    t69 = (t27 + 4);
    t70 = (t57 + 4);
    t71 = (t65 + 4);
    t72 = *((unsigned int *)t69);
    t73 = *((unsigned int *)t70);
    t74 = (t72 | t73);
    *((unsigned int *)t71) = t74;
    t75 = *((unsigned int *)t71);
    t76 = (t75 != 0);
    if (t76 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB27;

LAB30:    t56 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t56) = 1;
    goto LAB31;

LAB32:    *((unsigned int *)t57) = 1;
    goto LAB35;

LAB34:    t64 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB35;

LAB36:    t77 = *((unsigned int *)t65);
    t78 = *((unsigned int *)t71);
    *((unsigned int *)t65) = (t77 | t78);
    t79 = (t27 + 4);
    t80 = (t57 + 4);
    t81 = *((unsigned int *)t27);
    t82 = (~(t81));
    t83 = *((unsigned int *)t79);
    t84 = (~(t83));
    t85 = *((unsigned int *)t57);
    t86 = (~(t85));
    t87 = *((unsigned int *)t80);
    t88 = (~(t87));
    t89 = (t82 & t84);
    t90 = (t86 & t88);
    t91 = (~(t89));
    t92 = (~(t90));
    t93 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t93 & t91);
    t94 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t94 & t92);
    t95 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t95 & t91);
    t96 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t96 & t92);
    goto LAB38;

LAB39:    xsi_set_current_line(46, ng0);

LAB42:    xsi_set_current_line(47, ng0);
    t103 = (t0 + 3136);
    t104 = (t103 + 56U);
    t105 = *((char **)t104);
    t106 = ((char*)((ng2)));
    memset(t107, 0, 8);
    xsi_vlog_unsigned_add(t107, 32, t105, 3, t106, 32);
    t108 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t108, t107, 0, 0, 3, 0LL);
    goto LAB41;

LAB44:    xsi_set_current_line(56, ng0);

LAB47:    xsi_set_current_line(57, ng0);
    t9 = (t0 + 1776U);
    t10 = *((char **)t9);
    memset(t27, 0, 8);
    t9 = (t27 + 4);
    t12 = (t10 + 4);
    memcpy(t41, t10, 8);
    t30 = *((unsigned int *)t10);
    t31 = (t30 & 67108864U);
    t25 = t31;
    t13 = (t10 + 4);
    t32 = *((unsigned int *)t13);
    t33 = (t32 & 67108864U);
    t29 = t33;
    t36 = (t31 != 0);
    if (t36 == 1)
        goto LAB48;

LAB49:    t38 = (t33 != 0);
    if (t38 == 1)
        goto LAB50;

LAB51:    t45 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t45 & 4294967295U);
    t28 = (t41 + 4);
    t46 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t46 & 4294967295U);
    memcpy(t27, t41, 8);
    t47 = *((unsigned int *)t27);
    t48 = (~(t47));
    t49 = *((unsigned int *)t9);
    t50 = (t48 | t49);
    *((unsigned int *)t27) = t50;
    t51 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t51 & 4294967295U);
    t52 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t52 & 4294967295U);
    t34 = ((char*)((ng2)));
    memset(t57, 0, 8);
    xsi_vlog_signed_add(t57, 32, t27, 32, t34, 32);
    t35 = ((char*)((ng2)));
    memset(t65, 0, 8);
    xsi_vlog_signed_lshift(t65, 32, t57, 32, t35, 32);
    t39 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t39, t65, 0, 0, 28, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t11 + 4);
    t5 = (t3 + 4);
    memcpy(t27, t3, 8);
    t16 = *((unsigned int *)t3);
    t17 = (t16 & 67108864U);
    t14 = t17;
    t7 = (t3 + 4);
    t18 = *((unsigned int *)t7);
    t19 = (t18 & 67108864U);
    t15 = t19;
    t20 = (t17 != 0);
    if (t20 == 1)
        goto LAB52;

LAB53:    t22 = (t19 != 0);
    if (t22 == 1)
        goto LAB54;

LAB55:    t24 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t24 & 4294967295U);
    t9 = (t27 + 4);
    t25 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t25 & 4294967295U);
    memcpy(t11, t27, 8);
    t29 = *((unsigned int *)t11);
    t30 = (~(t29));
    t31 = *((unsigned int *)t2);
    t32 = (t30 | t31);
    *((unsigned int *)t11) = t32;
    t33 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t33 & 4294967295U);
    t36 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t36 & 4294967295U);
    t10 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_signed_add(t41, 32, t11, 32, t10, 32);
    t12 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t12, t41, 0, 0, 28, 0LL);
    goto LAB46;

LAB48:    t37 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t37 | 4160749568U);
    goto LAB49;

LAB50:    t26 = (t41 + 4);
    t44 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t44 | 4160749568U);
    goto LAB51;

LAB52:    t21 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t21 | 4160749568U);
    goto LAB53;

LAB54:    t8 = (t27 + 4);
    t23 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t23 | 4160749568U);
    goto LAB55;

LAB60:    t12 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(68, ng0);

LAB65:    xsi_set_current_line(69, ng0);
    t26 = ((char*)((ng1)));
    t28 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t28, t26, 0, 0, 4, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3136);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t5, 3, t7, 32);
    t8 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t8, t11, 0, 0, 3, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t11 + 4);
    t5 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (t14 >> 26);
    t16 = (t15 & 1);
    *((unsigned int *)t11) = t16;
    t17 = *((unsigned int *)t5);
    t18 = (t17 >> 26);
    t19 = (t18 & 1);
    *((unsigned int *)t2) = t19;
    t7 = (t11 + 4);
    t20 = *((unsigned int *)t7);
    t21 = (~(t20));
    t22 = *((unsigned int *)t11);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(74, ng0);

LAB72:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng4)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t5, 12, t7, 32);
    t8 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t8, t11, 0, 0, 12, 0LL);

LAB68:    goto LAB64;

LAB66:    xsi_set_current_line(72, ng0);

LAB69:    xsi_set_current_line(73, ng0);
    t8 = (t0 + 2816);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t27, 0, 8);
    t12 = (t27 + 4);
    t13 = (t10 + 4);
    t25 = *((unsigned int *)t10);
    t29 = (~(t25));
    *((unsigned int *)t27) = t29;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t13) != 0)
        goto LAB71;

LAB70:    t36 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t36 & 4294967295U);
    t37 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t37 & 4294967295U);
    t26 = ((char*)((ng3)));
    memset(t41, 0, 8);
    xsi_vlog_unsigned_add(t41, 32, t27, 32, t26, 32);
    t28 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t28, t41, 0, 0, 12, 0LL);
    goto LAB68;

LAB71:    t30 = *((unsigned int *)t27);
    t31 = *((unsigned int *)t13);
    *((unsigned int *)t27) = (t30 | t31);
    t32 = *((unsigned int *)t12);
    t33 = *((unsigned int *)t13);
    *((unsigned int *)t12) = (t32 | t33);
    goto LAB70;

LAB75:    t13 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB77;

LAB76:    *((unsigned int *)t11) = 1;
    goto LAB77;

LAB79:    xsi_set_current_line(79, ng0);

LAB82:    xsi_set_current_line(80, ng0);
    t28 = (t0 + 2496);
    t34 = (t28 + 56U);
    t35 = *((char **)t34);
    t39 = (t0 + 2656);
    t40 = (t39 + 56U);
    t42 = *((char **)t40);
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 28, t35, 28, t42, 28);
    t43 = ((char*)((ng2)));
    memset(t41, 0, 8);
    xsi_vlog_unsigned_lshift(t41, 28, t27, 28, t43, 32);
    t56 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t56, t41, 0, 0, 28, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2816);
    t5 = (t0 + 2816);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 744);
    t10 = *((char **)t9);
    t9 = ((char*)((ng2)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 32, t10, 32, t9, 32);
    t12 = (t0 + 3296);
    t13 = (t12 + 56U);
    t26 = *((char **)t13);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_minus(t41, 32, t27, 32, t26, 4);
    xsi_vlog_generic_convert_bit_index(t11, t8, 2, t41, 32, 2);
    t28 = (t11 + 4);
    t14 = *((unsigned int *)t28);
    t6 = (!(t14));
    if (t6 == 1)
        goto LAB83;

LAB84:    goto LAB81;

LAB83:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t11), 1, 0LL);
    goto LAB84;

LAB86:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t11), 1, 0LL);
    goto LAB87;

}


extern void work_m_00000000003350827930_0648830262_init()
{
	static char *pe[] = {(void *)Always_40_0};
	xsi_register_didat("work_m_00000000003350827930_0648830262", "isim/DNN_0117_isim_beh.exe.sim/work/m_00000000003350827930_0648830262.didat");
	xsi_register_executes(pe);
}
