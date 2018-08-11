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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/.Xilinx/MFC_REC/test_rec.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};
static int ng5[] = {4, 0};
static int ng6[] = {5, 0};
static int ng7[] = {6, 0};
static int ng8[] = {7, 0};



static void Always_62_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 2948U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);

LAB4:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1780);
    t4 = (t2 + 36U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t6) == 0)
        goto LAB6;

LAB8:    t12 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t3 + 4);
    t14 = (t5 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    *((unsigned int *)t3) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t21 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t0 + 1780);
    xsi_vlogvar_wait_assign_value(t23, t3, 0, 0, 1, 0LL);
    goto LAB2;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

LAB11:    t17 = *((unsigned int *)t3);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t3) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

}

static void Always_71_1(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;

LAB0:    t1 = (t0 + 3092U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(71, ng0);

LAB4:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2992);
    xsi_process_wait(t2, 62500000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2056);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1872);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2056);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 16, t5, 32);
    t7 = (t0 + 2056);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 16, 0LL);
    goto LAB2;

}

static void Always_77_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 3236U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng0);

LAB4:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3136);
    xsi_process_wait(t2, 62480000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1964);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3136);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1964);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB2;

}

static void Initial_91_3(char *t0)
{
    char t4[8];
    char t5[8];
    char t26[8];
    char t37[8];
    char t48[8];
    char t59[8];
    char t70[8];
    char t81[8];
    char t92[8];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    int t15;
    char *t16;
    unsigned int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    int t22;
    int t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t93;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;

LAB0:    t1 = (t0 + 3380U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);

LAB4:    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1780);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1872);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1964);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB5;

LAB6:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng1)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng3)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng4)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng5)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng6)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng7)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB17;

LAB18:    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 2332);
    t6 = (t0 + 2332);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 2332);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng8)));
    xsi_vlog_generic_convert_array_indices(t4, t5, t8, t11, 2, 1, t12, 32, 1);
    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (!(t14));
    t16 = (t5 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (!(t17));
    t19 = (t15 && t18);
    if (t19 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 2332);
    t3 = (t2 + 36U);
    t6 = *((char **)t3);
    t7 = (t0 + 2332);
    t8 = (t7 + 44U);
    t9 = *((char **)t8);
    t10 = (t0 + 2332);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    t13 = ((char*)((ng2)));
    xsi_vlog_generic_get_array_select_value(t5, 3, t6, t9, t12, 2, 1, t13, 32, 1);
    t16 = (t0 + 2332);
    t24 = (t16 + 36U);
    t25 = *((char **)t24);
    t27 = (t0 + 2332);
    t28 = (t27 + 44U);
    t29 = *((char **)t28);
    t30 = (t0 + 2332);
    t31 = (t30 + 40U);
    t32 = *((char **)t31);
    t33 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t26, 3, t25, t29, t32, 2, 1, t33, 32, 1);
    t34 = (t0 + 2332);
    t35 = (t34 + 36U);
    t36 = *((char **)t35);
    t38 = (t0 + 2332);
    t39 = (t38 + 44U);
    t40 = *((char **)t39);
    t41 = (t0 + 2332);
    t42 = (t41 + 40U);
    t43 = *((char **)t42);
    t44 = ((char*)((ng3)));
    xsi_vlog_generic_get_array_select_value(t37, 3, t36, t40, t43, 2, 1, t44, 32, 1);
    t45 = (t0 + 2332);
    t46 = (t45 + 36U);
    t47 = *((char **)t46);
    t49 = (t0 + 2332);
    t50 = (t49 + 44U);
    t51 = *((char **)t50);
    t52 = (t0 + 2332);
    t53 = (t52 + 40U);
    t54 = *((char **)t53);
    t55 = ((char*)((ng4)));
    xsi_vlog_generic_get_array_select_value(t48, 3, t47, t51, t54, 2, 1, t55, 32, 1);
    t56 = (t0 + 2332);
    t57 = (t56 + 36U);
    t58 = *((char **)t57);
    t60 = (t0 + 2332);
    t61 = (t60 + 44U);
    t62 = *((char **)t61);
    t63 = (t0 + 2332);
    t64 = (t63 + 40U);
    t65 = *((char **)t64);
    t66 = ((char*)((ng5)));
    xsi_vlog_generic_get_array_select_value(t59, 3, t58, t62, t65, 2, 1, t66, 32, 1);
    t67 = (t0 + 2332);
    t68 = (t67 + 36U);
    t69 = *((char **)t68);
    t71 = (t0 + 2332);
    t72 = (t71 + 44U);
    t73 = *((char **)t72);
    t74 = (t0 + 2332);
    t75 = (t74 + 40U);
    t76 = *((char **)t75);
    t77 = ((char*)((ng6)));
    xsi_vlog_generic_get_array_select_value(t70, 3, t69, t73, t76, 2, 1, t77, 32, 1);
    t78 = (t0 + 2332);
    t79 = (t78 + 36U);
    t80 = *((char **)t79);
    t82 = (t0 + 2332);
    t83 = (t82 + 44U);
    t84 = *((char **)t83);
    t85 = (t0 + 2332);
    t86 = (t85 + 40U);
    t87 = *((char **)t86);
    t88 = ((char*)((ng7)));
    xsi_vlog_generic_get_array_select_value(t81, 3, t80, t84, t87, 2, 1, t88, 32, 1);
    t89 = (t0 + 2332);
    t90 = (t89 + 36U);
    t91 = *((char **)t90);
    t93 = (t0 + 2332);
    t94 = (t93 + 44U);
    t95 = *((char **)t94);
    t96 = (t0 + 2332);
    t97 = (t96 + 40U);
    t98 = *((char **)t97);
    t99 = ((char*)((ng8)));
    xsi_vlog_generic_get_array_select_value(t92, 3, t91, t95, t98, 2, 1, t99, 32, 1);
    xsi_vlogtype_concat(t4, 24, 24, 8U, t92, 3, t81, 3, t70, 3, t59, 3, t48, 3, t37, 3, t26, 3, t5, 3);
    t100 = (t0 + 2424);
    xsi_vlogvar_wait_assign_value(t100, t4, 0, 0, 24, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2148);
    t3 = (t2 + 36U);
    t6 = *((char **)t3);
    memset(t4, 0, 8);
    t7 = (t4 + 4);
    t8 = (t6 + 4);
    memcpy(t4, t6, 8);
    t14 = *((unsigned int *)t4);
    t17 = (~(t14));
    t20 = *((unsigned int *)t7);
    t21 = (t17 | t20);
    *((unsigned int *)t4) = t21;
    t101 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t101 & 4294967295U);
    t102 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t102 & 4294967295U);
    t9 = ((char*)((ng1)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t4, 32, t9, 32);
    t10 = (t0 + 2240);
    xsi_vlogvar_wait_assign_value(t10, t5, 0, 0, 32, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3280);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB21;

LAB1:    return;
LAB5:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB6;

LAB7:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB8;

LAB9:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB10;

LAB11:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB12;

LAB13:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB14;

LAB15:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB16;

LAB17:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB18;

LAB19:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t5);
    t22 = (t20 - t21);
    t23 = (t22 + 1);
    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t5), t23);
    goto LAB20;

LAB21:    goto LAB1;

}


extern void work_m_00000000000655277148_2881475127_init()
{
	static char *pe[] = {(void *)Always_62_0,(void *)Always_71_1,(void *)Always_77_2,(void *)Initial_91_3};
	xsi_register_didat("work_m_00000000000655277148_2881475127", "isim/test_rec_isim_beh.exe.sim/work/m_00000000000655277148_2881475127.didat");
	xsi_register_executes(pe);
}
