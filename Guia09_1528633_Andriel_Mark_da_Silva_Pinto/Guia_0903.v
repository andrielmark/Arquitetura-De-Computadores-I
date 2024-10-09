// ---------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// ---------------------------
// Guia_0903.v
// ---------------------------

`include "clock.v"

// ---------------------------
// -- pulse generator (1/3 frequency of clock)
// ---------------------------
module pulse ( output reg signal, input clock );
    reg [1:0] counter = 0;  // Contador de 2 bits

    always @ ( posedge clock )
    begin
        if (counter == 2)  // Quando o contador atingir 2, inverte o pulso
        begin
            signal = ~signal;
            counter = 0;  // Reinicia o contador
        end
        else
        begin
            counter = counter + 1;  // Incrementa o contador
        end
    end
endmodule // pulse

// ---------------------------
// -- Testbench para Guia_0903
// ---------------------------
module Guia_0903;
    wire clock;  // Sinal de clock
    wire pulse_signal;  // Sinal do gerador de pulso

    // Instanciando o módulo de clock do Guia_0900
    clock clk ( clock );

    // Instanciando o gerador de pulso com 1/3 da frequência do clock
    pulse pls ( pulse_signal, clock );

    // Iniciando a simulação
    initial begin
        // Dumpfile para o GTKWave
        $dumpfile ( "Guia_0903.vcd" );
        $dumpvars ( 1, clock, pulse_signal );
        
        // Finalizar a simulação após 360 unidades de tempo
        #360 $finish;
    end
endmodule // Guia_0903
