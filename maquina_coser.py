class MaquinaCoser:
    def __init__(self):
        self.velocidad = 0
        self.puntadas_por_minuto = 0
        self.hilo_restante = 100 

    def aumentar_velocidad(self):
        if self.velocidad < 100:
            self.velocidad += 10
            self.puntadas_por_minuto = self.velocidad * 10
        return self.velocidad

    def disminuir_velocidad(self):
        if self.velocidad > 0:
            self.velocidad -= 15
            self.velocidad = max(0, self.velocidad)
            self.puntadas_por_minuto = self.velocidad * 10
        return self.velocidad

    def coser(self, tiempo_minutos):
        hilo_usado = self.puntadas_por_minuto * tiempo_minutos * 0.01 
        if self.hilo_restante >= hilo_usado:
            self.hilo_restante -= hilo_usado
            return hilo_usado
        else:
            return 0  

    def __str__(self):
        return f"Máquina de coser - Velocidad: {self.velocidad}, Puntadas/min: {self.puntadas_por_minuto}, Hilo restante: {self.hilo_restante:.2f}m"