// Guia_1101.v
// Nome: Andriel Mark da Silva Pinto
// Matrícula: 859093
// --------------
// --- Mealy FSM para 1001
// --------------
`define found 1
`define notfound 0

module guia_1101 (output reg y, input x, clk, reset);

    // Identificadores de estado
    parameter start = 2'b00,
              id1 = 2'b01,
              id10 = 2'b10,
              id100 = 2'b11;
    
    reg [1:0] E1;  // Estado atual
    reg [1:0] E2;  // Próximo estado

    // Lógica para determinar o próximo estado
    always @(*) begin
        y = `notfound;
        case (E1)
            start:  E2 = (x) ? id1 : start;
            id1:    E2 = (x) ? id1 : id10;
            id10:   E2 = (x) ? id100 : start;
            id100:  begin
                        E2 = (x) ? id1 : start;
                        y = (x) ? `notfound : `found;
                    end
            default: E2 = 2'bxx;  // Estado indefinido
        endcase
    end

    // Atualização das variáveis de estado
    always @(posedge clk or negedge reset) begin
        if (!reset)
            E1 <= start;  // Reinicia no estado inicial
        else
            E1 <= E2;     // Atualiza para o próximo estado
    end

endmodule
