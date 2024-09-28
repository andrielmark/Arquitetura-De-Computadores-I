// -------------------------
// Guia_0805 - COMPLEMENTO DE 2
// Nome: Andriel Mark da Silva Pinto
// Matricula: 859093
// -------------------------

module complemento_um (
    input [5:0] a,
    output [5:0] complemento
);
    assign complemento = ~a;
endmodule

module somador_completo (
    input a,
    input b,
    input cin,
    output soma,
    output cout
);
    wire s, c1, c2;

    assign s = a ^ b ^ cin;
    assign c1 = (a & b) | (cin & (a ^ b));
    assign cout = c1;
    assign soma = s;
endmodule

module complemento_dois (
    input [5:0] a,
    output [5:0] resultado
);
    wire [5:0] complemento1;
    wire cout;
    
    complemento_um CU (.a(a), .complemento(complemento1));
    
    somador_completo FA0 (.a(complemento1[0]), .b(1'b1), .cin(1'b0), .soma(resultado[0]), .cout(cout));
    somador_completo FA1 (.a(complemento1[1]), .b(cout), .cin(1'b
