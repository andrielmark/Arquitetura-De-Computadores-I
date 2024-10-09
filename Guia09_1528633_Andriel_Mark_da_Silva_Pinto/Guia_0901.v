// --------------------------------------------
// Nome: Andriel Mark da Silva Pinto
// Numero de Aluno: 1258633
// Matricula: 859093
// --------------------------------------------
// Guia_0901.v
// --------------------------------------------

// ---------------------------
// -- test clock generator (2)
// ---------------------------
module clock ( output reg clk );
    initial
    begin
        clk = 1'b0;
    end

    always
    begin
        #12 clk = ~clk;
    end
endmodule

// ---------------------------
// -- pulse generator
// ---------------------------
module pulse ( output reg signal, input clock );
    always @ ( clock )
    begin
        signal = 1'b1;
        #3 signal = 1'b0;
        #3 signal = 1'b1;
        #3 signal = 1'b0;
    end
endmodule // pulse

// ---------------------------
// -- trigger generator
// ---------------------------
module trigger ( output reg signal, input on, input clock );
    always @ ( posedge clock & on )
    begin
        #60 signal = 1'b1;
        #60 signal = 1'b0;
    end
endmodule // trigger

// ---------------------------
// -- testbench
// ---------------------------
module testbench;
    wire clk;
    reg on;
    wire pulse_signal, trigger_signal;

    // Instanciando os módulos
    clock CLKGEN ( clk );
    pulse PULSEGEN ( pulse_signal, clk );
    trigger TRIGGERGEN ( trigger_signal, on, clk );

    // Iniciando o teste
    initial begin
        $dumpfile("Guia_0901.vcd");
        $dumpvars(1, testbench);

        // Teste para o trigger
        on = 1'b0;
        #20 on = 1'b1;
        #300 on = 1'b0;

        // Finalizando o teste
        #500 $finish;
    end
endmodule
