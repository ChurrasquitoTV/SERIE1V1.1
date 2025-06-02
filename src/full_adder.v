module adder_8bit (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire cin,
    output wire [7:0] sum,
    output wire cout
);
    wire [7:0] carry;

    full_adder fa0 (
        .a(a[0]), .b(b[0]), .cin(cin),
        .sum(sum[0]), .cout(carry[0])
    );

    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_fa
            full_adder fa (
                .a(a[i]), .b(b[i]), .cin(carry[i-1]),
                .sum(sum[i]), .cout(carry[i])
            );
        end
    endgenerate

    assign cout = carry[7];
endmodule
