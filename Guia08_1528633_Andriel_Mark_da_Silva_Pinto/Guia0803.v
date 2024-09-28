// -------------------------
// Guia_0803 - COMPARADOR DE IGUALDADE
// Nome: Andriel Mark da Silva Pinto
// Matricula: 859093
// -------------------------

module comparador_igualdade (
    input [4:0] a,
    input [4:0] b,
    output igual
);
    wire [4:0] xnor_out;

    assign xnor_out = ~(a ^ b);
    assign igual = &xnor_out;
endmodule
