`timescale 1ns/1ps

module tb;

    reg [7:0] ui_in;
    reg [7:0] uio_in;
    reg ena, clk, rst_n;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Instancia del DUT
    tt_um_alu dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb);

        // Reset
        clk = 0;
        ena = 1;
        rst_n = 0;
        ui_in = 8'b00000000;
        uio_in = 8'b00000000;
        #10 rst_n = 1;

        // === Prueba: Suma ===
        ui_in = 8'b00100011;  // A=3 (3:0), B=2 (7:4)
        uio_in = 8'b00000000; // SEL = 000 → suma
        #10;

        // === Prueba: AND ===
        uio_in = 8'b00000001; // SEL = 001 → AND
        #10;

        // === Prueba: OR ===
        uio_in = 8'b00000010; // SEL = 010 → OR
        #10;

        // === Prueba: XOR ===
        uio_in = 8'b00000011; // SEL = 011 → XOR
        #10;

        // === Prueba: NOT ===
        uio_in = 8'b00000100; // SEL = 100 → NOT A
        #10;

        $finish;
    end

    // Generación de reloj
    always #5 clk = ~clk;

endmodule
