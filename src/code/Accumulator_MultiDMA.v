`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/29 02:42:13
// Design Name: 
// Module Name: Accumulator_MultiDMA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Accumulator_MultiDMA
(
    // System
    
        input   wire                sys_clk,
        input   wire                sys_rst_n,
        
    // Input
    
        input   wire                accu_en,
        
    // Output
    
        output  reg                 accu_finished,
        
        output  wire    [31 : 0]    sum_debug,
        output  wire    [7:0]       step_debug,
        
    // AXI Stream Interface
    
        input   wire                s_axis_0_aresetn,
        input   wire                s_axis_0_aclk,
        input   wire                s_axis_tvalid_0,
        output  wire                s_axis_tready_0,
        input   wire    [63 : 0]    s_axis_tdata_0,
        input   wire    [7 : 0]     s_axis_tkeep_0,
        input   wire                s_axis_tlast_0,
    
        input   wire                s_axis_1_aresetn,
        input   wire                s_axis_1_aclk,
        input   wire                s_axis_tvalid_1,
        output  wire                s_axis_tready_1,
        input   wire    [63 : 0]    s_axis_tdata_1,
        input   wire    [7 : 0]     s_axis_tkeep_1,
        input   wire                s_axis_tlast_1,
    
        input   wire                s_axis_2_aresetn,
        input   wire                s_axis_2_aclk,
        input   wire                s_axis_tvalid_2,
        output  wire                s_axis_tready_2,
        input   wire    [63 : 0]    s_axis_tdata_2,
        input   wire    [7 : 0]     s_axis_tkeep_2,
        input   wire                s_axis_tlast_2,
    
        input   wire                s_axis_3_aresetn,
        input   wire                s_axis_3_aclk,
        input   wire                s_axis_tvalid_3,
        output  wire                s_axis_tready_3,
        input   wire    [63 : 0]    s_axis_tdata_3,
        input   wire    [7 : 0]     s_axis_tkeep_3,
        input   wire                s_axis_tlast_3,
    
        input   wire                m_axis_aresetn,
        input   wire                m_axis_aclk,
        output  wire                m_axis_tvalid,
        input   wire                m_axis_tready,
        output  wire    [63 : 0]    m_axis_tdata,
        output  wire    [7 : 0]     m_axis_tkeep,
        output  wire                m_axis_tlast
);
        
wire                in_m_axis_tvalid_0;
reg                 in_m_axis_tready_0;
wire    [63 : 0]    in_m_axis_tdata_0;
wire    [7 : 0]     in_m_axis_tkeep_0;
wire                in_m_axis_tlast_0;
        
wire                in_m_axis_tvalid_1;
reg                 in_m_axis_tready_1;
wire    [63 : 0]    in_m_axis_tdata_1;
wire    [7 : 0]     in_m_axis_tkeep_1;
wire                in_m_axis_tlast_1;
        
wire                in_m_axis_tvalid_2;
reg                 in_m_axis_tready_2;
wire    [63 : 0]    in_m_axis_tdata_2;
wire    [7 : 0]     in_m_axis_tkeep_2;
wire                in_m_axis_tlast_2;
        
wire                in_m_axis_tvalid_3;
reg                 in_m_axis_tready_3;
wire    [63 : 0]    in_m_axis_tdata_3;
wire    [7 : 0]     in_m_axis_tkeep_3;
wire                in_m_axis_tlast_3;

reg                             rst;

axis_data_fifo_0 input_fifo_0
(
    .s_axis_aresetn(s_axis_0_aresetn & (!rst)),    // input    wire                s_axis_aresetn
    .s_axis_aclk(s_axis_0_aclk),                  // input    wire                s_axis_aclk
    
    .s_axis_tvalid(s_axis_tvalid_0),      // input    wire                s_axis_tvalid
    .s_axis_tready(s_axis_tready_0),      // output   wire                s_axis_tready
    .s_axis_tdata(s_axis_tdata_0),        // input    wire    [63 : 0]    s_axis_tdata
    .s_axis_tkeep(s_axis_tkeep_0),        // input    wire    [7 : 0]     s_axis_tkeep
    .s_axis_tlast(s_axis_tlast_0),        // input    wire                s_axis_tlast
  
    .m_axis_tvalid(in_m_axis_tvalid_0),   // output   wire                m_axis_tvalid
    .m_axis_tready(in_m_axis_tready_0),   // input    wire                m_axis_tready
    .m_axis_tdata(in_m_axis_tdata_0),     // output   wire    [63 : 0]    m_axis_tdata
    .m_axis_tkeep(in_m_axis_tkeep_0),     // output   wire    [7 : 0]     m_axis_tkeep
    .m_axis_tlast(in_m_axis_tlast_0)      // output   wire                m_axis_tlast
);

axis_data_fifo_0 input_fifo_1 
(
    .s_axis_aresetn(s_axis_1_aresetn & (!rst)),    // input    wire                s_axis_aresetn
    .s_axis_aclk(s_axis_1_aclk),                  // input    wire                s_axis_aclk
    
    .s_axis_tvalid(s_axis_tvalid_1),      // input    wire                s_axis_tvalid
    .s_axis_tready(s_axis_tready_1),      // output   wire                s_axis_tready
    .s_axis_tdata(s_axis_tdata_1),        // input    wire    [63 : 0]    s_axis_tdata
    .s_axis_tkeep(s_axis_tkeep_1),        // input    wire    [7 : 0]     s_axis_tkeep
    .s_axis_tlast(s_axis_tlast_1),        // input    wire                s_axis_tlast
  
    .m_axis_tvalid(in_m_axis_tvalid_1),   // output   wire                m_axis_tvalid
    .m_axis_tready(in_m_axis_tready_1),   // input    wire                m_axis_tready
    .m_axis_tdata(in_m_axis_tdata_1),     // output   wire    [63 : 0]    m_axis_tdata
    .m_axis_tkeep(in_m_axis_tkeep_1),     // output   wire    [7 : 0]     m_axis_tkeep
    .m_axis_tlast(in_m_axis_tlast_1)      // output   wire                m_axis_tlast
);

axis_data_fifo_0 input_fifo_2 
(
    .s_axis_aresetn(s_axis_2_aresetn & (!rst)),    // input    wire                s_axis_aresetn
    .s_axis_aclk(s_axis_2_aclk),                  // input    wire                s_axis_aclk
    
    .s_axis_tvalid(s_axis_tvalid_2),      // input    wire                s_axis_tvalid
    .s_axis_tready(s_axis_tready_2),      // output   wire                s_axis_tready
    .s_axis_tdata(s_axis_tdata_2),        // input    wire    [63 : 0]    s_axis_tdata
    .s_axis_tkeep(s_axis_tkeep_2),        // input    wire    [7 : 0]     s_axis_tkeep
    .s_axis_tlast(s_axis_tlast_2),        // input    wire                s_axis_tlast
  
    .m_axis_tvalid(in_m_axis_tvalid_2),   // output   wire                m_axis_tvalid
    .m_axis_tready(in_m_axis_tready_2),   // input    wire                m_axis_tready
    .m_axis_tdata(in_m_axis_tdata_2),     // output   wire    [63 : 0]    m_axis_tdata
    .m_axis_tkeep(in_m_axis_tkeep_2),     // output   wire    [7 : 0]     m_axis_tkeep
    .m_axis_tlast(in_m_axis_tlast_2)      // output   wire                m_axis_tlast
);

axis_data_fifo_0 input_fifo_3 
(
    .s_axis_aresetn(s_axis_3_aresetn & (!rst)),    // input    wire                s_axis_aresetn
    .s_axis_aclk(s_axis_3_aclk),                  // input    wire                s_axis_aclk
    
    .s_axis_tvalid(s_axis_tvalid_3),      // input    wire                s_axis_tvalid
    .s_axis_tready(s_axis_tready_3),      // output   wire                s_axis_tready
    .s_axis_tdata(s_axis_tdata_3),        // input    wire    [63 : 0]    s_axis_tdata
    .s_axis_tkeep(s_axis_tkeep_3),        // input    wire    [7 : 0]     s_axis_tkeep
    .s_axis_tlast(s_axis_tlast_3),        // input    wire                s_axis_tlast
  
    .m_axis_tvalid(in_m_axis_tvalid_3),   // output   wire                m_axis_tvalid
    .m_axis_tready(in_m_axis_tready_3),   // input    wire                m_axis_tready
    .m_axis_tdata(in_m_axis_tdata_3),     // output   wire    [63 : 0]    m_axis_tdata
    .m_axis_tkeep(in_m_axis_tkeep_3),     // output   wire    [7 : 0]     m_axis_tkeep
    .m_axis_tlast(in_m_axis_tlast_3)      // output   wire                m_axis_tlast
);
    
reg                 out_s_axis_tvalid;
wire                out_s_axis_tready;
reg     [63 : 0]    out_s_axis_tdata;
reg     [7 : 0]     out_s_axis_tkeep;
reg                 out_s_axis_tlast;

axis_data_fifo_0 output_fifo 
(
    .s_axis_aresetn(m_axis_aresetn),        // input    wire                s_axis_aresetn
    .s_axis_aclk(m_axis_aclk),              // input    wire                s_axis_aclk
    
    .s_axis_tvalid(out_s_axis_tvalid),      // input    wire                s_axis_tvalid
    .s_axis_tready(out_s_axis_tready),      // output   wire                s_axis_tready
    .s_axis_tdata(out_s_axis_tdata),        // input    wire    [63 : 0]    s_axis_tdata
    .s_axis_tkeep(out_s_axis_tkeep),        // input    wire    [7 : 0]     s_axis_tkeep
    .s_axis_tlast(out_s_axis_tlast),        // input    wire                s_axis_tlast
  
    .m_axis_tvalid(m_axis_tvalid),          // output   wire                m_axis_tvalid
    .m_axis_tready(m_axis_tready),          // input    wire                m_axis_tready
    .m_axis_tdata(m_axis_tdata),            // output   wire    [63 : 0]    m_axis_tdata
    .m_axis_tkeep(m_axis_tkeep),            // output   wire    [7 : 0]     m_axis_tkeep
    .m_axis_tlast(m_axis_tlast)             // output   wire                m_axis_tlast
);

wire    signed      [63 : 0]    signed_in_0;
wire    signed      [63 : 0]    signed_in_1;
wire    signed      [63 : 0]    signed_in_2;
wire    signed      [63 : 0]    signed_in_3;

reg                             signed_in_valid_0;
reg                             signed_in_valid_1;
reg                             signed_in_valid_2;
reg                             signed_in_valid_3;

assign signed_in_0 = in_m_axis_tdata_0;
assign signed_in_1 = in_m_axis_tdata_1;
assign signed_in_2 = in_m_axis_tdata_2;
assign signed_in_3 = in_m_axis_tdata_3;

reg     signed      [63 : 0]    sum_0;
reg     signed      [63 : 0]    sum_1;
reg     signed      [63 : 0]    sum_2;
reg     signed      [63 : 0]    sum_3;
reg     signed      [63 : 0]    sum;
reg                 [63 : 0]    cnt_0;
reg                 [63 : 0]    cnt_1;
reg                 [63 : 0]    cnt_2;
reg                 [63 : 0]    cnt_3;
reg                 [7 : 0]     step_0;
reg                 [7 : 0]     step_1;
reg                 [7 : 0]     step_2;
reg                 [7 : 0]     step_3;
reg                 [7 : 0]     step;
reg                 [63 : 0]    accu_length_3;
reg                 [63 : 0]    accu_length_0;
reg                 [63 : 0]    accu_length_1;
reg                 [63 : 0]    accu_length_2;

reg                             accu_finished_0;
reg                             accu_finished_1;
reg                             accu_finished_2;
reg                             accu_finished_3;

assign sum_debug = sum[31:0];
assign step_debug = step;

always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                sum_0               <= 0;
                cnt_0               <= 0;
                step_0              <= 0;
                in_m_axis_tready_0  <= 0;
                accu_length_0       <= 0;
                accu_finished_0     <= 0;
            end
            else begin
                if (accu_en)
                    begin
                        case (step_0)
                        
                            0   :   begin
                                        sum_0               <= sum_0;
                                        cnt_0               <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        accu_finished_0     <= 0;
                                        
                                        if (in_m_axis_tvalid_0)
                                            begin
                                                step_0              <= 1;
                                                accu_length_0       <= signed_in_0;
                                            end
                                            else begin
                                                step_0              <= 0;
                                                accu_length_0       <= 0;
                                            end
                                    end
                        
                            1   :   begin
                                        sum_0               <= sum_0;
                                        accu_length_0       <= accu_length_0;
                                        accu_finished_0     <= 0;
                                        
                                        if (in_m_axis_tvalid_0)
                                            begin
                                                step_0              <= 2;
                                                
                                                cnt_0               <= cnt_0 + 1;
                                                in_m_axis_tready_0  <= 1;
                                            end
                                            else begin
                                                step_0              <= 1;
                                               
                                                cnt_0               <= cnt_0;
                                                in_m_axis_tready_0  <= 0;
                                            end
                                    end
                        
                            2   :   begin
                                        sum_0               <= sum_0;
                                        cnt_0               <= cnt_0;
                                        step_0              <= 3;
                                        in_m_axis_tready_0  <= 0;
                                        accu_length_0       <= accu_length_0;
                                        accu_finished_0     <= 0;
                                    end
                        
                            3   :   begin
                                        sum_0               <= sum_0 + signed_in_0;
                                        cnt_0               <= cnt_0;
                                        in_m_axis_tready_0  <= 0;
                                        accu_length_0       <= accu_length_0;
                                        
                                        if (cnt_0==accu_length_0)
                                            begin
                                                step_0              <= 4;
                                                accu_finished_0     <= 1;
                                            end
                                            else begin
                                                step_0              <= 1;
                                                accu_finished_0     <= 0;
                                            end 
                                    end
                        
                            4   :   begin
                                        sum_0               <= sum_0;
                                        cnt_0               <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        accu_length_0       <= 0;
                                        step_0              <= 4;
                                        accu_finished_0     <= 1;
                                    end
                                    
                            default :   begin
                                            sum_0               <= 0;
                                            cnt_0               <= 0;
                                            in_m_axis_tready_0  <= 0;
                                            accu_length_0       <= 0;
                                            step_0              <= 0;
                                            accu_finished_0     <= 0;
                                        end
                                        
                        endcase
                    end
                    else begin
                        sum_0               <= 0;
                        cnt_0               <= 0;
                        in_m_axis_tready_0  <= 0;
                        accu_length_0       <= 0;
                        step_0              <= 0;
                        accu_finished_0     <= 0;
                    end
            end 
    end 
    
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                sum_1               <= 0;
                cnt_1               <= 0;
                step_1              <= 0;
                in_m_axis_tready_1  <= 0;
                accu_length_1       <= 0;
                accu_finished_1     <= 0;
            end
            else begin
                if (accu_en)
                    begin
                        case (step_1)
                        
                            0   :   begin
                                        sum_1               <= sum_1;
                                        cnt_1               <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        accu_finished_1     <= 0;
                                        
                                        if (in_m_axis_tvalid_1)
                                            begin
                                                step_1              <= 1;
                                                accu_length_1       <= signed_in_1;
                                            end
                                            else begin
                                                step_1              <= 0;
                                                accu_length_1       <= 0;
                                            end
                                    end
                        
                            1   :   begin
                                        sum_1               <= sum_1;
                                        accu_length_1       <= accu_length_1;
                                        accu_finished_1     <= 0;
                                        
                                        if (in_m_axis_tvalid_1)
                                            begin
                                                step_1              <= 2;
                                                
                                                cnt_1               <= cnt_1 + 1;
                                                in_m_axis_tready_1  <= 1;
                                            end
                                            else begin
                                                step_1              <= 1;
                                               
                                                cnt_1               <= cnt_1;
                                                in_m_axis_tready_1  <= 1;
                                            end
                                    end
                        
                            2   :   begin
                                        sum_1               <= sum_1;
                                        cnt_1               <= cnt_1;
                                        step_1              <= 3;
                                        in_m_axis_tready_1  <= 0;
                                        accu_length_1       <= accu_length_1;
                                        accu_finished_1     <= 0;
                                    end
                        
                            3   :   begin
                                        sum_1               <= sum_1 + signed_in_1;
                                        cnt_1               <= cnt_1;
                                        in_m_axis_tready_1  <= 0;
                                        accu_length_1       <= accu_length_1;
                                        
                                        if (cnt_1==accu_length_1)
                                            begin
                                                step_1              <= 4;
                                                accu_finished_1     <= 1;
                                            end
                                            else begin
                                                step_1              <= 1;
                                                accu_finished_1     <= 0;
                                            end 
                                    end
                        
                            4   :   begin
                                        sum_1               <= sum_1;
                                        cnt_1               <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        accu_length_1       <= 0;
                                        step_1              <= 4;
                                        accu_finished_1     <= 1;
                                    end
                                    
                            default :   begin
                                            sum_1               <= 0;
                                            cnt_1               <= 0;
                                            in_m_axis_tready_1  <= 0;
                                            accu_length_1       <= 0;
                                            step_1              <= 0;
                                            accu_finished_1     <= 0;
                                        end
                                        
                        endcase
                    end
                    else begin
                        sum_1               <= 0;
                        cnt_1               <= 0;
                        in_m_axis_tready_1  <= 0;
                        accu_length_1       <= 0;
                        step_1              <= 0;
                        accu_finished_1     <= 0;
                    end
            end 
    end 

    
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                sum_2               <= 0;
                cnt_2               <= 0;
                step_2              <= 0;
                in_m_axis_tready_2  <= 0;
                accu_length_2       <= 0;
                accu_finished_2     <= 0;
            end
            else begin
                if (accu_en)
                    begin
                        case (step_2)
                        
                            0   :   begin
                                        sum_2               <= sum_2;
                                        cnt_2               <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        accu_finished_2     <= 0;
                                        
                                        if (in_m_axis_tvalid_2)
                                            begin
                                                step_2             <= 1;
                                                accu_length_2       <= signed_in_2;
                                            end
                                            else begin
                                                step_2              <= 0;
                                                accu_length_2       <= 0;
                                            end
                                    end
                        
                            1   :   begin
                                        sum_2               <= sum_2;
                                        accu_length_2       <= accu_length_2;
                                        accu_finished_2     <= 0;
                                        
                                        if (in_m_axis_tvalid_2)
                                            begin
                                                step_2              <= 2;
                                                
                                                cnt_2               <= cnt_2 + 1;
                                                in_m_axis_tready_2  <= 1;
                                            end
                                            else begin
                                                step_2              <= 1;
                                               
                                                cnt_2               <= cnt_2;
                                                in_m_axis_tready_2  <= 1;
                                            end
                                    end
                        
                            2   :   begin
                                        sum_2               <= sum_2;
                                        cnt_2               <= cnt_2;
                                        step_2              <= 3;
                                        in_m_axis_tready_2  <= 0;
                                        accu_length_2       <= accu_length_2;
                                        accu_finished_2     <= 0;
                                    end
                        
                            3   :   begin
                                        sum_2               <= sum_2 + signed_in_2;
                                        cnt_2               <= cnt_2;
                                        in_m_axis_tready_2  <= 0;
                                        accu_length_2       <= accu_length_2;
                                        
                                        if (cnt_2==accu_length_2)
                                            begin
                                                step_2              <= 4;
                                                accu_finished_2     <= 1;
                                            end
                                            else begin
                                                step_2              <= 1;
                                                accu_finished_2     <= 0;
                                            end 
                                    end
                        
                            4   :   begin
                                        sum_2               <= sum_2;
                                        cnt_2               <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        accu_length_2       <= 0;
                                        step_2              <= 4;
                                        accu_finished_2     <= 1;
                                    end
                                    
                            default :   begin
                                            sum_2               <= 0;
                                            cnt_2               <= 0;
                                            in_m_axis_tready_2  <= 0;
                                            accu_length_2       <= 0;
                                            step_2              <= 0;
                                            accu_finished_2     <= 0;
                                        end
                                        
                        endcase
                    end
                    else begin
                        sum_2               <= 0;
                        cnt_2               <= 0;
                        in_m_axis_tready_2  <= 0;
                        accu_length_2       <= 0;
                        step_2              <= 0;
                        accu_finished_2     <= 0;
                    end
            end 
    end 
    
always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                sum_3               <= 0;
                cnt_3               <= 0;
                step_3              <= 0;
                in_m_axis_tready_3  <= 0;
                accu_length_3       <= 0;
                accu_finished_3     <= 0;
            end
            else begin
                if (accu_en)
                    begin
                        case (step_3)
                        
                            0   :   begin
                                        sum_3               <= sum_3;
                                        cnt_3               <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        accu_finished_3     <= 0;
                                        
                                        if (in_m_axis_tvalid_3)
                                            begin
                                                step_3              <= 1;
                                                accu_length_3       <= signed_in_3;
                                            end
                                            else begin
                                                step_3              <= 0;
                                                accu_length_3       <= 0;
                                            end
                                    end
                        
                            1   :   begin
                                        sum_3               <= sum_3;
                                        accu_length_3       <= accu_length_3;
                                        accu_finished_3     <= 0;
                                        
                                        if (in_m_axis_tvalid_3)
                                            begin
                                                step_3              <= 2;
                                                
                                                cnt_3               <= cnt_3 + 1;
                                                in_m_axis_tready_3  <= 1;
                                            end
                                            else begin
                                                step_3              <= 1;
                                               
                                                cnt_3               <= cnt_3;
                                                in_m_axis_tready_3  <= 1;
                                            end
                                    end
                        
                            2   :   begin
                                        sum_3               <= sum_3;
                                        cnt_3               <= cnt_3;
                                        step_3              <= 3;
                                        in_m_axis_tready_3  <= 0;
                                        accu_length_3       <= accu_length_3;
                                        accu_finished_3     <= 0;
                                    end
                        
                            3   :   begin
                                        sum_3               <= sum_3 + signed_in_3;
                                        cnt_3               <= cnt_3;
                                        in_m_axis_tready_3  <= 0;
                                        accu_length_3       <= accu_length_3;
                                        
                                        if (cnt_3==accu_length_3)
                                            begin
                                                step_3              <= 4;
                                                accu_finished_3     <= 1;
                                            end
                                            else begin
                                                step_3              <= 1;
                                                accu_finished_3     <= 0;
                                            end 
                                    end
                        
                            4   :   begin
                                        sum_3               <= sum_3;
                                        cnt_3               <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        accu_length_3       <= 0;
                                        step_3              <= 4;
                                        accu_finished_3     <= 1;
                                    end
                                    
                            default :   begin
                                            sum_3               <= 0;
                                            cnt_3               <= 0;
                                            in_m_axis_tready_3  <= 0;
                                            accu_length_3       <= 0;
                                            step_3              <= 0;
                                            accu_finished_3     <= 0;
                                        end
                                        
                        endcase
                    end
                    else begin
                        sum_3               <= 0;
                        cnt_3               <= 0;
                        in_m_axis_tready_3  <= 0;
                        accu_length_3       <= 0;
                        step_3              <= 0;
                        accu_finished_3     <= 0;
                    end
            end 
    end 

always @(posedge sys_clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            begin
                rst                 <= 0;
                sum                 <= 0;
                cnt_0               <= 0;
                cnt_1               <= 0;
                cnt_2               <= 0;
                cnt_3               <= 0;
                step                <= 0;
                accu_finished       <= 1;
                in_m_axis_tready_0  <= 0;
                in_m_axis_tready_1  <= 0;
                in_m_axis_tready_2  <= 0;
                in_m_axis_tready_3  <= 0;
                signed_in_valid_0   <= 0;
                signed_in_valid_1   <= 0;
                signed_in_valid_2   <= 0;
                signed_in_valid_3   <= 0;
                out_s_axis_tvalid   <= 0;
                out_s_axis_tdata    <= 0;
                out_s_axis_tkeep    <= 0;
                out_s_axis_tlast    <= 0;
                accu_length_0       <= 0;
                accu_length_1       <= 0;
                accu_length_2       <= 0;
                accu_length_3       <= 0;
            end
            else begin
                if (accu_en)
                    begin
                        case (step)
                        
                            0   :   begin
                                        rst                 <= 0;
                                        sum                 <= sum;
                                        cnt_0               <= 0;
                                        cnt_1               <= 0;
                                        cnt_2               <= 0;
                                        cnt_3               <= 0;
                                        accu_finished       <= 0;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        
                                        if (in_m_axis_tvalid_0 && in_m_axis_tvalid_1 && in_m_axis_tvalid_2 && in_m_axis_tvalid_3 )
                                            begin
                                                step                <= 1;
                                                accu_length_0       <= signed_in_0;
                                                accu_length_1       <= signed_in_1;
                                                accu_length_2       <= signed_in_2;
                                                accu_length_3       <= signed_in_3;
                                            end
                                            else begin
                                                step                <= 0;
                                                accu_length_0       <= 0;
                                                accu_length_1       <= 0;
                                                accu_length_2       <= 0;
                                                accu_length_3       <= 0;
                                            end
                                    end
                        
                            1   :   begin
                                        rst                 <= 0;
                                        sum                 <= sum;
                                        accu_finished       <= 0;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        accu_length_0       <= accu_length_0;
                                        accu_length_1       <= accu_length_1;
                                        accu_length_2       <= accu_length_2;
                                        accu_length_3       <= accu_length_3;
                                        
                                        if (in_m_axis_tvalid_0 && in_m_axis_tvalid_1 && in_m_axis_tvalid_2 && in_m_axis_tvalid_3 )
                                            begin
                                                step                <= 2;
                                                
                                                cnt_0               <= cnt_0 + 1;
                                                signed_in_valid_0   <= 1;
                                                in_m_axis_tready_0  <= 1;
                                                
                                                cnt_1               <= cnt_1 + 1;
                                                signed_in_valid_1   <= 1;
                                                in_m_axis_tready_1  <= 1;
                                                
                                                cnt_2               <= cnt_2 + 1;
                                                signed_in_valid_2   <= 1;
                                                in_m_axis_tready_2  <= 1;
                                                
                                                cnt_3               <= cnt_3 + 1;
                                                signed_in_valid_3   <= 1;
                                                in_m_axis_tready_3  <= 1;
                                            end
                                            else begin
                                                step                <= 1;
                                                
                                                cnt_0               <= cnt_0;
                                                signed_in_valid_0   <= 0;
                                                in_m_axis_tready_0  <= 0;
                                                
                                                cnt_1               <= cnt_1;
                                                signed_in_valid_1   <= 0;
                                                in_m_axis_tready_1  <= 0;
                                                
                                                cnt_2               <= cnt_2;
                                                signed_in_valid_2   <= 0;
                                                in_m_axis_tready_2  <= 0;
                                                
                                                cnt_3               <= cnt_3;
                                                signed_in_valid_3   <= 0;
                                                in_m_axis_tready_3  <= 0;
                                            end
                                    end
                        
                            2   :   begin
                                        rst                 <= 0;
                                        sum                 <= sum;
                                        cnt_0               <= cnt_0;
                                        cnt_1               <= cnt_1;
                                        cnt_2               <= cnt_2;
                                        cnt_3               <= cnt_3;
                                        step                <= 3;
                                        accu_finished       <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        signed_in_valid_0   <= signed_in_valid_0;
                                        signed_in_valid_1   <= signed_in_valid_1;
                                        signed_in_valid_2   <= signed_in_valid_2;
                                        signed_in_valid_3   <= signed_in_valid_3;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        accu_length_0       <= accu_length_0;
                                        accu_length_1       <= accu_length_1;
                                        accu_length_2       <= accu_length_2;
                                        accu_length_3       <= accu_length_3;
                                    end
                        
                            3   :   begin
                                        rst                 <= 0;
                                        sum                 <= sum + ((signed_in_valid_0) ? signed_in_0 : 0) + ((signed_in_valid_1) ? signed_in_1 : 0) + ((signed_in_valid_2) ? signed_in_2 : 0) + ((signed_in_valid_3) ? signed_in_3 : 0);
                                        cnt_0               <= cnt_0;
                                        cnt_1               <= cnt_1;
                                        cnt_2               <= cnt_2;
                                        cnt_3               <= cnt_3;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        accu_length_0       <= accu_length_0;
                                        accu_length_1       <= accu_length_1;
                                        accu_length_2       <= accu_length_2;
                                        accu_length_3       <= accu_length_3;
                                        
                                        if ((cnt_0==accu_length_0) && (cnt_1==accu_length_1) && (cnt_2==accu_length_2) && (cnt_3==accu_length_3))
                                            begin
                                                step                <= 4;
                                                accu_finished       <= 0;
                                            end
                                            else begin
                                                step                <= 1;
                                                accu_finished       <= 0;
                                            end 
                                            
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                    end
                        
                            4   :   begin
                                        cnt_0               <= 0;
                                        cnt_1               <= 0;
                                        cnt_2               <= 0;
                                        cnt_3               <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        accu_length_0       <= accu_length_0;
                                        accu_length_1       <= accu_length_1;
                                        accu_length_2       <= accu_length_2;
                                        accu_length_3       <= accu_length_3;
                                        
                                        if (out_s_axis_tready)
                                            begin
                                                rst                 <= 0;
                                                accu_finished       <= 0;
                                                sum                 <= sum;
                                                out_s_axis_tvalid   <= 1;
                                                out_s_axis_tdata    <= sum;
                                                out_s_axis_tkeep    <= 8'b1111_1111;
                                                out_s_axis_tlast    <= 1;
                                                step                <= 5;
                                            end
                                            else begin
                                                rst                 <= 0;
                                                accu_finished       <= 0;
                                                sum                 <= sum;
                                                out_s_axis_tvalid   <= 0;
                                                out_s_axis_tdata    <= 0;
                                                out_s_axis_tkeep    <= 0;
                                                out_s_axis_tlast    <= 0;
                                                step                <= 4;
                                            end 
                                    end
                                    
                            5   :   begin
                                        rst                 <= 1;
                                        sum                 <= sum;
                                        step                <= 6;
                                        accu_finished       <= 0;
                                        cnt_0               <= 0;
                                        cnt_1               <= 0;
                                        cnt_2               <= 0;
                                        cnt_3               <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        accu_length_0       <= 0;
                                        accu_length_1       <= 0;
                                        accu_length_2       <= 0;
                                        accu_length_3       <= 0;
                                    end
                                    
                            6   :   begin
                                        rst                 <= 0;
                                        sum                 <= sum;
                                        cnt_0               <= 0;
                                        cnt_1               <= 0;
                                        cnt_2               <= 0;
                                        cnt_3               <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        if ((!s_axis_tready_0) && (!s_axis_tready_1) && (!s_axis_tready_2) && (!s_axis_tready_3))
                                            begin
                                                step        <= 7;
                                            end
                                            else begin
                                                step        <= 6;
                                            end
                                        accu_finished       <= 0;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        accu_length_0       <= 0;
                                        accu_length_1       <= 0;
                                        accu_length_2       <= 0;
                                        accu_length_3       <= 0;
                                    end
                                    
                            7   :   begin
                                        rst                 <= 0;
                                        sum                 <= sum;
                                        step                <= 7;
                                        if (s_axis_tready_0 && s_axis_tready_1 && s_axis_tready_2 && s_axis_tready_3)
                                            begin
                                                accu_finished       <= 1;
                                            end
                                            else begin
                                                accu_finished       <= 0;
                                            end
                                        cnt_0               <= 0;
                                        cnt_1               <= 0;
                                        cnt_2               <= 0;
                                        cnt_3               <= 0;
                                        in_m_axis_tready_0  <= 0;
                                        in_m_axis_tready_1  <= 0;
                                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                                        out_s_axis_tvalid   <= 0;
                                        out_s_axis_tdata    <= 0;
                                        out_s_axis_tkeep    <= 0;
                                        out_s_axis_tlast    <= 0;
                                        accu_length_0       <= 0;
                                        accu_length_1       <= 0;
                                        accu_length_2       <= 0;
                                        accu_length_3       <= 0;
                                    end
                                    
                            default :   begin
                                            rst                 <= 0;
                                            sum                 <= 0;
                                            step                <= 0;
                                            accu_finished       <= 1;
                                            cnt_0               <= 0;
                                            cnt_1               <= 0;
                                            cnt_2               <= 0;
                                            cnt_3               <= 0;
                                            in_m_axis_tready_0  <= 0;
                                            in_m_axis_tready_1  <= 0;
                                            in_m_axis_tready_2  <= 0;
                                            in_m_axis_tready_3  <= 0;
                                            out_s_axis_tvalid   <= 0;
                                            out_s_axis_tdata    <= 0;
                                            out_s_axis_tkeep    <= 0;
                                            out_s_axis_tlast    <= 0;
                                            accu_length_0       <= 0;
                                            accu_length_1       <= 0;
                                            accu_length_2       <= 0;
                                            accu_length_3       <= 0;
                                        end
                                        
                        endcase
                    end
                    else begin
                        rst                 <= 0;
                        sum                 <= 0;
                        step                <= 0;
                        accu_finished       <= 1;
                        cnt_0               <= 0;
                        cnt_1               <= 0;
                        cnt_2               <= 0;
                        cnt_3               <= 0;
                        in_m_axis_tready_0  <= 0;
                        in_m_axis_tready_1  <= 0;
                        in_m_axis_tready_2  <= 0;
                                        in_m_axis_tready_3  <= 0;
                        out_s_axis_tvalid   <= 0;
                        out_s_axis_tdata    <= 0;
                        accu_length_0       <= 0;
                        accu_length_1       <= 0;
                        accu_length_2       <= 0;
                        accu_length_3       <= 0;
                        out_s_axis_tkeep    <= 0;
                        out_s_axis_tlast    <= 0;
                    end
            end 
    end 

endmodule