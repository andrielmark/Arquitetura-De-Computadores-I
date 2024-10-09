// ---------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// ---------------------------
// Guia_0904.v
// ---------------------------

`include "clock.v"

// ---------------------------
// -- pulse generator (4x frequency of clock)
// ---------------------------
module pulse ( output reg signal, input clock );
    always @ ( posedge clock )
    begin
        signal = ~signal;  // Alterna o pulso a cada borda de subida do clock
    end
endmodule // pulse

// ---------------------------
// -- Testbench para Guia_0904
// ---------------------------
module Guia_0904;
    wire clock;         // Sinal de clock original
    wire pulse_signal;  // Sinal do gerador de pulso com 4x a frequência

    // Instancia o gerador de clock do Guia_0900
    clock clk ( clock );

    // Instancia o gerador de pulso com 4x a frequência
    pulse pls ( pulse_signal, clock );

    // Início da simulação
    initial begin
        // Gerar arquivo .vcd para visualização no GTKWave
        $dumpfile ( "Guia_0904.vcd" );
        $dumpvars ( 1, clock, pulse_signal );

        // Finalizar a simulação após 120 unidades de tempo
        #120 $finish;
    end
endmodule // Guia_0904
