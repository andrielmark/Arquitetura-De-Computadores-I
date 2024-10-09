// ---------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// ---------------------------
// Guia_0902.v
// ---------------------------

// ---------------------------
// -- pulse1 generator
// ---------------------------
module pulse1 ( output reg signal, input clock );
    always @ ( posedge clock ) begin
        signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
    end
endmodule // pulse1

// ---------------------------
// -- pulse2 generator
// ---------------------------
module pulse2 ( output reg signal, input clock );
    always @ ( posedge clock ) begin
        signal = 1'b1;
        #5 signal = 1'b0;
    end
endmodule // pulse2

// ---------------------------
// -- pulse3 generator
// ---------------------------
module pulse3 ( output reg signal, input clock );
    always @ ( negedge clock ) begin
        signal = 1'b1;
        #15 signal = 1'b0;
        #15 signal = 1'b1;
    end
endmodule // pulse3

// ---------------------------
// -- pulse4 generator
// ---------------------------
module pulse4 ( output reg signal, input clock );
    always @ ( negedge clock ) begin
        signal = 1'b1;
        #20 signal = 1'b0;
        #20 signal = 1'b1;
        #20 signal = 1'b0;
    end
endmodule // pulse4

// ---------------------------
// -- Testbench for Guia_0902
// ---------------------------
module Guia_0902;
    wire clock;  // Clock signal
    wire p1, p2, p3, p4;  // Pulse signals

    // Instanciando o módulo de clock
    clock clk ( clock );

    // Instanciando os módulos de pulso
    pulse1 pls1 ( p1, clock );
    pulse2 pls2 ( p2, clock );
    pulse3 pls3 ( p3, clock );
    pulse4 pls4 ( p4, clock );

    // Iniciando a simulação
    initial begin
        // Dumpfile para o GTKWave
        $dumpfile ( "Guia_0902.vcd" );
        $dumpvars ( 1, clock, p1, p2, p3, p4 );
        
        // Finalizar a simulação após 480 unidades de tempo
        #480 $finish;
    end
endmodule // Guia_0902
