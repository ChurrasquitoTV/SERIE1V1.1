# Makefile para simulación con Cocotb e Icarus Verilog

# Lenguaje del diseño
TOPLEVEL_LANG = verilog

# Simulador a usar (icarus es el predeterminado en Tiny Tapeout)
SIM = icarus

# Nombre del módulo top en Verilog (NO el testbench, sino el DUT)
TOPLEVEL = tt_um_alu

# Nombre del archivo Python (sin extensión .py) donde está el test Cocotb
MODULE = test

# Archivos Verilog a simular (ruta relativa desde este Makefile)
VERILOG_SOURCES = \
  ../src/tt_um_alu.v \
  ../src/alu_8bit.v \
  ../src/adder_8bit.v \
  ../src/full_adder.v

# Agrega argumentos de compilación si necesitas (por ejemplo: -Wall)
COMPILE_ARGS =

# Incluir reglas estándar de Cocotb para preparar la simulación
include $(shell cocotb-config --makefiles)/Makefile.sim
