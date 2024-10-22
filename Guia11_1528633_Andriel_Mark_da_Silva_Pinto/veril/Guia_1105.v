// Guia_1105.v
// Nome: Andriel Mark da Silva Pinto
// Matrícula: 859093
// --------------
// --- FSM para reconhecer 010 ou 101
// --------------
`define found 1
`define notfound 0

module guia_1105 (output reg y, input x, clk, reset);

    // Identificadores de estado
    parameter start     = 2'b00,
              detect1   = 2'b01,
              detect10  = 2'b10,
              detect010 = 2'b11;

    reg [1:0] E1;  // Estado atual
    reg [1:0] E2;  // Próximo estado

    // Lógica para determinar o próximo estado
    always @(*) begin
        case (E1)
            start:      E2 = (x) ? detect1 : start;
            detect1:    E2 = (x) ? start : detect10;
            detect10:   E2 = (x) ? detect1 : detect010;
            detect010:  begin
                           E2 = (x) ? start : detect010;
                           y = (x) ? `found : `notfound;
                        end
            default:    E2 = 2'bxx;  // Estado indefinido
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
