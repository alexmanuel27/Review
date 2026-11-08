# Informe de revisión — WaveFlume V1

**Manuscrito:** *Determination of the stationary state in an experimental small-scale 2D wave flume using image processing* — Rodríguez-de-Torner, Terwagne, Nicolis, Campo, Altshuler, Rivera-Rivera, Martínez-Ortíz (21 p., 37 refs.).
**Fecha:** 2026-11-02 · **Modo:** solo análisis (Alex pidió no reescribir). No se ha modificado el manuscrito.
**Revista objetivo:** no indicada. Se evalúa con el nivel de *Coastal Engineering*, *Journal of Hydraulic Research* o *Experiments in Fluids*.
**SHA-256 del PDF recibido:** `1a32dcc775b1aa2730775a1622e3c74a4b8e48f2e8cab8b0ba81c18b24bb03b6`

---

## 1. Resumen ejecutivo

El trabajo es cuidadoso y honesto. Mide la superficie libre en unas 1600 posiciones con subpíxel. Su tratamiento de la incertidumbre es mejor de lo habitual: tiene en cuenta la autocorrelación con Zhang y separa los términos A, B y de calibración. Además, explica con un modelo cuantitativo del firmware por qué la frecuencia real de la pala se desvía de la nominal (tiempo muerto de 21,7 ms; reproduce f₁ con un RMS de 0,02 Hz). Las cifras que se pueden recalcular desde la Tabla 2 coinciden.

**Veredicto como árbitro: revisión mayor.** La contribución que da título al artículo, la determinación del estado estacionario, es la parte más débil. Hay tres motivos:
1. El indicador η_rms, por construcción, casi no detecta la reflexión.
2. El propio test de bloques de los autores rechaza la estacionariedad en la mayoría de los ensayos.
3. La relación L = 0,34 H̄ es la esperada para una onda sinusoidal (1/(2√2) = 0,354), así que no es un hallazgo.

A esto se suman tres problemas de fondo:
- la comparación con la teoría lineal del batidor usa una magnitud que no corresponde;
- el método óptico no se ha validado de forma independiente;
- no hay ensayos repetidos.

Las conclusiones sobre f₁, la saturación de la pendiente y el coeficiente R son las más sólidas y deberían ganar peso.

---

## 2. Comprobaciones hechas por el revisor

Recalculé desde la Tabla 2, con g = 9,81, h = 0,17 m y ν = 10⁻⁶:

| Magnitud | Manuscrito | Recalculado | Estado |
|---|---|---|---|
| κh | 1,95–6,45 | 1,95–6,45 | ✓ |
| F(κh) | 1,66–2,00 | 1,66–2,00 | ✓ |
| λ_lin | 166–547 mm | 166–547 mm | ✓ |
| Pendiente predicha / medida | 0,057–0,208 / 0,048–0,105 | igual | ✓ |
| H̄/H_lin (mín–máx, mediana) | 0,54–1,05 (0,79) | 0,54–1,06 (0,79) | ✓ (redondeo de la tabla) |
| λ̄/λ_lin − 1 | −3,1 a +16,2 % (2,1 %) | −3,2 a +16,5 % (2,2 %) | ✓ (redondeo) |
| f₁ − 1/T a S = 10 mm | 0,44–0,58 Hz (23–28 %) | 0,44–0,58 Hz (22,8–28,3 %) | ✓ |
| c = λ̄ f₁ | Tabla 2 | coincide | ✓ |
| α viscoso (Ec. 24), reducción en la ROI | 0,022–0,056 m⁻¹; 2,7–6,8 % | 0,022–0,056; 2,7–6,8 % | ✓ |
| (t_s − t_a) mediana; r_s con f₁ | 4,8 s; +0,32 (p = 0,08) | 4,8 s; +0,31 (p = 0,09) | ✓ (valores leídos de la Fig. 9a) |
| Tiempo de ida y vuelta 2·2,30 m / c_g | — | 8,8–18,1 s | **nuevo**, ver M1 |
| η_rms/H para una sinusoide | — | 1/(2√2) = 0,354 | **nuevo**, ver M1 |

**Referencias.** Verifiqué por DOI en OpenAlex las 6 más recientes o menos conocidas: [2], [11], [18], [19], [21] y [28]. Todas existen y sus datos coinciden. En [19], OpenAlex da 2024 (publicación en línea) y el manuscrito da 2025 (número impreso); las dos fechas son aceptables. Las otras 31 son clásicas y conocidas (Hughes, Goda y Suzuki, Mansard y Funke, Ursell et al., Miche, Hunt, GUM, etc.). No las consulté una a una, ni comprobé que cada cita apoye su frase.

---

## 3. Problemas mayores

### M1. El criterio de estacionariedad no detecta lo que dice determinar (núcleo del título)
- **Ciego a la reflexión por construcción.** Promediado en el espacio sobre varias longitudes de onda, η_rms² ∝ a_I²(1 + R²). Con R = 0,03–0,25, la llegada de la onda reflejada eleva η_rms como mucho entre un 0,05 % y un 3 %. Eso queda por debajo del umbral del 5 % que define t_s.
- **t_s marca casi siempre la llegada del tren incidente.** Calculé el tiempo de ida y vuelta por el canal, 2·2,30 m / c_g, con dispersión lineal a la f₁ medida: sale 8,8–18,1 s. En **27 de los 31 ensayos**, t_s − t_a es menor que ese tiempo. Es decir, el umbral del 95 % se alcanza antes de que la onda re-reflejada por la pala vuelva a la ROI. Las excepciones son T = 0,45/S = 15, T = 0,50/S = 10 y T = 0,55/S = 25 y 30.
- **El propio test de los autores rechaza la estacionariedad.** Las medias por bloques de 50 s son incompatibles en 16/31 ensayos para H y en 20/31 para λ. El criterio estricto de ±5 % no se cumple antes de 42 s en 13 ensayos, y 2 de ellos no lo cumplen nunca. La conclusión pasa a ser «estacionario salvo modulaciones lentas», pero el origen de esas modulaciones no se identifica.
- **L ∝ H̄ es trivial.** Para una sinusoide, η_rms = H/(2√2) = 0,354 H. El valor medido, 0,317–0,357, es esa relación con una pequeña corrección no lineal. La Discusión la presenta como «general», y un árbitro lo señalará como sobreinterpretación.
- **Qué pediría un árbitro:**
  1. un indicador sensible al campo reflejado, por ejemplo a_I(t), a_R(t) y R(t) por separación en ventanas deslizantes de pocos periodos, o CV_σ(t), o un percentil de |σ̃_η/σ_η − 1| (ya está en la Fig. 8c,f);
  2. comparar t_s − t_a con los tiempos de recorrido 2ℓ/c_g;
  3. identificar las modulaciones lentas con un espectro de η_rms suavizado. Hay tres candidatos: el *seiche* longitudinal (periodo fundamental ≈ 2ℓ/√(gh) ≈ 3,6 s), batidos entre armónicos ligados y libres, o variaciones del periodo de la pala por pausas del firmware en MicroPython (recolección de basura). Este último encaja con el desplazamiento de f₁ de 2U al mover la ventana (§4.1).

### M2. El movimiento real de la pala no se mide y no es sinusoidal
- La §5 muestra que a S = 10 mm la pala arranca al 64 % de su velocidad pico, se detiene de golpe y pasa ~22 ms parada entre movimientos. El desplazamiento tiene, por tanto, armónicos importantes.
- H_lin = F(κh)·S (Ec. 18) supone un movimiento sinusoidal de carrera S. El comparador correcto es la **amplitud del primer armónico del desplazamiento real**. Se puede reconstruir con el programa de pasos, que ya está modelado en la §5, o registrar con el encoder de 1000 líneas del motor.
- Los armónicos de la pala generan además armónicos libres espurios. Estos pueden contribuir a E_res (Fig. 13), a la asimetría η_c/H̄ y a que λ̄ supere la predicción a T = 0,40 s (+8,6 % de mediana).
- La desviación de f₁ de hasta un 28 % es un **defecto del firmware**, no una propiedad del canal. Un árbitro preguntará por qué no se corrige el control (temporización por reloj absoluto o perfil de velocidad continuo) en lugar de recomendar «medir la frecuencia real». El análisis del firmware puede quedarse, pero presentado como diagnóstico del controlador.

### M3. La comparación con la teoría lineal del batidor usa una magnitud que no corresponde
- La Ec. 18 predice la altura del **primer armónico de la onda incidente**. La Fig. 12a usa H̄, que incluye las ondas reflejadas, los armónicos y las componentes residuales.
- El propio manuscrito dice que 2a_I está entre 0,69 y 0,90 veces H̄ (§4.4). Si se compara 2a_I con H_lin, el régimen «lineal» queda en torno a 0,55–0,95 en lugar de 0,78–1,05. Esto es una estimación grosera; para el valor exacto hacen falta a_I por ensayo, que no están tabulados.
- Esto contradice dos afirmaciones del manuscrito: «the wave height follows linear wavemaker theory» (resumen y conclusiones) y la de §5 de que las ondas reflejadas solo alteran H̄ a segundo orden.
- **Qué pedir:** rehacer la Fig. 12a con 2a_I (o con la onda incidente reconstruida con sus armónicos) frente a F·S₁, donde S₁ es la carrera del primer armónico (M2). Rehacer después el balance del déficit (viscosidad, fugas, efectos de amplitud finita).

### M4. Medida óptica sin validación independiente y con errores sistemáticos fuera del presupuesto GUM
- **Menisco.** Hay una banda de 2–3,5 mm, más de 20 veces el ruido declarado de 0,11 mm. La interfaz se coloca en su borde inferior sin justificarlo. Si el menisco cambia entre cresta y valle (línea de contacto que avanza o retrocede), sesga η_c/H̄. El exceso de asimetría frente a Stokes (0,02–0,05 de H̄, es decir, ≈ 0,3–2,8 mm) es del **mismo orden que la banda**, así que esa conclusión no está demostrada.
- **Distorsión del objetivo.** La C922 tiene distorsión de barril apreciable y el campo útil es de 1,40 m. En la Fig. 1 se ve un tablero de ajedrez que no se usa para calibrar.
- **Escala.** Hay un único patrón de 44 px. No se dice en qué plano está respecto a la cara interior de la pared, donde está la interfaz. Los 10 mm de acrílico desplazan la imagen aparente ≈ t(1 − 1/n) ≈ 3,3 mm. Faltan también la distancia y la altura de la cámara, y no se dice si se bloquearon la exposición y el enfoque automáticos.
- **Validación.** No hay ninguna medida de referencia: ni sonda de nivel, ni cambio de nivel estático conocido medido con un limnímetro de punta, ni una segunda cámara. Los propios trabajos citados en la introducción ([15]–[19]) se validaron frente a sondas.
- **Consecuencia.** La exactitud declarada (1,3–2,1 % en H y λ) es solo de repetibilidad y escala. El exceso de λ̄ sobre λ_lin (2,1 % de mediana) es del mismo orden que la incertidumbre expandida de calibración (≈ 1,4 %) y que posibles sesgos de distorsión. Los argumentos basados en correlaciones dentro del mismo conjunto de datos sí se sostienen, porque la escala común se cancela.

### M5. Sin réplicas
Cada combinación (T, S) se midió una sola vez, y el arranque fue manual. t_s − t_a varía de forma errática, de 2,0 a 32,5 s. Su sensibilidad al suavizado llega a 27,9 s (Fig. 9b). Sin repeticiones no se puede separar la variabilidad entre ensayos de la dependencia con T y S. Por eso las afirmaciones de «sin dependencia significativa» son débiles. Mínimo exigible: 3 repeticiones de 4–6 combinaciones representativas.

### M6. Rotura: contradicción entre secciones
La §2 dice que las carreras mayores no se ensayaron «because they produced breaking waves». Eso implica que los 31 ensayos no rompen. La §5, en cambio, dice que en el segundo régimen «where and how the waves break in these runs was not recorded». Hay que aclarar si hubo rotura cerca de la pala en los ensayos con pendiente predicha > 0,13. La interpretación de la saturación (≈ 0,10, el 70–75 % del límite de Miche) depende de ello.

### M7. Fugas en la pala: explicación sin cuantificar
Se atribuyen a las fugas y a efectos de amplitud finita unas cuatro quintas partes del déficit de altura, pero no se dan las holguras laterales ni la inferior. Hay que medirlas y estimar el efecto (Madsen 1970 [35] da la formulación) o presentarlo explícitamente como hipótesis.

---

## 4. Problemas moderados
1. **λ̄ por espaciado de crestas en un campo parcialmente estacionario.** El ajuste de la Ec. 22 ya da κ_f libre. Hay que publicar 2π/κ_f y compararlo con λ̄ y λ_lin: es un estimador del número de onda del primer armónico menos sensible a armónicos y a la detección de crestas.
2. **CV_σ como «nuevo descriptor».** Para el modelo de dos ondas, σ(x) ∝ √(1 + R² + 2R cos φ), así que CV_σ ≈ R/√2. Conviene darlo de forma analítica y usar CV_σ − R/√2 como medida de lo que no es onda incidente ni reflejada. Así el descriptor gana interpretación, y la novedad se presenta en su justa medida.
3. **Estadística.** Hay muchas correlaciones de Spearman sin corrección por comparaciones múltiples. Los ensayos no son independientes: están agrupados por T, y f₁ y S están confundidos dentro de cada T. Además se interpreta como «close to significance» un p = 0,08. Mejor una regresión con T como factor, o un enfoque descriptivo.
4. **Incertidumbre de f₁.** Se declaran 0,0001–0,0004 Hz, pero mover la ventana cambia f₁ en 2U. Hay que dar una incertidumbre que incluya la deriva y reducir las cifras significativas de la Tabla 2. El cociente entre los dos métodos de autocorrelación llega a 3,7, y eso merece una frase.
5. **Reproducibilidad.** Falta una tabla suplementaria por ensayo con t_a, t_s, t_e, L, a_I, R, E_res, H_lin, λ_lin, λ_S3, κ_f y η_c/H̄. Muchas cifras del texto no se pueden reproducir desde el artículo. Faltan también la disponibilidad de código y datos, el firmware y los vídeos.
6. **Generalidad.** Una sola profundidad (0,17 m), una sola playa, solo oleaje regular y un solo canal. «t = 42 s» y «R ≥ 0,11 si la playa < 3/4 λ» son cifras de este canal. Conviene presentar como transferible el **procedimiento** y no los números.
7. **Novedad.** «To the authors' knowledge, no study has determined…» necesita una búsqueda bibliográfica explícita sobre transitorios, re-reflexión y resonancia en canales cerrados. Si no, mejor suavizarla.
8. **Muestreo.** A 30 fps y f₁ = 3,07 Hz, el 4.º armónico (12,3 Hz) queda cerca del límite de Nyquist (15 Hz). Hay que mencionar el posible *aliasing* de los armónicos superiores.

## 5. Menores y de forma
- Faltan afiliaciones, autor de correspondencia, palabras clave y las declaraciones (financiación, CRediT, conflictos, datos, uso de IA).
- §2: «a forward and a backward displacement **of amplitude S**» choca con la Ec. 18 («S is the full horizontal excursion»). Usar «stroke/excursion S» siempre; la amplitud sería S/2.
- §3.6: «does not change between S = 40 and 45 mm at T = 0.60 s». Pero f₁ cambia 0,00028 Hz, unas 3,5 veces U. Mejor: «changes by less than 0.02 %».
- §3.4: decir dónde está el patrón (pared exterior o interior, a qué distancia de la cámara) y cómo se midieron los 44 px.
- Fig. 7: los 31 paneles son ilegibles a tamaño de columna. Mejor dejar 4–6 representativos en el texto y el resto en el suplemento.
- Título de la §3: espaciado anómalo («Optical␣␣␣Surface-Elevation») por justificación en columna estrecha.
- El resumen tiene demasiadas cifras. Sobra «A new descriptor» (ver punto 4.2) y faltan una frase de contexto y una de alcance.
- El 5–95 % tomado de la ingeniería de control [29] necesita una frase de justificación física para un campo de olas.

## 6. Sugerencias de redacción (frases, sin reescribir el artículo)
| Ubicación | Original | Propuesta | Motivo |
|---|---|---|---|
| Resumen, 1.ª frase | «…but the waves they actually generate are rarely characterised, and it has not been determined when such flumes…» | «…but the waves they generate are rarely characterised, and it is unknown when such flumes, with partial reflection at both ends, reach a stationary state.» | Más directo; evita el doble «actually/has not been determined» |
| Resumen | «and this level is proportional to the mean wave height in all runs» | quitar, o «as expected, this level scales with the mean wave height» | Es esperable (M1) |
| Resumen | «The actual frequency of the paddle differs from the nominal one by up to 28% because of the control program.» | «Because of the timing of the control program, the paddle frequency exceeds the nominal value by up to 28%.» | Causa primero; «exceeds» es más preciso |
| §1 | «To the authors' knowledge, no study has determined…» | «We are not aware of a study that determines…» | Más prudente (4.7) |
| §2 | «a forward and a backward displacement of amplitude S» | «a forward and a backward stroke of length S» | Coherencia con la Ec. 18 |
| §4.1 | «The stationary state is therefore stationary only up to these slow modulations» | «The wave field is therefore stationary only to within these slow modulations of a few percent» | Evita la tautología |
| §5 | «This relation is general: a single fit describes all the runs» | «A single fit describes all runs, consistent with η_rms = H/(2√2) for a sinusoidal wave (0.354)» | Sin sobreinterpretar (M1) |
| §5 | «the wave height follows linear wavemaker theory» | «the mean wave height lies within −22 % and +5 % of linear wavemaker theory» | Fiel a los datos (M3) |
| §6 | «these results lead to four recommendations» | «we draw four practical recommendations for this and similar flumes» | Delimita el alcance (4.6) |

## 7. Estimación por niveles (si luego se decide corregir)
- **Nivel 1** (redacción y presentación): §5, el punto 4.2 analítico, las frases de alcance y novedad, las declaraciones, Fig. 7 al suplemento, cifras significativas y la contradicción de la rotura (si los autores dicen qué pasó).
- **Nivel 2** (reanálisis con los datos que ya existen, cambia cifras o conclusiones): M1 con un indicador sensible a la reflexión y R(t), M3 con 2a_I frente a H_lin, κ_f, la tabla suplementaria, la estadística por T y S₁ reconstruida desde el programa de pasos.
- **Nivel 3** (nuevas medidas): validación óptica, distorsión, menisco, réplicas, registro del encoder, holguras de la pala, observación de la rotura cerca de la pala y, de forma opcional, corrección del firmware y nueva campaña.

## 8. Comentario confidencial al editor
Es un trabajo experimental honrado, con un tratamiento de incertidumbre por encima de la media. Su aportación real es la caracterización práctica de un canal de bajo coste: frecuencia de la pala, saturación de la pendiente y reflexión de la playa. La determinación del estado estacionario, tal como está planteada, no la sostiene. Tal como está, encaja mejor en *Journal of Marine Science and Engineering*, *HardwareX* o *Experiments in Fluids* (esta última con la validación de M4). Para *Coastal Engineering* o *JHR* harían falta M1–M5.

---
*Revisión hecha leyendo las 21 páginas. Recalculé con Python las cifras derivadas de la Tabla 2 y verifiqué por DOI 6 de 37 referencias. No revisé datos ni código de los autores (no estaban disponibles). No invoqué las skills de revisión del protocolo porque Alex pidió solo análisis, sin reescritura.*
