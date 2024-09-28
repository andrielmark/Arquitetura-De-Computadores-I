// -------------------------
// Guia_0804 - COMPARADOR DE DESIGUALDADE
// Nome: Andriel Mark da Silva Pinto
// Matricula: 859093
// -------------------------

module comparador_desigualdade (
    input [4:0] a,
    input [4:0] b,
    output desigual
);
    wire [4:0] xor_out;

    assign xor_out = a ^ b;
    assign desigual = |xor_out;
endmodule
