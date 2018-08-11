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
    xilinxcorelib_ver_m_00000000000277421008_3708741804_init();
    xilinxcorelib_ver_m_00000000001603977570_0192295794_init();
    work_m_00000000002489990758_2932577240_init();
    xilinxcorelib_ver_m_00000000001358910285_0359770596_init();
    xilinxcorelib_ver_m_00000000001687936702_2748435483_init();
    xilinxcorelib_ver_m_00000000000277421008_1342157453_init();
    xilinxcorelib_ver_m_00000000001603977570_3536317789_init();
    work_m_00000000000403262735_4075849606_init();
    xilinxcorelib_ver_m_00000000001358910285_0840757716_init();
    xilinxcorelib_ver_m_00000000001687936702_1929636017_init();
    xilinxcorelib_ver_m_00000000000277421008_1004657376_init();
    xilinxcorelib_ver_m_00000000001603977570_2587612283_init();
    work_m_00000000000403262735_0067527005_init();
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
    work_m_00000000000267943468_3702614146_init();
    work_m_00000000003350827930_0648830262_init();
    work_m_00000000002945039003_1316306747_init();
    work_m_00000000002766097262_0777103491_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002766097262_0777103491");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
