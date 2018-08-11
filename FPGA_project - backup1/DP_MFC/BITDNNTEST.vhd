--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:16:09 04/10/2017
-- Design Name:   
-- Module Name:   C:/Users/tslab-802-2/Desktop/newtest4/FPGA_project - backup1/DP_MFC/BITDNNTEST.vhd
-- Project Name:  WordDetect
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DNN_0117
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BITDNNTEST IS
END BITDNNTEST;
 
ARCHITECTURE behavior OF BITDNNTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DNN_0117
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         vec_in : IN  std_logic_vector(19 downto 0);
         dv_in : IN  std_logic;
         vec_out : OUT  std_logic_vector(10 downto 0);
         dv_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal vec_in : std_logic_vector(19 downto 0) := (others => '0');
   signal dv_in : std_logic := '0';

 	--Outputs
   signal vec_out : std_logic_vector(10 downto 0);
   signal dv_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DNN_0117 PORT MAP (
          clk => clk,
          reset => reset,
          vec_in => vec_in,
          dv_in => dv_in,
          vec_out => vec_out,
          dv_out => dv_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
