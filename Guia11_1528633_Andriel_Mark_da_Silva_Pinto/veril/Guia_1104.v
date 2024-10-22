// Guia_1104.v
// Nome: Andriel Mark da Silva Pinto
// Matrícula: 859093
// --------------
// --- FSM para reconhecer x000
// --------------
`define found 1
`define notfound 0

module guia_1104 (output reg y, input x, clk, reset);

    // Identificadores de estado
    parameter start      = 3'b000,
              detect0    = 3'b001,
              detect00   = 3'b010,
              detect000  = 3'b011;

    reg [2:0] E1;  // Estado atual
    reg [2:0] E2;  // Próximo estado

    // Lógica para determinar o próximo estado
    always @(*) begin
        case (E1)
            start:     E2 = (x) ? start : detect0;
            detect0:   E2 = (x) ? start : detect00;
            detect00:  E2 = (x) ? start : detect000;
            detect000: begin
                           E2 = (x) ? start : detect000;
                           y = (x) ? `notfound : `found;
                       end
            default:   E2 = 3'bxxx;  // Estado indefinido
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
