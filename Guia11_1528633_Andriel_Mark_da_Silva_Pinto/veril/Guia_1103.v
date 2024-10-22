// Guia_1103.v
// Nome: Andriel Mark da Silva Pinto
// Matrícula: 859093
// --------------
// --- Moore FSM para 1001 com interseção
// --------------
`define found 1
`define notfound 0

module guia_1103 (output reg y, input x, clk, reset);

    // Identificadores de estado
    parameter start   = 3'b000,
              id1     = 3'b001,
              id10    = 3'b010,
              id100   = 3'b011,
              id1001  = 3'b100;
    
    reg [2:0] E1;  // Estado atual
    reg [2:0] E2;  // Próximo estado

    // Lógica para determinar o próximo estado
    always @(*) begin
        case (E1)
            start:   E2 = (x) ? id1 : start;
            id1:     E2 = (x) ? id1 : id10;
            id10:    E2 = (x) ? id100 : start;
            id100:   E2 = (x) ? id1 : id1001;
            id1001:  E2 = (x) ? id1 : start;
            default: E2 = 3'bxxx;  // Estado indefinido
        endcase
    end

    // Atualização das variáveis de estado
    always @(posedge clk or negedge reset) begin
        if (!reset)
            E1 <= start;  // Reinicia no estado inicial
        else
            E1 <= E2;     // Atualiza para o próximo estado
    end

    // Lógica de saída
    always @(*) begin
        y = (E1 == id1001) ? `found : `notfound;
    end

endmodule
