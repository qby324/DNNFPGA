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
static const char *ng0 = "C:/Users/tslab-802-2/Desktop/newtest/FPGA_project - backup1/MFC_REC/SMULTI.v";



static void Cont_29_0(char *t0)
{
    char t5[32];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 2824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1344U);
    t3 = *((char **)t2);
    t2 = (t0 + 1504U);
    t4 = *((char **)t2);
    xsi_vlog_signed_multiply(t5, 128, t3, 64, t4, 64);
    t2 = (t0 + 3224);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t5, 0, 128);
    xsi_driver_vfirst_trans(t2, 0, 127);
    t10 = (t0 + 3144);
    *((int *)t10) = 1;

LAB1:    return;
}


extern void work_m_00000000002424899323_2829381612_init()
{
	static char *pe[] = {(void *)Cont_29_0};
	xsi_register_didat("work_m_00000000002424899323_2829381612", "isim/simtest_isim_beh.exe.sim/work/m_00000000002424899323_2829381612.didat");
	xsi_register_executes(pe);
}
