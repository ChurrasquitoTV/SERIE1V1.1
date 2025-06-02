import cocotb
from cocotb.triggers import RisingEdge
from cocotb.clock import Clock


@cocotb.test()
async def test_alu_operations(dut):
    """Prueba ALU de 8 bits con diferentes operaciones"""

    # Inicializar reloj
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut.rst_n.value = 0
    dut.ena.value = 1
    dut.clk.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    await RisingEdge(dut.clk)
    dut.rst_n.value = 1

    # Casos de prueba: (A, B, SEL, resultado esperado, operación)
    tests = [
        (3, 2, 0b000, 3 + 2,  "SUMA"),
        (6, 5, 0b001, 6 & 5,  "AND"),
        (6, 5, 0b010, 6 | 5,  "OR"),
        (6, 5, 0b011, 6 ^ 5,  "XOR"),
        (6, 0, 0b100, (~6) & 0xFF, "NOT A"),
    ]

    for A, B, sel, expected, op_name in tests:
        dut.ui_in.value = (B << 4) | A  # B en [7:4], A en [3:0]
        dut.uio_in.value = sel
        await RisingEdge(dut.clk)
        await RisingEdge(dut.clk)

        actual = dut.uo_out.value.integer
        cocotb.log.info(f"[{op_name}] A={A}, B={B}, SEL={bin(sel)} => Resultado={actual}, Esperado={expected}")

        assert actual == expected, (
            f"FALLO en {op_name}: A={A}, B={B}, SEL={sel}, esperado={expected}, obtenido={actual}"
        )

