module alu_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] sel,
    output reg  [7:0] Y
);
    wire [7:0] sum;

    adder_8bit add_inst (
        .a(A),
        .b(B),
        .cin(1'b0),
        .sum(sum),
        .cout()
    );

    always @(*) begin
        case (sel)
            3'b000: Y = sum;       // Suma
            3'b001: Y = A & B;     // AND
            3'b010: Y = A | B;     // OR
            3'b011: Y = A ^ B;     // XOR
            3'b100: Y = ~A;        // NOT
            default: Y = 8'b00000000;
        endcase
    end
endmodule
