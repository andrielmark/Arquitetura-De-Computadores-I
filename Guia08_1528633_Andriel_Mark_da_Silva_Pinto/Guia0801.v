// -------------------------
// Guia_0801 - FULL ADDER
// Nome: Andriel Mark da Silva Pinto
// Matricula: 859093
// -------------------------

module meia_soma (
    input a,
    input b,
    output soma,
    output vai_um
);
    assign soma = a ^ b;
    assign vai_um = a & b;
endmodule

module somador_completo (
    input a,
    input b,
    input cin,
    output soma,
    output cout
);
    wire s, c1, c2;

    meia_soma U1 (.a(a), .b(b), .soma(s), .vai_um(c1));
    meia_soma U2 (.a(s), .b(cin), .soma(soma), .vai_um(c2));

    assign cout = c1 | c2;
endmodule

module unidade_aritmetica (
    input [4:0] a,
    input [4:0] b,
    input cin,
    output [4:0] soma,
    output cout
);
    wire [4:0] vai_um;
    
    somador_completo FA0 (.a(a[0]), .b(b[0]), .cin(cin), .soma(soma[0]), .cout(vai_um[0]));
    somador_completo FA1 (.a(a[1]), .b(b[1]), .cin(vai_um[0]), .soma(soma[1]), .cout(vai_um[1]));
    somador_completo FA2 (.a(a[2]), .b(b[2]), .cin(vai_um[1]), .soma(soma[2]), .cout(vai_um[2]));
    somador_completo FA3 (.a(a[3]), .b(b[3]), .cin(vai_um[2]), .soma(soma[3]), .cout(vai_um[3]));
    somador_completo FA4 (.a(a[4]), .b(b[4]), .cin(vai_um[3]), .soma(soma[4]), .cout(cout));
endmodule
