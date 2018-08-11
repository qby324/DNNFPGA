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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_2347017610_init();
    xilinxcorelib_ver_m_00000000001687936702_2744878058_init();
    xilinxcorelib_ver_m_00000000000277421008_0345340507_init();
    xilinxcorelib_ver_m_00000000001603977570_3850116391_init();
    work_m_00000000002489990758_3334603971_init();
    xilinxcorelib_ver_m_00000000001358910285_0359770596_init();
    xilinxcorelib_ver_m_00000000001687936702_2748435483_init();
    xilinxcorelib_ver_m_00000000000277421008_3042497055_init();
    xilinxcorelib_ver_m_00000000001603977570_3854723049_init();
    work_m_00000000000403262735_2452877731_init();
    xilinxcorelib_ver_m_00000000001358910285_0840757716_init();
    xilinxcorelib_ver_m_00000000001687936702_1929636017_init();
    xilinxcorelib_ver_m_00000000000277421008_3629189571_init();
    xilinxcorelib_ver_m_00000000001603977570_1011575302_init();
    work_m_00000000000403262735_0988281885_init();
    unisims_ver_m_00000000001773747898_0257217429_init();
    unisims_ver_m_00000000001784029001_1343423062_init();
    unisims_ver_m_00000000001108370118_1918347995_init();
    unisims_ver_m_00000000000073490608_0280471132_init();
    unisims_ver_m_00000000000129589818_1491383940_init();
    unisims_ver_m_00000000003848737514_1058825862_init();
    unisims_ver_m_00000000000909115699_2771340377_init();
    unisims_ver_m_00000000003317509437_1759035934_init();
    unisims_ver_m_00000000003927721830_1593237687_init();
    work_m_00000000001811016685_1345475044_init();
    unisims_ver_m_00000000000073490608_1977786825_init();
    work_m_00000000000267943468_3317365917_init();
    work_m_00000000003350827930_0648830262_init();
    work_m_00000000002345147072_1570799568_init();
    work_m_00000000002681946823_2202771406_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002681946823_2202771406");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
