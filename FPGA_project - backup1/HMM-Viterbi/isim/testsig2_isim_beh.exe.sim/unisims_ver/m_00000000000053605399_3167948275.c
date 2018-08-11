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
static unsigned int ng0[] = {1U, 0U};



static void Cont_35_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;

LAB0:    t1 = (t0 + 2352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 772U);
    t4 = *((char **)t2);
    t2 = (t0 + 864U);
    t5 = *((char **)t2);
    t2 = (t0 + 956U);
    t6 = *((char **)t2);
    t2 = (t0 + 1048U);
    t7 = *((char **)t2);
    t2 = (t0 + 1140U);
    t8 = *((char **)t2);
    t2 = (t0 + 1232U);
    t9 = *((char **)t2);
    xsi_vlogtype_concat(t3, 6, 6, 6U, t9, 1, t8, 1, t7, 1, t6, 1, t5, 1, t4, 1);
    t2 = (t0 + 3040);
    t10 = (t2 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memset(t13, 0, 8);
    t14 = 63U;
    t15 = t14;
    t16 = (t3 + 4);
    t17 = *((unsigned int *)t3);
    t14 = (t14 & t17);
    t18 = *((unsigned int *)t16);
    t15 = (t15 & t18);
    t19 = (t13 + 4);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t20 | t14);
    t21 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t21 | t15);
    xsi_driver_vfirst_trans(t2, 0, 5);
    t22 = (t0 + 2980);
    *((int *)t22) = 1;

LAB1:    return;
}

static void Cont_36_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 2496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1828);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1828);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1600U);
    t10 = *((char **)t9);
    xsi_vlog_generic_get_index_select_value(t5, 1, t4, t8, 2, t10, 6, 2);
    t9 = (t0 + 3076);
    t11 = (t9 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memset(t14, 0, 8);
    t15 = 1U;
    t16 = t15;
    t17 = (t5 + 4);
    t18 = *((unsigned int *)t5);
    t15 = (t15 & t18);
    t19 = *((unsigned int *)t17);
    t16 = (t16 & t19);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t21 | t15);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t22 | t16);
    xsi_driver_vfirst_trans(t9, 0, 0);
    t23 = (t0 + 2988);
    *((int *)t23) = 1;

LAB1:    return;
}

static void Initial_38_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 264);
    t2 = *((char **)t1);
    t1 = (t0 + 1828);
    xsi_vlogvar_assign_value(t1, t2, 0, 0, 64);

LAB1:    return;
}

static void Always_41_3(char *t0)
{
    char t6[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;

LAB0:    t1 = (t0 + 2784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2996);
    *((int *)t2) = 1;
    t3 = (t0 + 2812);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t4 = (t0 + 1508U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng0)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB8;

LAB5:    if (t18 != 0)
        goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;

LAB8:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB8;

LAB9:    t28 = (t0 + 1324U);
    t29 = *((char **)t28);
    t28 = (t0 + 1828);
    t31 = (t0 + 1828);
    t32 = (t31 + 44U);
    t33 = *((char **)t32);
    t34 = (t0 + 1600U);
    t35 = *((char **)t34);
    xsi_vlog_generic_convert_bit_index(t30, t33, 2, t35, 6, 2);
    t34 = (t30 + 4);
    t36 = *((unsigned int *)t34);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB12;

LAB13:    goto LAB11;

LAB12:    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t30), 1, 100LL);
    goto LAB13;

}


extern void unisims_ver_m_00000000000053605399_3167948275_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3167948275", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3167948275.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3048000912_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3048000912", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3048000912.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1909275913_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1909275913", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1909275913.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0708922925_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0708922925", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0708922925.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4215202335_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4215202335", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4215202335.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2158358441_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2158358441", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2158358441.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4054169466_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4054169466", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4054169466.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1067936068_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1067936068", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1067936068.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2153172296_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2153172296", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2153172296.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3110833786_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3110833786", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3110833786.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0314414008_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0314414008", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0314414008.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0392930578_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0392930578", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0392930578.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2905028574_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2905028574", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2905028574.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0974806916_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0974806916", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0974806916.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3416966926_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3416966926", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3416966926.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0829884205_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0829884205", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0829884205.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1873413658_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1873413658", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1873413658.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3709505357_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3709505357", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3709505357.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1018922880_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1018922880", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1018922880.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0942276470_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0942276470", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0942276470.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4055451799_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4055451799", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4055451799.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2018150056_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2018150056", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2018150056.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3598624912_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3598624912", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3598624912.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2867287568_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2867287568", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2867287568.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0175270027_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0175270027", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0175270027.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3215086378_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3215086378", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3215086378.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3031817293_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3031817293", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3031817293.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2809212552_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2809212552", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2809212552.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1132971748_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1132971748", "isim/testsig2_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1132971748.didat");
	xsi_register_executes(pe);
}
