# Informe de revisión — WaveFlume V2 (nota técnica)

**Manuscrito:** *The Nominal Period Is Not the Wave Period: Frequency Error in a Low-Cost Stepper-Driven Wavemaker* — Rodríguez-de-Torner, Rivera-Rivera, Martínez-Ortíz, Altshuler, Terwagne, Nicolis, Campo (9 págs., 21 refs.).
**Revista:** *Journal of Waterway, Port, Coastal, and Ocean Engineering* (ASCE), tipo Technical Note.
**Fecha:** 2026-11-04 · **Modo:** solo análisis, igual que en V1 (sin reescribir).
**SHA-256:** `f05fcd705db5944b15d3bc175070ba4f27f21b95cd581cd3016701c69a60ab45`

---

## 1. Resumen ejecutivo

El cambio de enfoque es acertado. La nota abandona el estado estacionario, que era la parte más débil de V1 (M1), y se centra en el resultado más sólido: el error de frecuencia de la pala y su origen en el firmware. Además, la frecuencia medida no depende de la calibración espacial, del menisco ni de la distorsión de la cámara. Con eso, buena parte de M4 deja de afectar al resultado principal.

**Veredicto como árbitro de JWPCOE: revisión mayor acotada.** Puede quedar en revisión menor si se resuelven cuatro puntos:
- **N1.** El mecanismo se infiere del código y se ajusta con los mismos datos. No se muestra el modelo frente a las medidas, ni hay una medida directa del tiempo de la pala o de la base de tiempos de la cámara.
- **N2.** Los párrafos sobre longitud de onda y altura de ola no tienen métodos ni figura. Además, arrastran M2, M3 y M7 de V1.
- **N3.** Faltan los datos por ensayo y el código del firmware, que son el núcleo de la nota.
- **N4.** El alcance se generaliza más allá de lo que se probó. Es un controlador y una librería concretos, en una versión concreta.

## 2. Estado de los problemas de V1

| V1 | Estado en V2 | Comentario |
|---|---|---|
| M1 estado estacionario | **Eliminado del alcance** | Bien resuelto. Pero ahora falta definir la «analysis window» (l. 92), que se usa sin decir cuál es (en V1 era t = 42 s → t_e). |
| M2 movimiento real de la pala | **Parcial** | El temporizado está bien explicado. El movimiento no se mide, y las consecuencias para H de un movimiento no sinusoidal no se tratan (ver N2). |
| M3 H̄ frente a 2a_I | **Sin resolver, y peor documentado** | La l. 154–158 mantiene «follows linear wavemaker theory… median 0.83» sin definir H, H_lin ni la pendiente, y sin figura. |
| M4 validación óptica | **Casi irrelevante para f₁**; sigue afectando a λ y H | Aparece un riesgo nuevo, la base de tiempos de la cámara (N1). |
| M5 réplicas | **Sin resolver** | Menos grave: el modelo se ajusta en 31 ensayos. Aun así, el tiempo muerto varía entre 17 y 24 ms de un ensayo a otro, y eso necesita repetición. |
| M6 contradicción sobre la rotura | **Resuelto en parte** | Desaparece la frase de la §2. La l. 161 («increasing the stroke does not increase the wave height») sigue sin decir si hubo rotura. |
| M7 fugas | **Sin resolver** | La l. 157–158 lo afirma como hecho («leakage… account for the remainder») sin cuantificarlo. |
| Incertidumbre de f₁ (moderado 4) | **Resuelto** | Ahora 0,0014–0,0041 Hz, con un término A de la deriva. En consecuencia, la frase «does not change between S = 40 and 45 mm» queda correcta. |
| Tabla por ensayo (moderado 5) | **Peor** | La Tabla 2 de V1 desaparece y no hay datos por ensayo ni en el texto ni en un suplemento. |
| Generalidad y novedad (6–7) | **Peor en el título y la introducción** | Ver N4. |
| Afiliaciones, palabras clave, financiación, datos | **Resuelto** | Faltan el autor de correspondencia con su email y la declaración de uso de IA (ver §5). |
| «displacement of amplitude S» | **Sin resolver** (l. 61) | S es la excursión completa; la amplitud sería S/2. |

## 3. Problemas mayores (V2)

### N1. El mecanismo no se demuestra de forma independiente
- **Ajuste circular.** El tiempo muerto de 21,7 ms se «estima a partir de las frecuencias medidas» (l. 136–137) y luego se dice que el modelo «reproduce» esas mismas frecuencias (l. 140–142). Un parámetro para 31 puntos está bien, pero falta una prueba independiente de las dos causas. Opciones:
  - registrar con marcas de tiempo la orden y el fin de cada movimiento (GPIO + osciloscopio, o `ticks_us()` en MicroPython);
  - registrar el encoder de 1000 líneas, que ya existe;
  - lo más convincente: **corregir el temporizado** (reloj absoluto o trayectoria continua sin paradas) y repetir 3–5 ensayos con f₁ ≈ 1/T.
- **El modelo no aparece en la figura.** La Fig. 2 solo muestra las medidas. Hay que superponer f₁ − 1/T predicho por el modelo, o añadir un panel de residuos medido − modelo. Ese es el resultado central de la nota.
- **El modelo no se puede reproducir con lo que se describe.** Faltan:
  - la forma exacta de la rampa (aceleración sinusoidal; ¿qué curva de la librería: `sine`, `smooth1`…?);
  - la regla de redondeo y de descarte de intervalos;
  - la fórmula o el pseudocódigo de la duración del movimiento t_move(S, T);
  - el origen de la variación del tiempo muerto entre ensayos (17–24 ms). Probablemente se debe al sondeo cada 5 ms más el cálculo del perfil y las pausas de recolección de basura de MicroPython. Esa fluctuación de periodo entre ciclos puede ser también el origen de las modulaciones lentas de V1.
- **Base de tiempos.** f₁ se mide con el reloj de la webcam (30 fps nominales). Las webcam USB pueden tener frecuencia de imagen variable (con poca luz o exposición automática), perder fotogramas o grabar a 29,97 fps. Un error del 0,1 % equivale a ≈ 0,002 Hz, que es del orden de la U declarada (0,0014–0,0041 Hz). Afecta a las afirmaciones finas: la desviación negativa del −1,8 % y la frase «by at least four times its uncertainty». Hay que verificar la frecuencia de imagen con un LED parpadeando a una frecuencia conocida, o con las marcas de tiempo del contenedor y el recuento de fotogramas, y añadir ese término al presupuesto de incertidumbre.
- **Afirmación que no se puede comprobar.** «Differs from the nominal one in all runs by at least four times its uncertainty» (l. 107–108). Los valores |f₁ − 1/T| más pequeños son ≈ 0,011 Hz (T = 0,60 s, S = 40–45 mm). Con U de hasta 0,0041 Hz, el cociente podría ser de ~2,6, a menos que la U de esos ensayos sea menor. Sin la U por ensayo no se puede comprobar.

### N2. Consecuencias para λ y H sin métodos ni figura
- **Falta la descripción.** La nota no explica cómo se obtienen H, λ, crestas, valles, H_lin, la pendiente predicha ni la «steepness of the incident wave». Las l. 147–161 dan cifras sin respaldo visible. En una nota técnica hay dos opciones: (a) añadir una figura (λ̄ frente a λ_lin(f₁)) con dos frases de método, o (b) recortar estas afirmaciones a lo que sostienen los datos de frecuencia.
- **Problemas que siguen de V1.** La comparación de altura con la teoría del batidor arrastra M2 (movimiento no sinusoidal: debe usarse el primer armónico de la carrera, S₁), M3 (H̄ incluye ondas reflejadas y armónicos; el comparador correcto es 2a_I) y M7 (fugas sin cuantificar). **Recomendación:** quitar de la nota el régimen de altura, o dejarlo en una frase de limitación. No es necesario para el mensaje y es lo que un árbitro atacará primero.
- **Falta la consecuencia práctica, que es la que convence.** Calculé con la Tabla 2 de V1 (mismos ensayos) qué error comete quien use el periodo nominal:
  - la longitud de onda lineal calculada con 1/T difiere de la calculada con f₁ entre **−3,5 % y +59 %**;
  - la pendiente lineal predicha difiere entre **−46 % y +4,5 %**.

  Esto convierte «this error propagates directly into the generated wave field» (resumen) en un número. Ahora mismo la nota solo dice que «la onda sigue la dispersión a su propia frecuencia», lo que es casi tautológico.

### N3. Faltan datos y código
- **Datos.** No hay ninguna tabla por ensayo. Como mínimo hacen falta T, S, f₁ ± U, f del modelo y residuo. Si no caben por extensión, deben ir como material suplementario. ASCE admite «Supplemental Materials».
- **Código.** El resultado depende de un firmware y de una versión concreta de una librería que se modifica activamente. Comprobé que el repositorio existe (bikeNomad/micropython-rp2-smartStepper, 49 commits, cambios de Ned Konz de 2026 sobre el original de Frédéric/fma38). Hay que citar el **commit** usado. Si la librería cambia, la nota describirá el comportamiento de una versión antigua. Conviene también comunicar el problema al autor de la librería.
- **Declaración de datos.** «Upon reasonable request» es una de las fórmulas aprobadas por ASCE, pero en una nota cuyo núcleo es un firmware se espera depositar el código en un repositorio (Zenodo o GitHub) y usar la fórmula de «available in a repository online». No se indica el autor de correspondencia.

### N4. Generalización y novedad
- **Título y primera frase del resumen.** «Low-cost wave flumes driven by stepper motors… are now common…, yet the period set in the controller is rarely the period of the waves they generate». No hay evidencia de «rarely»: solo hay un antecedente (Ó Náraigh et al. 2025). El fenómeno se demuestra para **un controlador** (MicroPython + SmartStepper, movimientos punto a punto con parada).
- **Cómo darle generalidad sin exagerar:**
  - enunciar el mecanismo general: cualquier controlador que ejecute cada medio ciclo como un movimiento independiente con parada tiene un periodo real de 2(t_move + t_muerto), y si discretiza las rampas, t_move depende de S;
  - recuperar el antecedente de Marques (2023), que V1 citaba: atribuía sus errores a la «actualización discontinua de la velocidad y la aceleración del motor paso a paso». Es evidencia independiente del mismo tipo de mecanismo, y en V2 se ha perdido;
  - dar una recomendación de diseño: trayectoria continua, temporización absoluta o compensación de t_move.
- **Afirmación débil en la introducción.** «None addresses the question that concerns this technical note» (l. 43–44) se refiere a métodos de separación de ondas, que no están pensados para eso. Mejor quitarla y situar la nota frente a la literatura de control y función de transferencia de batidores.

## 4. Moderados
1. **Ventana de análisis** sin definir (l. 92). Basta una frase con «t = 42 s hasta el final del registro» y su justificación breve.
2. **Fig. 2.** El pie dice «Error bars represent expanded uncertainties», pero no se ven. Hay que indicar que son menores que el símbolo y distinguir los periodos nominales por color o marcador (ahora los 31 puntos son iguales).
3. **l. 61** («each nominally lasting T/2, with sinusoidal acceleration ramps of nominal duration T/4»). Si las dos rampas duran T/4 cada una, no hay tramo de velocidad constante. Decirlo explícitamente ayuda a entender por qué el redondeo acorta el movimiento.
4. **l. 135.** «Checks every 5 ms»: ese sondeo cuantiza el tiempo muerto (0–5 ms). Hay que mencionarlo como parte de los 17–24 ms.
5. **l. 150–153.** «Increases with the steepness of the incident wave… as expected from amplitude dispersion (Goda and Abe 1968)». La correlación (r_s, p) estaba en V1 y aquí ha desaparecido. Si se mantiene la frase, hay que dar el dato.
6. **Conclusiones, l. 172–175.** «These two bounds… delimit the operating range in which a low-cost flume can be used quantitatively». Es generalización de un solo canal; mejor «this flume».

## 5. Formato ASCE / JWPCOE
- **Extensión.** Según la plantilla de ASCE, las notas técnicas tienen un límite de 3500 palabras y equivalentes en la mayoría de revistas. Mi recuento aproximado: resumen 187 + cuerpo 2050 + referencias 550 ≈ 2800, más 2 figuras y 1 tabla. La conversión de figuras y tablas en palabras no la confirmé (POR CONFIRMAR en la guía de JWPCOE). Una página de ASCE para otra revista da un límite de 7 páginas a doble espacio para notas. Está cerca del límite, así que la tabla por ensayo debería ir como material suplementario.
- **Resumen.** 187 palabras; la plantilla de ASCE pide 150–175. Hay que recortar unas 15.
- **Autores.** ASCE pide el autor de correspondencia con su email y, en la afiliación, el cargo (p. ej. «Ph.D. Candidate, …»). Ahora no hay ninguno de los dos.
- **Uso de IA.** ASCE exige declarar si se usaron herramientas de IA. Falta.
- **Notation.** Opcional. Con T, S, f₁, U, h y λ, no es imprescindible.
- **Referencias.** Las 21 se citan en el texto y no sobra ninguna. Las de V1 ya verificadas por DOI siguen igual. Konz (2026) existe; falta el commit.

## 6. Sugerencias de redacción (frases)
| Ubicación | Original | Propuesta | Motivo |
|---|---|---|---|
| Título | «The Nominal Period Is Not the Wave Period: Frequency Error in a Low-Cost Stepper-Driven Wavemaker» | «Frequency Error in a Low-Cost Stepper-Driven Wavemaker: Ramp Discretization and Inter-Move Dead Time» | Descriptivo, al estilo ASCE; nombra el mecanismo y no generaliza |
| Resumen, 1.ª frase | «…yet the period set in the controller is rarely the period of the waves they generate» | «…but the period set in the controller is seldom checked against the period of the generated waves» | Lo que se puede sostener |
| Resumen | «this error propagates directly into the generated wave field» | «using the nominal period would misestimate the linear wavelength by up to 59 % and the predicted steepness by up to 46 % in the tested range» | Cuantifica (N2); cifras recalculadas con los datos de V1 |
| l. 43–44 | «None addresses the question that concerns this technical note: …» | quitar | Afirmación débil (N4) |
| l. 61 | «a forward and a backward displacement of amplitude S» | «a forward and a backward stroke of length S» | S es la excursión completa |
| l. 136–137 | «This dead time, estimated from the measured frequencies, is about 22 ms» | «Fitting this dead time to the 31 measured frequencies gives 21.7 ms (17–24 ms when fitted run by run)» | Deja claro que es un ajuste (N1) |
| l. 147 | «Because the wavelength follows linear dispersion at the forcing frequency, the frequency error propagates directly into the measured wavelength.» | «Since the waves obey linear dispersion at the actual forcing frequency, a wavelength computed from the nominal period is in error by up to 59 %.» | Mensaje práctico |
| l. 157–158 | «leakage around the paddle and finite-amplitude effects account for the remainder» | «the remainder is attributed, without direct measurement, to leakage around the paddle and to finite-amplitude effects» | No afirmar lo que no se midió (M7) |
| l. 174–175 | «delimit the operating range in which a low-cost flume can be used quantitatively» | «delimit the operating range of this flume» | Alcance |

## 7. Comentario confidencial al editor
La nota es concreta, útil y verificable. Encaja como Technical Note de JWPCOE si se demuestra el mecanismo de forma independiente (o con una corrección del firmware) y se publican el código y los datos por ensayo. El párrafo sobre la altura de ola es la parte vulnerable y no es necesario para el mensaje.

---
*Leí las 9 páginas y comparé con V1 y con su informe. Recalculé con los datos de la Tabla 2 de V1 el error de usar el periodo nominal. Comprobé que existe el repositorio de la librería. Consulté la guía de ASCE solo a través de la plantilla de Overleaf y de la página de otra revista ASCE: la página de JWPCOE no cargó, y la conversión de figuras en palabras queda POR CONFIRMAR. No verifiqué el contenido de cada cita frente a su frase.*
