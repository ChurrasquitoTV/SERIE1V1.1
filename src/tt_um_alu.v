module tt_um_ChurrasquitoTV (
    input  wire [7:0] ui_in,     // Entradas de usuario (por ejemplo, switches)
    input  wire [7:0] uio_in,    // Entradas adicionales
    output wire [7:0] uo_out,    // Salidas (por ejemplo, LEDs)
    output wire [7:0] uio_out,   // Salidas adicionales
    input  wire [7:0] ui_in_sync, // Entradas sincronizadas
    input  wire clk,
    input  wire rst_n
);
    wire [7:0] A = ui_in[3:0];   // A: bits 3:0
    wire [7:0] B = ui_in[7:4];   // B: bits 7:4
    wire [2:0] sel = uio_in[2:0]; // selector: bits 2:0 de uio_in

    wire [7:0] Y;

    alu_8bit alu_inst (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    assign uo_out = Y;
    assign uio_out = 8'b0;
endmodule
