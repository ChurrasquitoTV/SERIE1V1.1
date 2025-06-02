How it works

El sumador de 8 bits es un circuito digital que toma dos números binarios de 8 bits (A[7:0] y B[7:0]) como entradas y calcula su suma. El resultado es una salida de 9 bits (SUMA[8:0]) para considerar el posible acarreo (carry-out) del bit más significativo.

How to test

Carga del diseño: Programa la FPGA con el bitstream generado desde Vivado.
Configura las entradas:
Usa los 16 interruptores de la Basys3:
SW[15:8] → Número A
SW[7:0] → Número B
Observa el resultado:
Los LEDs LED[8:0] mostrarán el resultado binario de A + B.
Por ejemplo, si A = 00000101 (5) y B = 00000011 (3), los LEDs mostrarán 00001000 (8).

External hardware

No se necesita hardware externo adicional. Todo se realiza usando la tarjeta Basys3, aprovechando sus periféricos integrados:
Interruptores (SW) para ingresar los operandos.
LEDs (LD) para mostrar el resultado.
