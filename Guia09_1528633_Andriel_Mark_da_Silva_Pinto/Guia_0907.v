// ---------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// ---------------------------
// Guia_0907.v
// ---------------------------

`include "clock_custom.v"

// ---------------------------
// -- pulse generator (8 time units on high level of clock)
// ---------------------------
module pulse (output reg signal, input clock);
    initial begin
        signal = 1'b0; // Inicializa o sinal
    end

    always @(clock) begin
        if (clock) begin // Verifica se o clock está alto
            signal = 1'b1; // Gera o pulso
            #8 signal = 1'b0; // Mantém o pulso por 8 unidades de tempo
        end
    end
endmodule // pulse

// ---------------------------
// -- Testbench para Guia_0907
// ---------------------------
module Guia_0907;
    wire clock;         // Sinal de clock original
    wire pulse_signal;  // Sinal do gerador de pulso

    // Instancia o gerador de clock do clock_custom
    clock_custom clk (clock);

    // Instancia o gerador de pulso sincronizado com o nível alto do clock
    pulse pls (pulse_signal, clock);

    // Início da simulação
    initial begin
        // Gerar arquivo .vcd para visualização no GTKWave
        $dumpfile("Guia_0907.vcd");
        $dumpvars(1, clock, pulse_signal);

        // Finalizar a simulação após 120 unidades de tempo
        #120 $finish;
    end
endmodule // Guia_0907
