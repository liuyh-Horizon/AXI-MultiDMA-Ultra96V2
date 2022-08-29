`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/29 03:10:35
// Design Name: 
// Module Name: Accumulator_MultiDMA_tb
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


module Accumulator_MultiDMA_tb;


    // System
    
        reg                 sys_clk;
        reg                 sys_rst_n;
        
    // Input
    
        reg                 accu_en;
        
    // Output
    
        wire                accu_finished;
        
    // AXI Stream Interface
    
        reg                             s_axis_tvalid_0;
        wire                            s_axis_tready_0;
        reg     signed      [63 : 0]    s_axis_tdata_0;
        reg                 [7 : 0]     s_axis_tkeep_0;
        reg                             s_axis_tlast_0;
    
        reg                             s_axis_tvalid_1;
        wire                            s_axis_tready_1;
        reg     signed      [63 : 0]    s_axis_tdata_1;
        reg                 [7 : 0]     s_axis_tkeep_1;
        reg                             s_axis_tlast_1;
    
        reg                             s_axis_tvalid_2;
        wire                            s_axis_tready_2;
        reg     signed      [63 : 0]    s_axis_tdata_2;
        reg                 [7 : 0]     s_axis_tkeep_2;
        reg                             s_axis_tlast_2;
    
        reg                             s_axis_tvalid_3;
        wire                            s_axis_tready_3;
        reg     signed      [63 : 0]    s_axis_tdata_3;
        reg                 [7 : 0]     s_axis_tkeep_3;
        reg                             s_axis_tlast_3;
        
        wire                            m_axis_tvalid;
        reg                             m_axis_tready;
        wire    signed      [63 : 0]    m_axis_tdata;
        wire                [7 : 0]     m_axis_tkeep;
        wire                            m_axis_tlast;
    
    Accumulator_MultiDMA Accumulator_MultiDMA
    (

    // System
    
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        
    // Input
    
        .accu_en(accu_en),
        
    // Output
    
        .accu_finished(accu_finished),
        
    // AXI Stream Interface
    
        .s_axis_0_aresetn(sys_rst_n),
        .s_axis_0_aclk(sys_clk),
        .s_axis_tvalid_0(s_axis_tvalid_0),
        .s_axis_tready_0(s_axis_tready_0),
        .s_axis_tdata_0(s_axis_tdata_0),
        .s_axis_tkeep_0(s_axis_tkeep_0),
        .s_axis_tlast_0(s_axis_tlast_0),
    
        .s_axis_1_aresetn(sys_rst_n),
        .s_axis_1_aclk(sys_clk),
        .s_axis_tvalid_1(s_axis_tvalid_1),
        .s_axis_tready_1(s_axis_tready_1),
        .s_axis_tdata_1(s_axis_tdata_1),
        .s_axis_tkeep_1(s_axis_tkeep_1),
        .s_axis_tlast_1(s_axis_tlast_1),
    
        .s_axis_2_aresetn(sys_rst_n),
        .s_axis_2_aclk(sys_clk),
        .s_axis_tvalid_2(s_axis_tvalid_2),
        .s_axis_tready_2(s_axis_tready_2),
        .s_axis_tdata_2(s_axis_tdata_2),
        .s_axis_tkeep_2(s_axis_tkeep_2),
        .s_axis_tlast_2(s_axis_tlast_2),
    
        .s_axis_3_aresetn(sys_rst_n),
        .s_axis_3_aclk(sys_clk),
        .s_axis_tvalid_3(s_axis_tvalid_3),
        .s_axis_tready_3(s_axis_tready_3),
        .s_axis_tdata_3(s_axis_tdata_3),
        .s_axis_tkeep_3(s_axis_tkeep_3),
        .s_axis_tlast_3(s_axis_tlast_3),
        
        .m_axis_aresetn(sys_rst_n),
        .m_axis_aclk(sys_clk),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tready(m_axis_tready),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast)
    );
    
    always
        #5 sys_clk = !sys_clk;
    
    initial begin
    
        // Initialize Inputs
        
            sys_clk = 0;
            sys_rst_n = 0;
            
            accu_en = 0;
            
            s_axis_tvalid_0 = 0;
            s_axis_tkeep_0 = 0;
            s_axis_tlast_0 = 0;
            s_axis_tdata_0 = 0;
            
            s_axis_tvalid_1 = 0;
            s_axis_tkeep_1 = 0;
            s_axis_tlast_1 = 0;
            s_axis_tdata_1 = 0;
            
            s_axis_tvalid_2 = 0;
            s_axis_tkeep_2 = 0;
            s_axis_tlast_2 = 0;
            s_axis_tdata_2 = 0;
            
            s_axis_tvalid_3 = 0;
            s_axis_tkeep_3 = 0;
            s_axis_tlast_3 = 0;
            s_axis_tdata_3 = 0;
            
            m_axis_tready = 0;
            
            #100;
            
            sys_rst_n = 1;
    end
    
    reg [7 : 0] wr_step;
    reg [7 : 0] rd_step;
    
    reg [7 : 0] cnt;
     
    always @(posedge sys_clk or negedge sys_rst_n)
        begin
            if (!sys_rst_n)
                begin
                    accu_en             <= 0;
                    
                    s_axis_tvalid_0     <= 0;
                    s_axis_tkeep_0      <= 0;
                    s_axis_tlast_0      <= 0;
                    s_axis_tdata_0      <= 0;
                    
                    s_axis_tvalid_1     <= 0;
                    s_axis_tkeep_1      <= 0;
                    s_axis_tlast_1      <= 0;
                    s_axis_tdata_1      <= 0;
                    
                    s_axis_tvalid_2     <= 0;
                    s_axis_tkeep_2      <= 0;
                    s_axis_tlast_2      <= 0;
                    s_axis_tdata_2      <= 0;
                    
                    s_axis_tvalid_3     <= 0;
                    s_axis_tkeep_3      <= 0;
                    s_axis_tlast_3      <= 0;
                    s_axis_tdata_3      <= 0;
                    
                    wr_step         <= 0;
                    cnt             <= 0;
                end
                else begin
                    case (wr_step)
                    
                        0   :   begin
                                    accu_en     <= 1;
                                    
                                    if (s_axis_tready_0)
                                        begin
                                            s_axis_tvalid_0     <= 1;
                                            s_axis_tkeep_0      <= 8'b1111_1111;
                                            s_axis_tlast_0      <= 0;
                                            s_axis_tdata_0      <= 10;
                                            
                                            s_axis_tvalid_1     <= 1;
                                            s_axis_tkeep_1      <= 8'b1111_1111;
                                            s_axis_tlast_1      <= 0;
                                            s_axis_tdata_1      <= 10;
                                            
                                            s_axis_tvalid_2     <= 1;
                                            s_axis_tkeep_2      <= 8'b1111_1111;
                                            s_axis_tlast_2      <= 0;
                                            s_axis_tdata_2      <= 10;
                                            
                                            s_axis_tvalid_3     <= 1;
                                            s_axis_tkeep_3      <= 8'b1111_1111;
                                            s_axis_tlast_3      <= 0;
                                            s_axis_tdata_3      <= 10;
                                            
                                            wr_step             <= 1;
                                            cnt                 <= 0;
                                        end 
                                        else begin
                                            s_axis_tvalid_0     <= 0;
                                            s_axis_tkeep_0      <= 0;
                                            s_axis_tlast_0      <= 0;
                                            s_axis_tdata_0      <= 0;
                                            
                                            s_axis_tvalid_1     <= 0;
                                            s_axis_tkeep_1      <= 0;
                                            s_axis_tlast_1      <= 0;
                                            s_axis_tdata_1      <= 0;
                                            
                                            s_axis_tvalid_2     <= 0;
                                            s_axis_tkeep_2      <= 0;
                                            s_axis_tlast_2      <= 0;
                                            s_axis_tdata_2      <= 0;
                                            
                                            s_axis_tvalid_3     <= 0;
                                            s_axis_tkeep_3      <= 0;
                                            s_axis_tlast_3      <= 0;
                                            s_axis_tdata_3      <= 0;
                                            
                                            wr_step             <= 0;
                                            cnt                 <= cnt;
                                        end
                                end
                    
                        1   :   begin
                                    accu_en     <= 1;
                                    
                                    if (s_axis_tready_0  && s_axis_tready_1  && s_axis_tready_2  && s_axis_tready_3)
                                        begin
                                            if ((cnt+1)<10)
                                                begin
                                                    s_axis_tlast_0  <= 0;
                                                    s_axis_tlast_1  <= 0;
                                                    s_axis_tlast_2  <= 0;
                                                    s_axis_tlast_3  <= 0;
                                                end
                                                else begin
                                                    s_axis_tlast_0  <= 1;
                                                    s_axis_tlast_1  <= 1;
                                                    s_axis_tlast_2  <= 1;
                                                    s_axis_tlast_3  <= 1;
                                                end
                                                
                                            cnt                 <= cnt + 1;
                                                
                                            s_axis_tvalid_0     <= 1;
                                            s_axis_tkeep_0      <= 8'b1111_1111;
                                            s_axis_tdata_0      <= s_axis_tdata_0 - 10;
                                            
                                            s_axis_tvalid_1     <= 1;
                                            s_axis_tkeep_1      <= 8'b1111_1111;
                                            s_axis_tdata_1      <= s_axis_tdata_1 - 10;
                                            
                                            s_axis_tvalid_2     <= 1;
                                            s_axis_tkeep_2      <= 8'b1111_1111;
                                            s_axis_tdata_2      <= s_axis_tdata_2 - 10;
                                            
                                            s_axis_tvalid_3     <= 1;
                                            s_axis_tkeep_3      <= 8'b1111_1111;
                                            s_axis_tdata_3      <= s_axis_tdata_3 - 10;
                                            
                                            wr_step             <= 2;
                                        end 
                                        else begin
                                            s_axis_tvalid_0     <= 0;
                                            s_axis_tkeep_0      <= 8'b1111_1111;
                                            s_axis_tlast_0      <= 0;
                                            s_axis_tdata_0      <= s_axis_tdata_0;
                                            cnt                 <= cnt;
                                            
                                            s_axis_tvalid_1     <= 0;
                                            s_axis_tkeep_1      <= 8'b1111_1111;
                                            s_axis_tlast_1      <= 0;
                                            s_axis_tdata_1      <= s_axis_tdata_1;
                                            
                                            s_axis_tvalid_2     <= 0;
                                            s_axis_tkeep_2      <= 8'b1111_1111;
                                            s_axis_tlast_2      <= 0;
                                            s_axis_tdata_2      <= s_axis_tdata_2;
                                            
                                            s_axis_tvalid_3     <= 0;
                                            s_axis_tkeep_3      <= 8'b1111_1111;
                                            s_axis_tlast_3      <= 0;
                                            s_axis_tdata_3      <= s_axis_tdata_0;
                                            
                                            wr_step             <= 1;
                                        end
                                    
                                end
                    
                        2   :   begin
                                    accu_en             <= 1;
                                    
                                    s_axis_tvalid_0     <= 0;
                                    s_axis_tvalid_1     <= 0;
                                    s_axis_tvalid_2     <= 0;
                                    s_axis_tvalid_3     <= 0;
                                    
                                    s_axis_tdata_0      <= s_axis_tdata_0;
                                    s_axis_tdata_1      <= s_axis_tdata_1;
                                    s_axis_tdata_2      <= s_axis_tdata_2;
                                    s_axis_tdata_3      <= s_axis_tdata_3;
                                    
                                    if (cnt<10)
                                        begin
                                            wr_step             <= 1;
                                            
                                            s_axis_tkeep_0      <= 8'b1111_1111;
                                            s_axis_tlast_0      <= 0;
                                            
                                            s_axis_tkeep_1      <= 8'b1111_1111;
                                            s_axis_tlast_1      <= 0;
                                            
                                            s_axis_tkeep_2      <= 8'b1111_1111;
                                            s_axis_tlast_2      <= 0;
                                            
                                            s_axis_tkeep_3      <= 8'b1111_1111;
                                            s_axis_tlast_3      <= 0;
                                        end
                                        else begin
                                            wr_step             <= 3;
                                            
                                            s_axis_tkeep_0      <= 0;
                                            s_axis_tlast_0      <= 0;
                                            
                                            s_axis_tkeep_1      <= 0;
                                            s_axis_tlast_1      <= 0;
                                            
                                            s_axis_tkeep_2      <= 0;
                                            s_axis_tlast_2      <= 0;
                                            
                                            s_axis_tkeep_3      <= 0;
                                            s_axis_tlast_3      <= 0;
                                        end
                                end
                    
                        3   :   begin
                                    s_axis_tvalid_0   <= 0;
                                    s_axis_tdata_0    <= 0;
                                    s_axis_tkeep_0    <= 0;
                                    s_axis_tlast_0    <= 0;
                                    
                                    s_axis_tvalid_1   <= 0;
                                    s_axis_tdata_1    <= 0;
                                    s_axis_tkeep_1    <= 0;
                                    s_axis_tlast_1    <= 0;
                                    
                                    s_axis_tvalid_2   <= 0;
                                    s_axis_tdata_2    <= 0;
                                    s_axis_tkeep_2    <= 0;
                                    s_axis_tlast_2    <= 0;
                                    
                                    s_axis_tvalid_3   <= 0;
                                    s_axis_tdata_3    <= 0;
                                    s_axis_tkeep_3    <= 0;
                                    s_axis_tlast_3    <= 0;
                                    
                                    cnt             <= 0;
                                    if (accu_finished)
                                        begin
                                            accu_en         <= 0;
                                            wr_step         <= 0;
                                        end
                                        else begin
                                            accu_en         <= 1;
                                            wr_step         <= 3;
                                        end
                                end
                    
                        4   :   begin
                                    s_axis_tvalid_0   <= 0;
                                    s_axis_tdata_0    <= 0;
                                    s_axis_tkeep_0    <= 0;
                                    s_axis_tlast_0    <= 0;
                                    
                                    s_axis_tvalid_1   <= 0;
                                    s_axis_tdata_1    <= 0;
                                    s_axis_tkeep_1    <= 0;
                                    s_axis_tlast_1    <= 0;
                                    
                                    s_axis_tvalid_2   <= 0;
                                    s_axis_tdata_2    <= 0;
                                    s_axis_tkeep_2    <= 0;
                                    s_axis_tlast_2    <= 0;
                                    
                                    s_axis_tvalid_3   <= 0;
                                    s_axis_tdata_3    <= 0;
                                    s_axis_tkeep_3    <= 0;
                                    s_axis_tlast_3    <= 0;
                                    
                                    if ((!s_axis_tready_0) && (!s_axis_tready_1) && (!s_axis_tready_2) && (!s_axis_tready_3))
                                        begin
                                            accu_en         <= 1;
                                            wr_step         <= 0;
                                        end
                                        else begin
                                            accu_en         <= 0;
                                            wr_step         <= 4;
                                        end
                                end
                    
                        default     :   begin
                                            accu_en             <= 0;
                                            s_axis_tvalid_0     <= 0;
                                            s_axis_tdata_0      <= 0;
                                            s_axis_tvalid_1     <= 0;
                                            s_axis_tdata_1      <= 0;
                                            s_axis_tvalid_2     <= 0;
                                            s_axis_tdata_2      <= 0;
                                            s_axis_tvalid_3     <= 0;
                                            s_axis_tdata_3      <= 0;
                                            wr_step             <= 0;
                                            cnt                 <= 0;
                                        end
                    
                    endcase
                end
        end
     
    always @(posedge sys_clk or negedge sys_rst_n)
        begin
            if (!sys_rst_n)
                begin
                    rd_step         <= 0;
                    m_axis_tready   <= 0;
                end
                else begin
                    case (rd_step)
                    
                        0   :   begin
                                    if (m_axis_tvalid)
                                        begin
                                            m_axis_tready   <= 1;
                                            rd_step         <= 1;
                                        end 
                                        else begin
                                            m_axis_tready   <= 0;
                                            rd_step         <= 0;
                                        end
                                end
                    
                        1   :   begin
                                    m_axis_tready   <= 0;
                                    rd_step         <= 0;
                                end
                    
                        default     :   begin
                                            m_axis_tready   <= 0;
                                            rd_step         <= 0;
                                        end
                    
                    endcase
                end
        end
        
endmodule
