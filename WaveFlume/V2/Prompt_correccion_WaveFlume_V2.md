# Prompt de corrección — WaveFlume V2 (Technical Note, JWPCOE)

> Pégalo en una IA junto con el fuente LaTeX de la nota, los datos f₁ por ensayo, el firmware (MicroPython) y el script del modelo de temporizado.

---

Eres coautor técnico de la nota *The Nominal Period Is Not the Wave Period: Frequency Error in a Low-Cost Stepper-Driven Wavemaker*, enviada a ASCE JWPCOE como Technical Note. Corrígela para que un árbitro la acepte. Reglas: no inventes datos; toda cifra nueva debe salir de un cálculo reproducible con los datos o el código disponibles; lo que exija una medida nueva márcalo `[REQUIERE MEDIDA: …]`; respeta el límite de ASCE (≈ 3500 palabras y equivalentes; resumen de 150–175 palabras).

1. **Modelo frente a medida.**
   - Superpón en la Fig. 2 el f₁ − 1/T predicho por el modelo de temporizado, o añade un panel de residuos.
   - Distingue T por color o marcador e indica que las barras de error son menores que el símbolo.
   - Describe el modelo de forma reproducible: curva de la rampa, regla de redondeo y descarte de intervalos, fórmula de t_move(S, T) y tiempo muerto.
   - Explica que el tiempo muerto se ajusta a las 31 frecuencias, y que el sondeo cada 5 ms y las pausas de MicroPython explican la dispersión de 17–24 ms.
2. **Prueba independiente.** `[REQUIERE MEDIDA: marcas de tiempo de inicio y fin de cada movimiento (GPIO/osciloscopio o ticks_us), o registro del encoder; idealmente 3–5 ensayos con el firmware corregido mostrando f₁ ≈ 1/T]`. Si no se hace, presenta el mecanismo como «consistente con» y no como «traced to».
3. **Base de tiempos.** `[REQUIERE MEDIDA: verificar la frecuencia de imagen real de la webcam (LED a frecuencia conocida, o marcas de tiempo y fotogramas perdidos)]`. Añade este término a la incertidumbre de f₁. Da la U por ensayo y comprueba la frase «at least four times its uncertainty».
4. **Consecuencias.**
   - Sustituye «this error propagates directly» por el error cuantificado de usar 1/T: longitud de onda lineal −3,5 % a +59 %, pendiente predicha −46 % a +4,5 %. Recalcula estas cifras con los datos.
   - Para la longitud de onda, añade dos frases de método y una figura (λ̄ frente a λ_lin(f₁)), o recorta la afirmación.
   - Quita el régimen de altura de ola o redúcelo a una frase de limitación: H̄ no es la altura incidente, el movimiento de la pala no es sinusoidal (habría que usar S₁) y las fugas no se midieron.
5. **Datos y código.**
   - Tabla por ensayo (T, S, f₁ ± U, f del modelo, residuo) como Supplemental Materials.
   - Deposita el firmware en Zenodo o GitHub y usa la declaración ASCE de repositorio en línea.
   - Cita el commit concreto de micropython-rp2-smartStepper.
6. **Alcance y novedad.**
   - Título descriptivo que nombre el mecanismo.
   - Primera frase del resumen sin «rarely».
   - Quita «None addresses the question…».
   - Añade el mecanismo general (movimientos punto a punto con parada: periodo = 2(t_move + t_muerto)).
   - Recupera el antecedente de Marques (2023) sobre la actualización discontinua de la velocidad del motor.
   - Añade una recomendación de diseño (trayectoria continua, temporización absoluta o compensación).
   - En las conclusiones, «this flume» en lugar de generalizar.
7. **Formato ASCE.**
   - Autor de correspondencia con email y cargo en cada afiliación.
   - Declaración de uso de IA.
   - Define la ventana de análisis.
   - «stroke of length S» en lugar de «displacement of amplitude S».
   - Resumen ≤ 175 palabras.

Entrega: el fuente corregido, un diff y una tabla «comentario → cambio → línea».
