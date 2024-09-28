// -------------------------
// Guia_0802 - SUBTRACTOR
// Nome: Andriel Mark da Silva Pinto
// Matricula: 859093
// -------------------------

module meia_diferenca (
    input a,
    input b,
    output diff,
    output vem_um
);
    assign diff = a ^ b;
    assign vem_um = ~a & b;
endmodule

module subtrator_completo (
    input a,
    input b,
    input bin,
    output diff,
    output bout
);
    wire d, v1, v2;

    meia_diferenca U1 (.a(a), .b(b), .diff(d), .vem_um(v1));
    meia_diferenca U2 (.a(d), .b(bin), .diff(diff), .vem_um(v2));

    assign bout = v1 | v2;
endmodule

module unidade_aritmetica (
    input [4:0] a,
    input [4:0] b,
    input bin,
    output [4:0] diff,
    output bout
);
    wire [4:0] vem_um;

    subtrator_completo FA0 (.a(a[0]), .b(b[0]), .bin(bin), .diff(diff[0]), .bout(vem_um[0]));
    subtrator_completo FA1 (.a(a[1]), .b(b[1]), .bin(vem_um[0]), .diff(diff[1
