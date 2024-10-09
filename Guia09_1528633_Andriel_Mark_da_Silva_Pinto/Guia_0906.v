// ---------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// ---------------------------
// Guia_0906.v
// ---------------------------

`include "clock.v"

// ---------------------------
// -- pulse generator (5 time units on negative edge of clock)
// ---------------------------
module pulse (output reg signal, input clock);
    initial begin
        signal = 1'b0; // Inicializa o sinal
    end

    always @(negedge clock) begin
        signal = 1'b1; // Gera o pulso
        #5 signal = 1'b0; // Mantém o pulso por 5 unidades de tempo
    end
endmodule // pulse

// ---------------------------
// -- Testbench para Guia_0906
// ---------------------------
module Guia_0906;
    wire clock;         // Sinal de clock original
    wire pulse_signal;  // Sinal do gerador de pulso

    // Instancia o gerador de clock do Guia_0900
    clock clk (clock);

    // Instancia o gerador de pulso sincronizado com a borda de descida do clock
    pulse pls (pulse_signal, clock);

    // Início da simulação
    initial begin
        // Gerar arquivo .vcd para visualização no GTKWave
        $dumpfile("Guia_0906.vcd");
        $dumpvars(1, clock, pulse_signal);

        // Finalizar a simulação após 120 unidades de tempo
        #120 $finish;
    end
endmodule // Guia_0906
