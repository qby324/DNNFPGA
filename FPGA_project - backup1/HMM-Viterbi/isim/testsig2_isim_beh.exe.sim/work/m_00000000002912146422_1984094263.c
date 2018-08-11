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
static const char *ng0 = "C:/.Xilinx/HMM-Viterbi/sigmoid2.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {5120, 0};
static int ng4[] = {1023, 0};



static void Always_59_0(char *t0)
{
    char t13[8];
    char t29[8];
    char t43[8];
    char t59[8];
    char t67[8];
    char t107[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
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
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t44;
    char *t45;
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
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    int t91;
    int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;
    char *t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;

LAB0:    t1 = (t0 + 2512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2708);
    *((int *)t2) = 1;
    t3 = (t0 + 2540);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(60, ng0);

LAB5:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 1804);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t7, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    xsi_set_current_line(62, ng0);

LAB12:    xsi_set_current_line(63, ng0);
    t9 = (t0 + 1712);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB16;

LAB13:    if (t25 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t13) = 1;

LAB16:    memset(t29, 0, 8);
    t30 = (t13 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t13);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t30) != 0)
        goto LAB19;

LAB20:    t37 = (t29 + 4);
    t38 = *((unsigned int *)t29);
    t39 = *((unsigned int *)t37);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB21;

LAB22:    memcpy(t67, t29, 8);

LAB23:    t99 = (t67 + 4);
    t100 = *((unsigned int *)t99);
    t101 = (~(t100));
    t102 = *((unsigned int *)t67);
    t103 = (t102 & t101);
    t104 = (t103 != 0);
    if (t104 > 0)
        goto LAB35;

LAB36:
LAB37:    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1620);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 11, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB11;

LAB9:    xsi_set_current_line(78, ng0);

LAB48:    goto LAB11;

LAB15:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB16;

LAB17:    *((unsigned int *)t29) = 1;
    goto LAB20;

LAB19:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB20;

LAB21:    t41 = (t0 + 932U);
    t42 = *((char **)t41);
    t41 = ((char*)((ng2)));
    memset(t43, 0, 8);
    t44 = (t42 + 4);
    t45 = (t41 + 4);
    t46 = *((unsigned int *)t42);
    t47 = *((unsigned int *)t41);
    t48 = (t46 ^ t47);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = (t48 | t51);
    t53 = *((unsigned int *)t44);
    t54 = *((unsigned int *)t45);
    t55 = (t53 | t54);
    t56 = (~(t55));
    t57 = (t52 & t56);
    if (t57 != 0)
        goto LAB27;

LAB24:    if (t55 != 0)
        goto LAB26;

LAB25:    *((unsigned int *)t43) = 1;

LAB27:    memset(t59, 0, 8);
    t60 = (t43 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t43);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t60) != 0)
        goto LAB30;

LAB31:    t68 = *((unsigned int *)t29);
    t69 = *((unsigned int *)t59);
    t70 = (t68 & t69);
    *((unsigned int *)t67) = t70;
    t71 = (t29 + 4);
    t72 = (t59 + 4);
    t73 = (t67 + 4);
    t74 = *((unsigned int *)t71);
    t75 = *((unsigned int *)t72);
    t76 = (t74 | t75);
    *((unsigned int *)t73) = t76;
    t77 = *((unsigned int *)t73);
    t78 = (t77 != 0);
    if (t78 == 1)
        goto LAB32;

LAB33:
LAB34:    goto LAB23;

LAB26:    t58 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB27;

LAB28:    *((unsigned int *)t59) = 1;
    goto LAB31;

LAB30:    t66 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t66) = 1;
    goto LAB31;

LAB32:    t79 = *((unsigned int *)t67);
    t80 = *((unsigned int *)t73);
    *((unsigned int *)t67) = (t79 | t80);
    t81 = (t29 + 4);
    t82 = (t59 + 4);
    t83 = *((unsigned int *)t29);
    t84 = (~(t83));
    t85 = *((unsigned int *)t81);
    t86 = (~(t85));
    t87 = *((unsigned int *)t59);
    t88 = (~(t87));
    t89 = *((unsigned int *)t82);
    t90 = (~(t89));
    t91 = (t84 & t86);
    t92 = (t88 & t90);
    t93 = (~(t91));
    t94 = (~(t92));
    t95 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t95 & t93);
    t96 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t96 & t94);
    t97 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t97 & t93);
    t98 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t98 & t94);
    goto LAB34;

LAB35:    xsi_set_current_line(64, ng0);

LAB38:    xsi_set_current_line(65, ng0);
    t105 = (t0 + 1024U);
    t106 = *((char **)t105);
    t105 = ((char*)((ng3)));
    memset(t107, 0, 8);
    xsi_vlog_signed_greater(t107, 32, t106, 32, t105, 32);
    t108 = (t107 + 4);
    t109 = *((unsigned int *)t108);
    t110 = (~(t109));
    t111 = *((unsigned int *)t107);
    t112 = (t111 & t110);
    t113 = (t112 != 0);
    if (t113 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1024U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_unary_minus(t13, 32, t2, 32);
    memset(t29, 0, 8);
    xsi_vlog_signed_less(t29, 32, t3, 32, t13, 32);
    t4 = (t29 + 4);
    t16 = *((unsigned int *)t4);
    t17 = (~(t16));
    t18 = *((unsigned int *)t29);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(69, ng0);

LAB47:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1896);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB45:
LAB41:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1804);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 3, t5, 32);
    t7 = (t0 + 1804);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 3, 0LL);
    goto LAB37;

LAB39:    xsi_set_current_line(65, ng0);

LAB42:    xsi_set_current_line(66, ng0);
    t114 = ((char*)((ng4)));
    t115 = (t0 + 1620);
    xsi_vlogvar_wait_assign_value(t115, t114, 0, 0, 11, 0LL);
    goto LAB41;

LAB43:    xsi_set_current_line(67, ng0);

LAB46:    xsi_set_current_line(68, ng0);
    t5 = ((char*)((ng1)));
    t7 = (t0 + 1620);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 11, 0LL);
    goto LAB45;

}


extern void work_m_00000000002912146422_1984094263_init()
{
	static char *pe[] = {(void *)Always_59_0};
	xsi_register_didat("work_m_00000000002912146422_1984094263", "isim/testsig2_isim_beh.exe.sim/work/m_00000000002912146422_1984094263.didat");
	xsi_register_executes(pe);
}
