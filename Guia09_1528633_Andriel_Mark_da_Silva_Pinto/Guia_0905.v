// ---------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// ---------------------------
// Guia_0905.v
// ---------------------------

`include "clock.v"

// ---------------------------
// -- pulse generator (4 time units width)
// ---------------------------
module pulse ( output reg signal, input clock );
    always @ ( posedge clock )
    begin
        signal = 1'b1;  // Ativa o pulso
        #4 signal = 1'b0;  // Mantém ativo por 4 unidades de tempo
    end
endmodule // pulse

// ---------------------------
// -- Testbench para Guia_0905
// ---------------------------
module Guia_0905;
    wire clock;         // Sinal de clock original
    wire pulse_signal;  // Sinal do gerador de pulso

    // Instancia o gerador de clock do Guia_0900
    clock clk ( clock );

    // Instancia o gerador de pulso com 4 unidades de tempo
    pulse pls ( pulse_signal, clock );

    // Início da simulação
    initial begin
        // Gerar arquivo .vcd para visualização no GTKWave
        $dumpfile ( "Guia_0905.vcd" );
        $dumpvars ( 1, clock, pulse_signal );

        // Finalizar a simulação após 120 unidades de tempo
        #120 $finish;
    end
endmodule // Guia_0905
