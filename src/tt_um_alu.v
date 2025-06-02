module tt_um_alu (
    input  wire [7:0] ui_in,     // [3:0] A, [7:4] B
    output wire [7:0] uo_out,    // Resultado de la operación
    input  wire [7:0] uio_in,    // [2:0] SEL
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);
    wire [3:0] A_in = ui_in[3:0];
    wire [3:0] B_in = ui_in[7:4];
    wire [2:0] sel = uio_in[2:0];

    wire [7:0] A = {4'b0000, A_in};
    wire [7:0] B = {4'b0000, B_in};
    wire [7:0] Y;

    alu_8bit alu_inst (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    assign uo_out = Y;
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule
