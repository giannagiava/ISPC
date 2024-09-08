import unittest
from maquina_coser import MaquinaCoser

class TestMaquinaCoser(unittest.TestCase):
    def setUp(self):
        self.maquina = MaquinaCoser()

    def test_aumentar_velocidad(self):
        velocidad_inicial = self.maquina.velocidad
        self.maquina.aumentar_velocidad()
        self.assertEqual(self.maquina.velocidad, velocidad_inicial + 10)
        self.assertEqual(self.maquina.puntadas_por_minuto, self.maquina.velocidad * 10)

    def test_disminuir_velocidad(self):
        self.maquina.velocidad = 30
        self.maquina.disminuir_velocidad()
        self.assertEqual(self.maquina.velocidad, 15)
        self.assertEqual(self.maquina.puntadas_por_minuto, 150)

    def test_coser(self):
        self.maquina.velocidad = 50
        self.maquina.puntadas_por_minuto = 500
        hilo_usado = self.maquina.coser(10)
        self.assertAlmostEqual(hilo_usado, 50)
        self.assertAlmostEqual(self.maquina.hilo_restante, 50)

    def test_coser_sin_hilo_suficiente(self):
        self.maquina.velocidad = 50
        self.maquina.puntadas_por_minuto = 500
        self.maquina.hilo_restante = 10
        hilo_usado = self.maquina.coser(10)
        self.assertEqual(hilo_usado, 0)
        self.assertEqual(self.maquina.hilo_restante, 10)

    def test_str(self):
        self.maquina.velocidad = 50
        self.maquina.puntadas_por_minuto = 500
        self.maquina.hilo_restante = 75.5
        expected_str = "Máquina de coser - Velocidad: 50, Puntadas/min: 500, Hilo restante: 75.50m"
        self.assertEqual(str(self.maquina), expected_str)

if __name__ == '__main__':
    unittest.main()