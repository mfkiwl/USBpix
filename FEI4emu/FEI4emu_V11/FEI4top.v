//
// Verilog Module FEI4_V0_lib.FEI4top
//
// Created:
//          by - Laura.UNKNOWN (SILAB51)
//          at - 12:17:41 06/10/2010
//
// using Mentor Graphics HDL Designer(TM) 2008.1b (Build 7)
//

`resetall
`timescale 1ns/10ps
module FEI4top(
RST_pin,
ChipID0, ChipID1, ChipID2,
IO_DataIN_N_pin, IO_DataIN_P_pin,
IO_DataIN_CLK_P_pin, IO_DataIN_CLK_N_pin,
IO_DataOUT1_N_pin, IO_DataOUT1_P_pin/*,
IO_DataOUT2_P_pin, IO_DataOUT2_N_pin*/
);

input RST_pin;
input ChipID0;
input ChipID1;
input ChipID2;
input IO_DataIN_N_pin;
input IO_DataIN_P_pin;
input IO_DataIN_CLK_P_pin;
input IO_DataIN_CLK_N_pin;

output IO_DataOUT1_N_pin;
output IO_DataOUT1_P_pin;
//output IO_DataOUT2_P_pin;
//output IO_DataOUT2_N_pin;

//internal signals
wire clk_tx;
wire clk_bc;
wire locked;
wire DCI;

wire [15:0] WrRegData;
wire [5:0] AddrCmd;
wire RdRegCmd;
wire WrRegCmd;
wire ResetCmd;
wire TriggerCmd;
wire BCRCmd;

wire [15:0] mem0;
wire [15:0] mem1;
wire [15:0] mem2;
wire [15:0] mem3;
wire [15:0] mem4;
wire [15:0] mem5;
wire [15:0] mem6;
wire [15:0] mem7;
wire [15:0] mem8;
wire [15:0] mem9;
wire [15:0] mem10;
wire [15:0] mem11;
wire [15:0] mem12;
wire [15:0] mem13;
wire [15:0] mem14;
wire [15:0] mem15;
wire [15:0] mem16;
wire [15:0] mem17;
wire [15:0] mem18;
wire [15:0] mem19;
wire [15:0] mem20;
wire [15:0] mem21;
wire [15:0] mem22;
wire [15:0] mem23;
wire [15:0] mem24;
wire [15:0] mem25;
wire [15:0] mem26;
wire [15:0] mem27;
wire [15:0] mem28;
wire [15:0] mem29;
wire [15:0] mem30;
wire [15:0] mem31;

wire [15:0] ConfData;
wire empty;
wire [7:0] DataWord0;
wire [7:0] DataWord1;
wire [7:0] DataWord2;
wire readfifo;
wire clkreadfifo;

wire data_out;

//////////////////////////////////////////
//CLOCK
//////////////////////////////////////////
xck ixck(
//inputs
  .CLKIN_N_IN (IO_DataIN_N_pin), 
  .CLKIN_P_IN (IO_DataIN_P_pin),          //External 40MHz clock
//outputs
  .CLKFX_OUT (clk_tx),                    //Internal 160MHz clock
  .CLKIN_IBUFGDS_OUT (), 
  .CLK0_OUT (clk_bc),                     //Internal 40MHz clock
  .LOCKED_OUT (locked)                    //Use for power on reset. Generates an active LOW, ASYNCH reset
);

/////////////////////////////////////////////////////////////////////////////////////////////////////
//DCI
/////////////////////////////////////////////////////////////////////////////////////////////////////

IBUFDS #(
      .CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
      .DIFF_TERM("FALSE"),       // Differential Termination (Virtex-4/5, Spartan-3E/3A)
      .IBUF_DELAY_VALUE("0"),    // Specify the amount of added input delay for
                                 //    the buffer, "0"-"16" (Spartan-3E only)
      .IFD_DELAY_VALUE("AUTO"),  // Specify the amount of added delay for input
                                 //    register, "AUTO", "0"-"8" (Spartan-3E/3A only)
      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_dci (
      .O(DCI),  // Buffer output
      .I(IO_DataIN_CLK_P_pin),  // Diff_p buffer input (connect directly to top-level port)
      .IB(IO_DataIN_CLK_N_pin) // Diff_n buffer input (connect directly to top-level port)
   );

reg DCI_clk;
always @(posedge clk_bc) begin
  DCI_clk <= DCI;
end 

/////////////////////////////////////////////////////////////////////////////////////////////////////
//COMMAND DECODER
/////////////////////////////////////////////////////////////////////////////////////////////////////

/*
I took away the deglitcher cause it did not synthesize
*/


/*
      * Command Decoder Module
      *
      * Contains the full Command Decoder with all triplication circuitry
      * for SEU detection and correction.
      *
      * Triplicated structures are:
      * 1) the Command Decoder State machine
      * 2) the Input Shift Register 
      * 3) 10 bit down counter (Cnt)
      * 4) RunMode FF
      * 5) Addr[5:0]
      * 6) WrRegData[15:0]
      *
      * Addr[5:0] and WrRegData are stable until next RdReg or WrReg is issued
      *
      * HitBus: It is the wired or of the HitBus. Uses a 5ns deglitcher.
      *         The Trigger signal s delayed by 16 ck cycles.
      *         VerCnt: Version done with a counter
      *         VerFF:  Version using FlipFlops instead of deglitcher
      *                 If the signal is more than a ck cycle wide we 
      *                 generate a Trigger signal.
      *
      * The machine is fully syncronous
      *
      * Resets: 
      * RstB asynchronous active low
      * ECR, BCR, PulseCmd: No effect on this block
      * ResetCmd: Clears Addr, WrRegData, CmdSeuCnt, BitFlipCnt, TrigErrCnt, 
      *           FastErr, SlowErr
      * RunMode cleared only by RstB and a Slow command.
      *
      */
      
cmd icmd(
// Inputs 
  .CNT({mem27[0],mem26[15:3]}),                 // [13:0] Register holding values for the Counter
  .ChipId({ChipID0, ChipID1, ChipID2}),         // [2:0] Hard-Wired ChipId
  .Test_SI(1'b0), 
  .Test_CK(1'b0), 
  .Test_SE(1'b0), 
  .Test_TM(1'b0), 
  .Ext_Trigger(1'b0), 
  .HitBus(1'b0), 
  .DCI(DCI_clk), 
  .CK(clk_bc),                            //internal 40Mhz clk
  .RstB(!RST_pin) ,                       //RstB asynchronous active low
//outputs
  .WrRegData(WrRegData),    //[15:0]
  .CmdErrReg(),             //[15:0]
  .Addr(AddrCmd),           //[5:0]
  .Trigger(TriggerCmd),
  .ECR(),
  .BCR(BCRCmd),
  .CAL(),
  .RdReg(RdRegCmd),
  .WrReg(WrRegCmd),
  .WrFE(WrFECmd), 
  .FEData(),
  .RunMode(),
  .ResetCmd(ResetCmd),
  .PulseCmd(), 
  .CmdSeu(),
  .BitFlip(),
  .CmdErr(),
  .AddrErr(),
  .WrRegDataErr(),
  .Test_SO()
); 

/////////////////////////////////////////////////////////////////////////////////////////////////////
//CNFGREG
/////////////////////////////////////////////////////////////////////////////////////////////////////

CNFGREG iCNFGREG(
//inputs
   .Addr      (AddrCmd[4:0]),             //[4:0]
   .DataIn    (WrRegData),                //[15:0]
   .R1        (locked),                   //Input from power on circuitry. Active LOW, ASYNCH. Combined with R2 to generate rst
   .R2        (locked),                   //Input from power on circuitry. Active LOW, ASYNCH. Combined with R1 to generate rst
                                          //rst = !R1 && !R2; active HIGH, ASYNC reset                
   .WE        (WrRegCmd),
//outputs
   .DataOut0  (mem0),                         //[15:0]
   .DataOut1  (mem1),
   .DataOut2  (mem2),
   .DataOut3  (mem3),
   .DataOut4  (mem4),
   .DataOut5  (mem5),
   .DataOut6  (mem6),
   .DataOut7  (mem7),
   .DataOut8  (mem8),
   .DataOut9  (mem9),
   .DataOut10 (mem10),
   .DataOut11 (mem11),
   .DataOut12 (mem12),
   .DataOut13 (mem13),
   .DataOut14 (mem14),
   .DataOut15 (mem15),
   .DataOut16 (mem16),
   .DataOut17 (mem17),
   .DataOut18 (mem18),
   .DataOut19 (mem19),
   .DataOut20 (mem20),
   .DataOut21 (mem21),
   .DataOut22 (mem22),
   .DataOut23 (mem23),
   .DataOut24 (mem24),
   .DataOut25 (mem25),
   .DataOut26 (mem26),
   .DataOut27 (mem27),
   .DataOut28 (mem28),
   .DataOut29 (mem29),
   .DataOut30 (mem30),
   .DataOut31 (mem31),
   .DataOut   (ConfData)
//   .err       (),                       //[31:0]
);

/////////////////////////////////////////////////////////////////////////////////////////////////////
//EOCHL_IP
/////////////////////////////////////////////////////////////////////////////////////////////////////

/* 
I am using the previous version of the deglitcher cause the new one did not synthesize
*/

EOCHL_IP iEOCHL_IP( 
//inputs
   .ClearBC(BCRCmd), 
   .ClearTrigId(1'b0), 
   .Clk(clk_bc), 
   .ColumnHamm(10'b0),                //[9:0]
   .Conf_Addr_Enable(mem2[11]), 
   .Conf_Address({10'b0,AddrCmd}),    //[15:0]
   .Conf_Data(ConfData),              //[15:0]
   .Conf_Write(RdRegCmd), 
   .DataAqEnable(1'b0),                   //from CMD
   .DataHamm(25'b0),                       //[24:0]
   .ErrorInBus(22'b0),                     //[31:10]
   .ErrorMask(32'b0),                      //[31:0]
   .L1_Trig_In(TriggerCmd), 
   .ReadErrorReq(1'b0), 
   .ReadSkipped(1'b0), 
   .Read_Fifo(readfifo), 
   .Read_clk_fifo(clockreadfifo), 
   .RowHamm(12'b0),                        //[11:0]
   .SR_Clock(1'b0), 
   .SR_In(1'b0), 
   .SR_Write(1'b0), 
   .Token(3'b0),                          //[2:0]
   .Trigger_Count(4'b0),                  //[3:0]
   .n_ResetIn(locked),                //input from power on circuitry. active low, asynch
//outputs
   .Conf_Free(), 
   .Data_Word0(DataWord0),            //[7:0]
   .Data_Word1(DataWord1),            //[7:0]
   .Data_Word2(DataWord2),            //[7:0]
   .Empty(empty), 
   .ErrorOut1(), 
   .L1In(),                           //[3:0]
   .L1Req(),                          //[3:0]
   .L1Trig_Out(), 
   .Read(), 
   .Skipped()                         //[7:0]
);

/////////////////////////////////////////////////////////////////////////////////////////////////////
//DOB
/////////////////////////////////////////////////////////////////////////////////////////////////////

output_data ioutput_data(  
//inputs
  .reset(ResetCmd),                         //active high, synch
  .clk(clk_bc), 
  .emptyFifo(empty),
  .data({DataWord0, DataWord1, DataWord2}),                // [23:0] 
  .no8b10bModeCnfg(mem2[10]),
  .clkToOutCnfg(mem2[9]),
  .emptyRecordCnfg(mem2[8:1]),                            //[7:0]
  .test_clk(1'b0), 
  .test_en(1'b0),
//ouputs
    .readFifo(readfifo),
    .clkReadFifo(clockreadfifo),
    .out(data_out)
);

/////////////////////////////////////////////////////////////////////////////////////////////////////
//Output buffer
/////////////////////////////////////////////////////////////////////////////////////////////////////

wire DATA;
assign DATA = !data_out;

OBUFDS #(
      .IOSTANDARD("DEFAULT") // Specify the output I/O standard
   ) OBUFDS_dataout (
      .O(IO_DataOUT1_P_pin),     // Diff_p output (connect directly to top-level port)
      .OB(IO_DataOUT1_N_pin),   // Diff_n output (connect directly to top-level port)
      .I(DATA)      // Buffer input 
   );

/*OBUFDS #(
      .IOSTANDARD("DEFAULT") // Specify the output I/O standard
   ) OBUFDS_debug (
      .O(IO_DataOUT2_P_pin),     // Diff_p output (connect directly to top-level port)
      .OB(IO_DataOUT2_N_pin),   // Diff_n output (connect directly to top-level port)
      .I(DCI_clk)      // Buffer input 
   );*/

endmodule