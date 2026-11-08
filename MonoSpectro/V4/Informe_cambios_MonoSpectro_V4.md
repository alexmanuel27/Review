---
title: "Informe de cambios — MonoSpectro V4"
subtitle: "«Portable Spectrophotometry Using a Monochrome Camera» (SpecToGo) — IEEE Sensors Letters"
date: "3 de noviembre de 2026"
---

> PDF recibido: 4 páginas, compilado el 3 nov 2026 a las 12:48. SHA-256 `9bf730f9d730a2a4870768748a17f4e80c715b93f3e53d8f8763602b4a6a7c28` (distinto de la V3).
> **Sin fuente LaTeX:** se me denegó el acceso a la carpeta del paper (`publication plan/MonoSpectro_paper`). Por eso el texto corregido se entrega sección por sección para pegarlo en el `.tex` (`MonoSpectro_V4_texto_corregido.md`), y el diff (`MonoSpectro_V4_diff.pdf`) compara texto contra texto. No he podido compilar para comprobar que sigue en 4 páginas.

# 1. Resumen ejecutivo

La V4 es otro artículo respecto a la V3: nuevo título, instrumento renombrado como SpecToGo, Tabla I de especificaciones, la caracterización pasa a la Sec. II, 15 referencias y 4 páginas. Varios pendientes de la V3 quedan resueltos: extensión (P4), ref. [10] citada como arXiv y con la descripción correcta, hipótesis de fluorescencia nombrada (P3) y declaración de que el término cuadrático se añadió después de puntuar la validación.

He aplicado una edición completa de redacción y encaje de afirmaciones. Lo principal:

- quitar dos afirmaciones que exceden los datos («quantitatively comparable to a laboratory-grade instrument» y «this ensures a robust generalization»);
- corregir tres citas que no apoyaban su frase ([1], [4] y [11]);
- deshacer una frase de la Sec. II que no daba ningún resultado;
- indicar que la Tabla I describe el instrumento realineado;
- completar la declaración de disponibilidad.

Ninguna cifra ha cambiado, salvo redondeos que ya estaban en el manuscrito.

**Cómo lo vería ahora un revisor:** revisión menor. Lo más probable es que pida:

1. incertidumbre de los coeficientes;
2. una validación con más de tres colorantes o una prueba tras realinear;
3. la definición de dos filas de la Tabla II.

Hay además un riesgo de integridad que tú decidiste mantener (sección 5): exclusión del azul de bromotimol sin declarar.

# 2. Cambios aplicados (nivel 1)

## 2.1 Ciencia y encuadre

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| *Abstract*, penúlt. frase | «These results are quantitatively comparable to those of a laboratory-grade instrument» | «A low-cost camera-based instrument can thus be brought close to a laboratory reference with a simple correction» | Afirmaba más de lo que dan los datos: el RMSE es 0,07 y queda un déficit del ~10 % por encima de A = 0,5. |
| *Abstract* | «reduced to 0.07» | «from 0.32 to 0.07 … raises the pooled R² from 0.17 to 0.96» | Da el punto de partida (Tabla II: 0,315 y 0,167). |
| Sec. I, párr. 3 | «derived from the physics of the acquisition process. This ensures a robust generalization of the calibration, resulting in readings comparable to those obtained in a laboratory setting.» | «the form of this correction is motivated by how the camera records light (Section III), and it is tested on dyes that were not used to fit it.» | El término cuadrático es empírico y se añadió tras ver la validación; con 3 colorantes no se puede afirmar que «asegure» la generalización. |
| Sec. II, final | — | «These figures describe the realigned instrument; the coefficients of Eq. (2) were fitted before realignment.» y «made in a later session with the instrument realigned» | Tu respuesta: las pruebas de la Tabla I son de una sesión nueva con el montaje actual. Sin esta frase, un lector cree que caracterizan el instrumento que produjo los datos. |
| Sec. III, párr. 1 | «The tone curve … divides every absorbance by the same factor» | «A power-law tone curve …» | Solo una curva de potencia divide por un factor constante. |
| Sec. III, párr. 1 | — | «…, as does a dark signal that is not subtracted.» | La Sec. II dice que no se resta el *dark*, y un *offset* en I comprime las absorbancias altas. Un revisor lo preguntaría. |
| Sec. III, fluorescencia | «the sample is lit with white light and dispersed after the cuvette» | «the sample is illuminated with white light and the light is dispersed only after the cuvette» | Lo que se dispersa es la luz, no la muestra. |
| Sec. III | «for rhodamine B and Congo red» | «for two of the validation dyes (Section IV), rhodamine B and Congo red» | Los colorantes de validación se presentan después, en la Sec. IV. |
| Sec. IV, validación | — | «Because both instruments measure the same solution, the comparison does not depend on its nominal concentration.» | Se anticipa a la pregunta por las concentraciones, que no se publican por decisión tuya (2 nov). |
| Sec. V, párr. 1 | «the change is attributed to input smoothing» | (eliminado; solo se dan los desplazamientos tras corregir) | Causa no demostrada. La ganancia g(λ) y el término cuadrático también pueden mover los máximos. |
| Sec. VI | «by applying a three-coefficient correction, its absorbance readings can be compared…» | Reescrita en 4 frases con RMSE y R² y las limitaciones (8 bits, luz parásita) | Corrige el sujeto mal colocado y da la cifra principal. |

## 2.2 Referencias

Las 15 existen. Todas se comprobaron por título frente a OpenAlex y la [10] además por arXiv; los DOI están en la Hoja de estilo para el `.bib`.

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| Sec. I, [1] | «…rules it out for unattended applications, in the field, on a buoy or a moored station [1]» | «…for field work and for unattended deployments such as FerryBoxes and moored buoys [1]» | [1] (Pärt 2021) es un ejemplo de despliegue en FerryBox y boya, no una fuente sobre coste y tamaño. La frase ahora dice lo que la cita apoya. |
| Sec. I, [4] | «smartphone photometry validated on real analytes [4]» | «portable colorimetric sensors tested on spiked food samples [4]» | [4] (Nandeshwar 2023) usa detección óptica sensible a fase con piezas de consumo, sin cámara ni móvil como detector, y la prueba es con leche dopada con urea. |
| Sec. I | «devices with consumer image sensors have become credible detectors … [3]» | «3D-printed smartphone spectrophotometers [3]» | Se ajusta a [3] (Grasse 2016) y se mantiene el orden de numeración IEEE. |
| Sec. II, [11] | En la frase del filtro Bayer | Se pasa a la calibración de longitud de onda | [11] (Gaigalas 2009, NIST) trata de la calibración de longitud de onda y la respuesta espectral, no de los filtros Bayer. |
| [1], [6] | sin número de artículo | «Art. no. 778136», «Art. no. 615032» | Formato IEEE para revistas con número de artículo. |

## 2.3 Redacción (resumen; el detalle está en el diff)

- *Abstract* reescrito en 7 frases:
  - se corrige «across the 420 nm to 780 nm»;
  - se quita «significantly» (sugiere una prueba estadística);
  - se sustituye «device's» por el nombre del instrumento.
- Las frases largas de la Sec. II se dividen. La de repetibilidad («…for repeatability, taken in the mean absorbance within 5 nm…») no tenía sintaxis y no daba ningún resultado; ahora enumera las tres pruebas con punto y coma.
- «the 5 min used here» → «the 5 min used for the calibration and validation measurements»: la deriva se midió en otra sesión.
- Voz activa donde había pasiva impersonal: «We correct its readings with», «we refer to them», «publish».
- Tiempo verbal coherente: los métodos en pasado («were chosen», «selected»).
- Cifras de referencia de la Sec. V a 2 decimales (0,51, 1,58 y 1,15), como las del instrumento.
- Términos unificados: «pooled R²» (antes «overall» y «pooled»), «positions and shapes» (antes «position and shape» en la Sec. V) y «remeasured» por «retaken».

## 2.4 Figuras y tablas

| Ubicación | Cambio | Motivo |
|---|---|---|
| Fig. 3, pie | «at each wavelength (curves) and the identity line (dotted)» | Precisión. |
| Fig. 4, pie | Se añade «Each panel gives the RMSE before and after correction.» | Las cifras de los paneles no estaban explicadas. |
| Tabla II | Nota nueva: «N_c, number of fitted coefficients. Linear term only: Eq. (2) with h = 0.» | N_c no estaba definido. Ver el pendiente A5 sobre «Linear gain + offset». |
| Sec. III, Fig. 3a | «to near zero in the red» → «to slightly below zero above 700 nm» | Es lo que muestra la Fig. 3a. |

## 2.5 Formato de la revista

- IEEE Sensors Letters: máximo 4 páginas con referencias, sin opción de pagar páginas extra (si se pasa, la recomendación es enviarlo al *IEEE Sensors Journal*). La V4 cumple. El texto corregido suma unas **55 palabras netas**, unas 5–6 líneas a dos columnas. La pág. 4 tenía ~13 líneas libres, así que debería caber; **hay que compilar y comprobarlo** (A8).
- Disponibilidad de datos ampliada según tu respuesta: diseños, firmware, espectros de ambos instrumentos y código de análisis. La licencia MIT se limita a diseños, firmware y código, porque MIT no es una licencia para datos. Se quita «as supplementary material», porque GitLab no es material suplementario de IEEE.

# 3. Decisiones de nivel 2

| Pregunta | Decisión de Alex | Qué se hizo |
|---|---|---|
| Declarar la exclusión del azul de bromotimol y que el LOO no prefiere el término cuadrático | **Ninguna, dejar la V4** | No se añade nada. Ver el riesgo en la sección 5. |
| ¿De qué sesión son las pruebas de la Tabla I? | **Sesión nueva, montaje actual** | Se indica en la Sec. II que es una sesión posterior con el instrumento realineado y que la Ec. (2) se ajustó antes. No se añade la limitación de transporte en la Conclusión. |
| Disponibilidad de datos y código | **El repo tendrá datos y código** | Declaración ampliada (ver 2.5). |
| Declaración de uso de IA | **No añadirla** | No se añade. IEEE la exige para contenido generado por IA y solo la recomienda para edición de lenguaje (ver sección 5). |

# 4. Pendientes de nivel 3 (para el autor)

El detalle y un prompt autocontenido están en `Pendientes_autor_MonoSpectro_V4.md`.

| # | Pendiente | Criterio de «hecho» |
|---|---|---|
| A1 | ¿La Tabla I se midió con 8 bits procesados o con RAW de 10 bits? Si la sesión nueva usó la app RAW, la fila «Detector … 8-bit» y la Sec. II no describen esa caracterización. | Tabla I y Sec. II coinciden con la sesión real. |
| A2 | Métrica de las preparaciones independientes (1,3, 2,7 y 6,6 %): ¿RSD o rango? | Se nombra la métrica. |
| A3 | Incertidumbre y correlación de g₀, g₁ y h. g(780 nm) = 0,96 < 1 queda sin explicar (pendiente menor 2 de la V3). | Coeficientes con ± (bootstrap por muestra) y una frase sobre g₁–h. |
| A4 | [9] Bouveresse 1995 (*Anal. Chem.* 67, 1381): comprobar que es una corrección *slope-and-bias* global. Sospecho que modifica el algoritmo de Shenk, que corrige pendiente y sesgo **por longitud de onda**. En ese caso no apoya «far fewer degrees of freedom» ni la fila «Gain + offset [9]». | Leer el resumen; si no encaja, sustituirla por una referencia de *slope/bias* global o citar la revisión [7]. |
| A5 | Definir «Linear gain + offset» (N_c = 4) y «Degree 2/3» en la nota de la Tabla II. | Nota completa. |
| A6 | Subir datos y código al repo antes del envío y, si es posible, un DOI de Zenodo y una licencia para los datos (CC BY 4.0). | El enlace contiene lo que dice el texto. |
| A7 | V3 P5 sigue abierto: la V2 decía que la calibración λ usaba los máximos de las soluciones, y la V3–V4 dice picos de lámpara fluorescente. | Confirmar en tus notas cuál es la correcta. |
| A8 | Compilar con IEEEtran y comprobar las 4 páginas. | 4 páginas. |
| A9 | (Opcional, refuerza mucho) Sesión de una hora: aplicar los coeficientes **existentes** tras realinear y, si se puede, validar con un colorante nuevo y el modelo congelado. | Una frase con el RMSE resultante. |
| A10 | Fabricante y lote de los colorantes alimentarios (solo hay ASIN). | Se nombra la marca. |

**Estado de los pendientes de la V3:**

- P1: parcial. Se declara el cuadrático; el bromotimol y el LOO quedan por decisión de Alex.
- P2: parcial. Ahora se declara el realineado, pero la prueba de supervivencia sigue sin hacer (A9).
- P3: parcial. La fluorescencia está nombrada, pero no probada.
- P4: resuelto.
- P5: abierto (A7).
- Menores:
  - 1 (máximo del azul de metileno): ya no aplica.
  - 2 (g(λ)): abierto (A3).
  - 3 (lectura excluida): resuelto en la forma; falta la métrica (A2).
  - 6 (residuos en la Fig. 3): abierto, no es imprescindible.
  - 7 (foto): resuelto.
  - 8 (DOI del repositorio y lote): abierto (A6, A10).

# 5. Comentarios confidenciales y riesgos que un revisor aún podría señalar

- **Elecciones posteriores a la validación.** Son tres: el término cuadrático (declarado), la exclusión del azul de bromotimol (no declarada) y el resultado del LOO, que no prefería el cuadrático (no declarado). El mismo conjunto de 3 colorantes se ha usado en cuatro versiones.
  - Por tu decisión, no se declaran las dos últimas. Tu propio protocolo prohíbe excluir muestras después de ver el resultado sin declararlo.
  - Si un revisor ve el preprint, una versión anterior o el FocalReview, lo detectará.
  - La forma más barata de cerrarlo es una frase. La más sólida es A9.
- **IA.** IEEE exige declarar en los agradecimientos el contenido generado con IA y recomienda hacerlo cuando solo se usó para editar el lenguaje ([política IEEE](https://open.ieee.org/author-guidelines-for-artificial-intelligence-ai-generated-text/)). Varias secciones se han reescrito con IA a lo largo de las rondas, así que la línea entre «editar» y «generar» es discutible.
- **Validación pequeña.** Son tres colorantes, una preparación de cada uno y una sesión, sin incertidumbre en el RMSE. Un revisor de *Sensors Letters* lo aceptará en una *letter*, pero puede pedir más.
- **Concentraciones de validación no publicadas.** La frase añadida en la Sec. IV lo justifica, pero si alguien pregunta, la explicación interna (posible degradación) no debe contradecir lo publicado.

# 6. Nota de coherencia (no se envía)

- La ref. [10] (arXiv:2610.09180) y el FocalReview deben describir igual los modelos de cámara («dozens of coefficients»: 38 y 18). Aquí ya es coherente.
- La vault dice que la corrección del paper (g₀ 2,320, g₁ −1,364, h 1,943) solo vale para los datos antiguos de 8 bits, y que con RAW empeora 10–15 veces. El paper ya dice «8-bit» y propone RAW como mejora, así que es coherente. Pero si la Tabla I sale de la sesión RAW (A1), hay que separarlo.

# 7. Herramientas y lo que no se pudo verificar

- **Hecho:** lectura completa del PDF (las 4 páginas a imagen); comparación con el informe V3 y la nota del vault; recálculo de las medias de la Tabla II (todas cuadran salvo Degree 2: 0,1207, que redondea a 0,121 frente al 0,120 publicado, probablemente por redondeo de los valores intermedios); comprobación de las 15 referencias (OpenAlex y arXiv con la herramienta reference-lookup) y del contenido de [4] y de la política de IEEE (web); diff palabra a palabra generado con un script.
- **No usado:** las skills del protocolo (peer-review, paper-critique, redline-edit, proofread, etc.) no se cargaron. Los pasos se hicieron a mano.
- **No verificado:**
  - compilación y 4 páginas (no hay fuente);
  - el resumen de [9] (no accesible);
  - datos y scripts de los autores (no tuve acceso al repo del paper ni al de MonoSpectro), así que no se recalculó ninguna cifra a partir de los datos;
  - que los colorantes negativos sean exactamente RhB y CR (el texto lo afirma; no hay datos para comprobarlo).
