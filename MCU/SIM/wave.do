onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/clock
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Switches
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Keys
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/LEDGreen
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/LEDRed
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/HEX0
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/HEX1
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/HEX2
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/HEX3
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/BidirPin_bus
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/data_bus_MIPS_in
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/data_bus_MIPS_out
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Data_bus_in_GP
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Data_bus_out_GP
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Data_bus_in_INT
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Data_bus_out_INT
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Address_MCU
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/SW_GPIO_MCU
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/Keys_GPIO_MCU
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/CS_out_MCU
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/reset_real
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/MemoryWrite_IO_MCU
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/MemoryRead_IO_MCU
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/INTR
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/INTA
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/GIE
add wave -noupdate -expand -group {MCU
} -radix hexadecimal /mcu_tb/U_0/CS_in_MCU
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/reset
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/clock
add wave -noupdate -expand -group {MIPS
} -color {Cornflower Blue} -radix hexadecimal /mcu_tb/U_0/CPU/ena
add wave -noupdate -expand -group {MIPS
} /mcu_tb/U_0/CPU/BUS_INT_EN_MIPS
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/INTR
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/INTA
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/PC
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Address_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/data_bus_MIPS_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/data_bus_MIPS_in
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/ALU_result_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/read_data_1_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/read_data_2_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/write_data_out
add wave -noupdate -expand -group {MIPS
} -color {Violet Red} -radix hexadecimal /mcu_tb/U_0/CPU/Instruction_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Branch_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Zero_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Memwrite_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Regwrite_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/MemoryWrite_IO_out
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/MemoryRead_IO_out
add wave -noupdate -expand -group {MIPS
} -color Cyan -radix hexadecimal /mcu_tb/U_0/CPU/GIE
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/PC_plus_4
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/read_data_1
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/read_data_2
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/shift
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/jump_immediate
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Sign_Extend
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Add_result
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/ALU_result
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/read_data
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/read_data_SFR
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/ALUSrc
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Branch
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Branch_ne
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/shift_ctr
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Jump
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/RegDst
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Regwrite
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Zero
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Jump_r
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/SFR
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/MemWrite
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/MemtoReg
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/MemRead
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/MemoryWrite_MEM
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/INTR_line
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/INTA_line
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/ALUop
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/Instruction
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/RealReset
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/address_modelSim
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/address_quartus
add wave -noupdate -expand -group {MIPS
} -radix hexadecimal /mcu_tb/U_0/CPU/PC_MIPS
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/clock
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/reset
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/CS
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/Reg_sel
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/WR_en
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/Data_in
add wave -noupdate -expand -group BT_Timer -color Yellow -radix hexadecimal /mcu_tb/U_0/Timer_int/BTIFG
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTCTL
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTCNT
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/MCLK
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTIP
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTSSEL
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTHOLD
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/MCLK0
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/MCLK2
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/MCLK4
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/MCLK8
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTclk
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/Set_BTIFG
add wave -noupdate -expand -group BT_Timer -radix hexadecimal /mcu_tb/U_0/Timer_int/BTIFG_flag
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/Address
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/MemoryRead_IO_in
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/MemoryWrite_IO_in
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/Data
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/Data_in
add wave -noupdate -expand -group {Interrupter
} /mcu_tb/U_0/interrupt/BUS_INT_EN
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/INTR
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/INTA
add wave -noupdate -expand -group {Interrupter
} -color Cyan -radix hexadecimal /mcu_tb/U_0/interrupt/GIE
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/irq0
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/irq1
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/irq2
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/irq3
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/irq4
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/irq5
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/CS_in
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/clock
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/reset
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/IFG
add wave -noupdate -expand -group {Interrupter
} /mcu_tb/U_0/interrupt/IFG_reg
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/IE
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/TYPEx
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/TYPEx_reg
add wave -noupdate -expand -group {Interrupter
} /mcu_tb/U_0/interrupt/BUS_INT_EN_flag
add wave -noupdate -expand -group {Interrupter
} -radix hexadecimal /mcu_tb/U_0/interrupt/INT_flag
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/clock
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/reset
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/Address
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/Data_bus_in_GP
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/Data_bus_out_GP
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/MemoryWrite_IO_in
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/MemoryRead_IO_in
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/SW_GPIO_in
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/Keys_GPIO_in
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/LEDGreen_GP_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/LEDRed_GP_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/HEX0_GP_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/HEX1_GP_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/HEX2_GP_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/HEX3_GP_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/CS_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/CS
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/HEX_decoder_out
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_LG
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_LG
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_LR
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_LR
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_HEX0
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_HEX0
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_HEX1
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_HEX1
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_HEX2
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_HEX2
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_HEX3
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_HEX3
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_SW
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_SW
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_KEYS
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_KEYS
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_UCTL
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_UCTL
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_RXBUF
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_RXBUF
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_TXBUF
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_TXBUF
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_BTCTL
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_BTCTL
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_IE
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_IE
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_IFG
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_IFG
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_write_TYPE
add wave -noupdate -group GPIO /mcu_tb/U_0/Periphery/enable_read_TYPE
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/wren_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/wren_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/rden_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/rden_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/data_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/data_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/address_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/address_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/clock0
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/clock1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/clocken0
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/clocken1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/clocken2
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/clocken3
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/aclr0
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/aclr1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/addressstall_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/addressstall_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/byteena_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/byteena_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/q_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/q_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/eccstatus
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_data_reg_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_data_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_reg_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp2_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp_wren_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp2_wren_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp_wren_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_tmp2_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_output_latch
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_ecc_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_q_ecc_tmp_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_current_written_data_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_original_data_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_original_data_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_a_x
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_b_x
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_a_out
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_b_out
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_address_reg_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_address_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_wren_reg_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_wren_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_rden_reg_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_rden_reg_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_read_flag_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_read_flag_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_reread_flag_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_reread_flag_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_reread_flag2_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_reread_flag2_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_write_flag_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_write_flag_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_nmram_write_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_nmram_write_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_indata_aclr_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_address_aclr_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_wrcontrol_aclr_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_indata_aclr_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_address_aclr_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_wrcontrol_aclr_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_outdata_aclr_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_outdata_aclr_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_rdcontrol_aclr_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_aclr_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_byteena_aclr_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/good_to_go_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/good_to_go_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_core_clocken_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_core_clocken_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_core_clocken_b0
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_core_clocken_b1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_inclocken0
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_input_clocken_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_outdata_clken_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_outdata_clken_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_outlatch_clken_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_outlatch_clken_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_core_clocken_a_reg
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_core_clocken_b_reg
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/default_val
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_data_zero_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_data_zero_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_data_ones_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_data_ones_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/same_clock_pulse0
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/same_clock_pulse1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_force_reread_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_force_reread_a1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_force_reread_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_force_reread_b1
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_force_reread_signal_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_force_reread_signal_b
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_good_to_write_a
add wave -noupdate -expand -group {fetch_mem} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/inst_memory/i_good_to_write_b
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Instruction_out
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/PC_plus_4_out
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Add_result
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/ALU_Result
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/INT_Address
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/BUS_INT_EN
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Branch
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Branch_ne
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Jump
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/jump_immediate
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Zero
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Jump_r
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/INTR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/INTA
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/PC_out
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/clock
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/reset
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/ena
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/PC
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/PC_plus_4
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/next_PC
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Mem_Addr
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Instruction
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_data_1
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_data_2
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/shift
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/jump_immediate
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/Instruction
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_data
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_data_SFR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/ALU_result
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/PC
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/RegWrite
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/MemtoReg
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/RegDst
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/Jump
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/SFR
add wave -noupdate -expand -group {rest of MIPS} /mcu_tb/U_0/CPU/ID/ISR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/INTR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/INTA
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/PC_plus_4
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/Sign_extend
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/GIE
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/clock
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/reset
add wave -noupdate -expand -group {rest of MIPS} -color Yellow -radix hexadecimal -childformat {{/mcu_tb/U_0/CPU/ID/register_array(0) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(1) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(2) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(3) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(4) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(5) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(6) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(7) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(8) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(9) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(10) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(11) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(12) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(13) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(14) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(15) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(16) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(17) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(18) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(19) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(20) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(21) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(22) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(23) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(24) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(25) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(26) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(27) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(28) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(29) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(30) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(31) -radix hexadecimal}} -subitemconfig {/mcu_tb/U_0/CPU/ID/register_array(0) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(1) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(2) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(3) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(4) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(5) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(6) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(7) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(8) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(9) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(10) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(11) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(12) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(13) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(14) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(15) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(16) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(17) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(18) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(19) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(20) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(21) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(22) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(23) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(24) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(25) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(26) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(27) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(28) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(29) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(30) {-color Yellow -height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(31) {-color Yellow -height 15 -radix hexadecimal}} /mcu_tb/U_0/CPU/ID/register_array
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_register_address
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_data
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_register_1_address
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_register_2_address
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_register_address_1
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_register_address_0
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/ID/Instruction_immediate_value
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Opcode
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/RS
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/RegDst
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/ALUSrc
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/MemtoReg
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/RegWrite
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/MemRead
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/MemWrite
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Branch
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Branch_ne
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/shift_ctr
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Jump
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/ALUop
add wave -noupdate -expand -group {rest of MIPS} /mcu_tb/U_0/CPU/CTL/ISR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/INTA
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/INTR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Jump_r
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/clock
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/reset
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/R_format
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Lw
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Sw
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/Beq
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/addi
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/andi
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/ori
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/xori
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/slti
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/mul
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/lui
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/bne
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/jump_com
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/jump_al_com
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/EOI
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/CTL/tmp_INTA
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Read_data_1
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Read_data_2
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/shift
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/shift_ctr
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Sign_extend
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Function_opcode
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUOp
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUSrc
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Zero
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Jump_r
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/SFR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALU_Result
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Add_Result
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/PC_plus_4
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/clock
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/reset
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Ainput
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Binput
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALU_output_mux
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Branch_Add
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALU_ctl
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/shift_res
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/mux1
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/mux2
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/mux3
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/mux4
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/mux5
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Read_data_right
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/input_shifter
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Read_data_right2
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/read_data
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/read_data_SFR
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/address
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/write_data
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/MemRead
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/Memwrite
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/clock
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/reset
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/write_clock
add wave -noupdate -expand -group {rest of MIPS} -radix hexadecimal /mcu_tb/U_0/CPU/MEM_model/MEM_model_real/read_memwrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5974735 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 427
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {5269552 ps} {7567360 ps}
