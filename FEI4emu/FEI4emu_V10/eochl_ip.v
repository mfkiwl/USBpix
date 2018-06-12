//
// Module ReadOutControl_lib.EOCHL_IP.struct
//
// Created:
//          by - jds.UNKNOWN (ANDOORN)
//          at - 14:37:13 02/ 1/2010
//
// Generated by Mentor Graphics' HDL Designer(TM) 2008.1 (Build 17)
//

`resetall
`timescale 1ns/10ps

//`include "readoutcontroller.v"
//`include "BC_Register.v"
//`include "data_switch.v"
//`include "L1In_Counter.v"
//`include "L1Req_Counter.v"
//`include "L1_Register.v"
//`include "ReadOut_Processor.v"
//`include "SkippedLV1.v"
//`include "data_split.v"
//`include "fifo.v"
//`include "fifomem.v"
//`include "rptr_empty_seu.v"
//`include "sync_r2w.v"
//`include "sync_w2r.v"
//`include "wptr_full_seu.v"
//`include "Data_Concentrator.v"
//`include "hamming_encode.v"
//`include "hamming_decode.v"
//`include "Trigger.v"
//`include "BC_Counter.v"
//`include "L1_Trig_Id.v"
//`include "Add_Flags.v"
//`include "error_handler.v"
//`include "Error_Control.v"
//`include "Error_Counter_Mask.v"
//`include "data_formater_majority_logic.v"
//`include "Reset.v"
//`include "Shift_Register.v" 
//`include "deglitcher.v" 
//`include "data_formater.sv" 

module EOCHL_IP( 
   ClearBC, 
   ClearTrigId, 
   Clk, 
   ColumnHamm, 
   Conf_Addr_Enable, 
   Conf_Address, 
   Conf_Data, 
   Conf_Write, 
   DataAqEnable, 
   DataHamm, 
   ErrorInBus, 
   ErrorMask, 
   L1_Trig_In, 
   ReadErrorReq, 
   ReadSkipped, 
   Read_Fifo, 
   Read_clk_fifo, 
   RowHamm, 
   SR_Clock, 
   SR_In, 
   SR_Write, 
   Token, 
   Trigger_Count, 
   n_ResetIn, 
   Conf_Free, 
   Data_Word0, 
   Data_Word1, 
   Data_Word2, 
   Empty, 
   ErrorOut1, 
   L1In, 
   L1Req, 
   L1Trig_Out, 
   Read, 
   Skipped
);


// Internal Declarations

input           ClearBC;
input           ClearTrigId;
input           Clk;
input   [9:0]   ColumnHamm;
input           Conf_Addr_Enable;
input   [15:0]  Conf_Address;
input   [15:0]  Conf_Data;
input           Conf_Write;
input           DataAqEnable;
input   [24:0]  DataHamm;
input   [31:10] ErrorInBus;
input   [31:0]  ErrorMask;
input           L1_Trig_In;
input           ReadErrorReq;
input           ReadSkipped;
input           Read_Fifo;
input           Read_clk_fifo;
input   [11:0]  RowHamm;
input           SR_Clock;
input           SR_In;
input           SR_Write;
input   [2:0]   Token;
input   [3:0]   Trigger_Count;
input           n_ResetIn;
output          Conf_Free;
output  [7:0]   Data_Word0;
output  [7:0]   Data_Word1;
output  [7:0]   Data_Word2;
output          Empty;
output          ErrorOut1;
output  [3:0]   L1In;
output  [3:0]   L1Req;
output          L1Trig_Out;
output          Read;
output  [7:0]   Skipped;


wire          ClearBC;
wire          ClearTrigId;
wire          Clk;
wire  [9:0]   ColumnHamm;
wire          Conf_Addr_Enable;
wire  [15:0]  Conf_Address;
wire  [15:0]  Conf_Data;
wire          Conf_Write;
wire          DataAqEnable;
wire  [24:0]  DataHamm;
wire  [31:10] ErrorInBus;
wire  [31:0]  ErrorMask;
wire          L1_Trig_In;
wire          ReadErrorReq;
wire          ReadSkipped;
wire          Read_Fifo;
wire          Read_clk_fifo;
wire  [11:0]  RowHamm;
wire          SR_Clock;
wire          SR_In;
wire          SR_Write;
wire  [2:0]   Token;
wire  [3:0]   Trigger_Count;
wire          n_ResetIn;
wire          Conf_Free;
wire  [7:0]   Data_Word0;
wire  [7:0]   Data_Word1;
wire  [7:0]   Data_Word2;
wire          Empty;
wire          ErrorOut1;
wire  [3:0]   L1In;
wire  [3:0]   L1Req;
wire          L1Trig_Out;
wire          Read;
wire  [7:0]   Skipped;

// Local declarations

// Internal signal declarations
wire         BC_Counter_Error;
wire  [6:0]  Column;
wire  [15:0] Conf_Address_Out;
wire  [15:0] Conf_Data_out;
wire         Conf_Free_In;
wire         Conf_Write_Out;
wire  [6:0]  DataOut_Column;
wire  [6:0]  DataOut_Column1;
wire  [6:0]  DataOut_Column2;
wire  [8:0]  DataOut_Row;
wire  [8:0]  DataOut_Row1;
wire  [8:0]  DataOut_Row2;
wire  [3:0]  DataOut_TotBottom;
wire  [3:0]  DataOut_TotBottom1;
wire  [3:0]  DataOut_TotBottom2;
wire  [3:0]  DataOut_TotTop;
wire  [3:0]  DataOut_TotTop1;
wire  [3:0]  DataOut_TotTop2;
wire         EBInWrite;
wire         EBWrite;
wire         ErrorReq;
wire         Fifo_Full;
wire         Hamming_Error0;
wire         Hamming_Error1;
wire         Hamming_Error2;
wire         L1In_Counter_Error;
wire         L1Req_Counter_Error;
wire         L1_Register_Error;
wire         L1_Trig_Id_Error;
wire         NotFull;
wire         Out;
wire         ReadOut_Processor_Error;
wire         ReadyFormater;
wire         ReadyOut;
wire         ReadyOut1;
wire         ReadyOut2;
wire         Reset;
wire         Reset1;
wire         Reset_Serv_Req;
wire  [8:0]  Row;
wire  [15:0] Ser_Data;
wire  [3:0]  TotBottom;
wire  [3:0]  TotTop;
wire         TriggerFinish;
wire         WriteOut;
wire         WriteOut1;
wire         WriteOut2;
wire         Write_Serv;


// Instances 
Error_Handler U_0( 
   .Clk          (Clk), 
   .ErrorIn0     (BC_Counter_Error), 
   .ErrorIn1     (Hamming_Error0), 
   .ErrorIn10    (ErrorInBus[10]), 
   .ErrorIn11    (ErrorInBus[11]), 
   .ErrorIn12    (ErrorInBus[12]), 
   .ErrorIn13    (ErrorInBus[13]), 
   .ErrorIn14    (ErrorInBus[14]), 
   .ErrorIn15    (ErrorInBus[15]), 
   .ErrorIn16    (ErrorInBus[16]), 
   .ErrorIn17    (ErrorInBus[17]), 
   .ErrorIn18    (ErrorInBus[18]), 
   .ErrorIn19    (ErrorInBus[19]), 
   .ErrorIn2     (Hamming_Error1), 
   .ErrorIn20    (ErrorInBus[20]), 
   .ErrorIn21    (ErrorInBus[21]), 
   .ErrorIn22    (ErrorInBus[22]), 
   .ErrorIn23    (ErrorInBus[23]), 
   .ErrorIn24    (ErrorInBus[24]), 
   .ErrorIn25    (ErrorInBus[25]), 
   .ErrorIn26    (ErrorInBus[26]), 
   .ErrorIn27    (ErrorInBus[27]), 
   .ErrorIn28    (ErrorInBus[28]), 
   .ErrorIn29    (ErrorInBus[29]), 
   .ErrorIn3     (Hamming_Error2), 
   .ErrorIn30    (ErrorInBus[30]), 
   .ErrorIn31    (ErrorInBus[31]), 
   .ErrorIn4     (L1In_Counter_Error), 
   .ErrorIn5     (L1Req_Counter_Error), 
   .ErrorIn6     (L1_Register_Error), 
   .ErrorIn7     (L1_Trig_Id_Error), 
   .ErrorIn8     (ReadOut_Processor_Error), 
   .ErrorIn9     (Fifo_Full), 
   .ErrorMask    (ErrorMask), 
   .ReadErrorReq (ReadErrorReq), 
   .Reset        (Reset), 
   .Reset_Req    (Reset_Serv_Req), 
   .ErrorCount   (Ser_Data[9:0]), 
   .ErrorNumber  (Ser_Data[15:10]), 
   .ErrorOut1    (ErrorOut1), 
   .ErrorReq     (ErrorReq), 
   .Write_Serv   (Write_Serv)
); 

ReadOutController U_1( 
   .ClearBC                 (ClearBC), 
   .ClearTrigId             (ClearTrigId), 
   .Clk                     (Clk), 
   .Column                  (Column), 
   .Conf_Addr_Enable        (Conf_Addr_Enable), 
   .Conf_Address            (Conf_Address_Out), 
   .Conf_Data               (Conf_Data_out), 
   .Conf_Write              (Conf_Write_Out), 
   .DataAqEnable            (DataAqEnable), 
   .EBWrite                 (EBWrite), 
   .ErrorReq                (ErrorReq), 
   .L1_Trig_In              (L1_Trig_In), 
   .ReadSkipped             (ReadSkipped), 
   .Read_Fifo               (Read_Fifo), 
   .Read_clk_fifo           (Read_clk_fifo), 
   .ReadyFormater           (ReadyFormater), 
   .Reset                   (Reset), 
   .Row                     (Row), 
   .Ser_Data                (Ser_Data), 
   .Token                   (Token), 
   .TotBottom               (TotBottom), 
   .TotTop                  (TotTop), 
   .Trigger_Count           (Trigger_Count), 
   .Write_Service           (Write_Serv), 
   .BC_Counter_Error        (BC_Counter_Error), 
   .Conf_Free               (Conf_Free_In), 
   .Data_Word0              (Data_Word0), 
   .Data_Word1              (Data_Word1), 
   .Data_Word2              (Data_Word2), 
   .EBInWrite               (EBInWrite), 
   .Empty                   (Empty), 
   .Fifo_Full               (Fifo_Full), 
   .Hamming_Error0          (Hamming_Error0), 
   .Hamming_Error1          (Hamming_Error1), 
   .Hamming_Error2          (Hamming_Error2), 
   .L1In                    (L1In), 
   .L1In_Counter_Error      (L1In_Counter_Error), 
   .L1Req                   (L1Req), 
   .L1Req_Counter_Error     (L1Req_Counter_Error), 
   .L1Trig_Out              (L1Trig_Out), 
   .L1_Register_Error       (L1_Register_Error), 
   .L1_Trig_Id_Error        (L1_Trig_Id_Error), 
   .NotFull                 (NotFull), 
   .Read                    (Read), 
   .ReadOut_Processor_Error (ReadOut_Processor_Error), 
   .Reset_Serv_Req          (Reset_Serv_Req), 
   .Skipped                 (Skipped), 
   .TriggerFinish           (TriggerFinish)
); 

Reset U_6( 
   .ResetIn (Out), 
   .nReset  (Reset), 
   .Reset   (Reset1)
); 

Shift_Register U_7( 
   .Conf_Write_In    (Conf_Write), 
   .Conf_Write_Out   (Conf_Write_Out), 
   .Conf_Data_In     (Conf_Data), 
   .Conf_Data_Out    (Conf_Data_out), 
   .Conf_Address_In  (Conf_Address), 
   .Conf_Address_Out (Conf_Address_Out), 
   .Conf_Free_In     (Conf_Free_In), 
   .Conf_Free_Out    (Conf_Free), 
   .Clk              (Clk), 
   .Reset            (Reset), 
   .SR_In            (SR_In), 
   .SR_Write         (SR_Write), 
   .SR_Clock         (SR_Clock)
); 

data_formater U_3( 
   .clk               (Clk), 
   .reset             (Reset1), 
   .WriteIn           (EBInWrite), 
   .TriggerFinishIn   (TriggerFinish), 
   .ReadyIn           (NotFull), 
   .ColumnHamm        (ColumnHamm), 
   .RowHamm           (RowHamm), 
   .DataHamm          (DataHamm), 
   .WriteOut          (WriteOut), 
   .ReadyOut          (ReadyOut), 
   .DataOut_Column    (DataOut_Column), 
   .DataOut_Row       (DataOut_Row), 
   .DataOut_TotTop    (DataOut_TotTop), 
   .DataOut_TotBottom (DataOut_TotBottom)
); 

data_formater U_4( 
   .clk               (Clk), 
   .reset             (Reset1), 
   .WriteIn           (EBInWrite), 
   .TriggerFinishIn   (TriggerFinish), 
   .ReadyIn           (NotFull), 
   .ColumnHamm        (ColumnHamm), 
   .RowHamm           (RowHamm), 
   .DataHamm          (DataHamm), 
   .WriteOut          (WriteOut1), 
   .ReadyOut          (ReadyOut1), 
   .DataOut_Column    (DataOut_Column1), 
   .DataOut_Row       (DataOut_Row1), 
   .DataOut_TotTop    (DataOut_TotTop1), 
   .DataOut_TotBottom (DataOut_TotBottom1)
); 

data_formater U_5( 
   .clk               (Clk), 
   .reset             (Reset1), 
   .WriteIn           (EBInWrite), 
   .TriggerFinishIn   (TriggerFinish), 
   .ReadyIn           (NotFull), 
   .ColumnHamm        (ColumnHamm), 
   .RowHamm           (RowHamm), 
   .DataHamm          (DataHamm), 
   .WriteOut          (WriteOut2), 
   .ReadyOut          (ReadyOut2), 
   .DataOut_Column    (DataOut_Column2), 
   .DataOut_Row       (DataOut_Row2), 
   .DataOut_TotTop    (DataOut_TotTop2), 
   .DataOut_TotBottom (DataOut_TotBottom2)
); 

data_formater_majority_logic U_2( 
   .WriteOut0          (WriteOut), 
   .WriteOut1          (WriteOut1), 
   .WriteOut2          (WriteOut2), 
   .ReadyOut0          (ReadyOut), 
   .ReadyOut1          (ReadyOut1), 
   .ReadyOut2          (ReadyOut2), 
   .DataOut_Column0    (DataOut_Column), 
   .DataOut_Column1    (DataOut_Column1), 
   .DataOut_Column2    (DataOut_Column2), 
   .DataOut_Row0       (DataOut_Row), 
   .DataOut_Row1       (DataOut_Row1), 
   .DataOut_Row2       (DataOut_Row2), 
   .DataOut_TotTop0    (DataOut_TotTop), 
   .DataOut_TotTop1    (DataOut_TotTop1), 
   .DataOut_TotTop2    (DataOut_TotTop2), 
   .DataOut_TotBottom0 (DataOut_TotBottom), 
   .DataOut_TotBottom1 (DataOut_TotBottom1), 
   .DataOut_TotBottom2 (DataOut_TotBottom2), 
   .WriteOut           (EBWrite), 
   .ReadyOut           (ReadyFormater), 
   .DataOut_Column     (Column), 
   .DataOut_Row        (Row), 
   .DataOut_TotTop     (TotTop), 
   .DataOut_TotBottom  (TotBottom)
); 

deglitcher U_8( 
   .In  (n_ResetIn), 
   .Out (Out)
); 


endmodule // EOCHL_IP
