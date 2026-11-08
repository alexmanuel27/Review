---
title: "Informe de revisión por pares — Tercera ronda (V3)"
subtitle: "«Absorbance Spectrophotometry on a Monochrome Camera» (MonoSpectro) — IEEE Sensors Letters"
date: "17 de octubre de 2026"
---

> **Borrador de trabajo: revisión simulada previa al envío.** Esta es la tercera ronda: evalúo la V3 frente a los puntos de la V2 (N1–N4, M5 y M9) y sus recomendaciones. Mantengo el mismo supuesto de revista: *IEEE Sensors Letters*, con un límite de 4 páginas que incluye las referencias. Leí las 5 páginas, revisé las 3 figuras y recalculé las cifras de la Tabla I y del texto.
>
> SHA-256 del PDF revisado: `dbf9c8cca542f7df8d1a2ef47c419a1c027db5703572b85ee26cf1fe7f5f3fd5`

# 1. Valoración global

La V3 da un paso importante. Los autores añadieron:

- la gráfica A_ref frente a A_dev que se pidió en la ronda anterior (Fig. 2, abajo);
- un modelo que recoge el aumento de la compresión con la absorbancia;
- las primeras cifras metrológicas: dispersión y FWHM con líneas de Hg, deriva de la lámpara y repetibilidad con reinserción de la cubeta y con preparaciones independientes;
- una explicación transparente de las elecciones que se hicieron después de ver la validación.

El tono es honesto y las limitaciones están bien expuestas. Comprobé que las cifras cuadran:

- 0,199 + 0,039 + 0,005 = 0,243 = 0,315 − 0,072;
- la media con recorte de los tres colorantes es 0,072;
- el RMSE sin corrección, 0,315, coincide con el de la V2 sin el azul de bromotimol.

Quedan tres asuntos que un revisor señalará:

1. **El conjunto de validación se ha reutilizado en las tres versiones.** El modelo ha pasado de 4 a 2 y luego a 3 coeficientes, y en esta versión se excluye el colorante que peor resultado daba. La cifra del resumen ya no es una estimación independiente (P1).
2. **Tras el transporte, el instrumento se desalineó unos 80 píxeles** y no se comprobó si la corrección sigue valiendo. Esto afecta directamente a la conclusión de uso en campo (P2).
3. **El manuscrito sigue ocupando 5 páginas** (P4).

# 2. Estado de los puntos de la segunda ronda

| Punto V2 | Estado | Comentario |
|-----------|-----------|----------------------------|
| N1. Modelo y compresión no lineal | **Mayormente resuelto** | La Ec. (2) añade un término cuadrático en A_dev, y la Fig. 2 (abajo) muestra A_ref frente a A_dev en 4 longitudes de onda con el modelo superpuesto. No se probó el modelo físico γ + luz parásita (era opcional). El término cuadrático se añadió después de puntuar la validación, y los autores lo declaran (ver P1). |
| N2. Origen de la línea base negativa | **Parcial** | Se descartan la deriva de la lámpara (≤ 0,007 en 30 min) y la reinserción de la cubeta (0,000 ± 0,002), y se reconoce que el origen sigue abierto. Falta probar una hipótesis concreta (ver P3). |
| N3. *Abstract* frente a Tabla I y LODO | **Parcial** | La comparación con el ajuste por longitud de onda ya se limita a los colorantes de validación. Pero el *abstract* y la Sec. V siguen concluyendo que una corrección con pocos coeficientes es preferible, cuando el LODO da 0,28–0,31 para **todas** las correcciones (ver P1). |
| N4. Criterio de rango útil | **Resuelto** | Se sustituye «below 1.5» por errores relativos medianos por tramos de absorbancia (4 %, −12 % y −9 %). |
| M5a. Repetibilidad | **Mayormente resuelto** | 0,5–0,7 % con reinserción, y 1,1–1,2 % y 7 % entre preparaciones. Pero se midió con colorantes alimentarios, en otra sesión y con el instrumento realineado (ver P2). |
| M5b. Calibración de longitud de onda | **Resuelto en el método; sin aplicar a los datos de validación** | Las líneas de Hg dan 1,40 nm/píxel y reproducen líneas independientes con un error de 0,4 nm, pero tras realinear el instrumento. Los datos de validación usan otra calibración, con picos de una lámpara fluorescente (ver P2 y P5). |
| M5c. Resolución | **Resuelto** | FWHM de 13–14 nm. |
| M9. Extensión | **No resuelto** | 5 páginas: las referencias [16]–[27] pasan a la pág. 5. |
| R1. Suavizado | **Resuelto** | Se mantiene, ahora justificado también por el sesgo de atenuación. |
| R2. Azul de bromotimol | **Sustituido por exclusión** | Ya no se tampona: se excluye. Ver P1. |
| R3. Residuos en la Fig. 3 | **No resuelto** | Menor. |
| R4. Foto de la Fig. 1b | **No resuelto** | Es la misma imagen, con la carcasa abierta. |
| R5. Sesgo de atenuación | **Resuelto** | — |
| R6. DOI, fabricante y muestreo | **Parcial** | Se indica el muestreo (1,4 nm por píxel). Faltan el DOI del repositorio y el fabricante y lote de los colorantes. |

# 3. Problemas mayores

### P1. La validación se ha usado para elegir el modelo y las muestras; la cifra principal debe reflejarlo

- **Ubicación:** *abstract* (0,32 → 0,11 y 0,07; «Corrections with more freedom… do worse»); Sec. I («Every choice but one, disclosed in Section III, is made without the validation dyes»); Sec. III, final («It was added after the validation dyes had been scored with the linear term alone, and leave-one-out within the calibration set does not prefer it»); Sec. IV (exclusión del azul de bromotimol); Sec. V (último párrafo).
- **Observación:**
  1. **Hay dos elecciones posteriores a la validación, no una.** Además del término cuadrático, se excluye el azul de bromotimol, que en la V2 era el colorante peor corregido (0,154 con recorte). Por tanto, la frase «every choice but one» no es exacta.
  2. **El modelo cambió en cada ronda (4, 2 y 3 coeficientes) después de ver el mismo conjunto de 3–4 colorantes.** En la versión actual, la validación cruzada dentro de la calibración **no prefiere** el modelo elegido, y el LODO no distingue ninguna corrección (0,28–0,31).
  3. **Las cifras del resumen corresponden al modelo elegido después de ver la validación.** El modelo especificado de antemano, el «linear term only» de la V2, da 0,163 y 0,081.
  4. **La justificación de la exclusión no encaja con el método.** Se excluye el azul de bromotimol porque «tests the light source more than the correction». Pero el rango de trabajo sigue empezando en 420 nm para los demás colorantes. Si la región azul no es fiable, lo coherente es acortar el rango para todos, no retirar una muestra.
- **Por qué importa:** el título del trabajo y el *abstract* prometen una comparación «on samples its calibration has never seen». Tras tres rondas, el conjunto de validación ya no cumple esa función, y las afirmaciones comparativas («preferable», «do worse») se apoyan en él.
- **Acción solicitada (basta una de las dos vías):**
  - **(a) Solo texto y reanálisis.**
    - Encabezar el *abstract* con el modelo especificado antes de la validación (término lineal: 0,163 y 0,081), o con ambos modelos.
    - Presentar la Ec. (2) como exploratoria.
    - Reponer el azul de bromotimol en la Tabla I (con y sin él), o recortar el rango a ≥ 500 nm para todos los colorantes.
    - Corregir «every choice but one».
    - Formular la conclusión de modelos según el LODO: «one to three coefficients suffice; more freedom brings no benefit».
  - **(b) Vía recomendada.** Aprovechar la nueva sesión, en la que de todos modos hay que recalibrar (ver P2): congelar la forma de la Ec. (2) y los hiperparámetros, reajustar con los colorantes de calibración y validar **una sola vez** con colorantes nuevos o preparaciones nuevas. Puede incluirse uno que absorba por debajo de 500 nm, como la tartrazina o el azul de bromotimol tamponado.

### P2. El instrumento se desalinea con el transporte y no se sabe si la corrección sobrevive

- **Ubicación:** Sec. IV («In a later session, after the instrument had been transported…»); Sec. V («After transport the spectrum had shifted on the sensor by about 80 pixels… whether the coefficients of Eq. (2) survive realignment was not tested»); Sec. VI; *abstract*.
- **Observación:** 80 píxeles equivalen a unos 110 nm a 1,40 nm por píxel. Las cifras metrológicas nuevas (Hg, deriva y repetibilidad) caracterizan el instrumento **realineado**, no el que produjo los datos de calibración y validación. Además, mover la lámpara desplaza el espectro 3 píxeles (~4 nm).
- **Por qué importa:** la conclusión («a promising basis for field instruments once linear acquisition is in place») presenta la adquisición lineal como el único obstáculo. La estabilidad mecánica es, como mínimo, igual de limitante. Los propios autores la identifican en la revisión que acompaña a este trabajo como la debilidad principal de esta arquitectura.
- **Acción solicitada:**
  - **Mínimo (solo texto):** añadir la sensibilidad al alineamiento como limitación en el *abstract* y en la Conclusión, y aclarar en la Sec. IV que las cifras metrológicas corresponden al instrumento realineado.
  - **Recomendado:** en la sesión nueva, recalibrar el eje con Hg, volver a medir 2–3 soluciones de calibración y aplicar los coeficientes **existentes** de la Ec. (2). Reportar cuánto se degrada el RMSE. Es un experimento de una hora y responde directamente a la pregunta de campo.

### P3. El offset negativo dependiente de la muestra: probar la fluorescencia

- **Ubicación:** Sec. III, párrafo «The model has no offset…».
- **Observación:** el texto descarta la deriva y la reinserción, pero no propone ninguna hipótesis. Hay una muy plausible: en MonoSpectro la muestra se ilumina con luz blanca y la dispersión ocurre **después** de la cubeta. Por tanto, la fluorescencia de la muestra se recoge y se suma a I en su banda de emisión, lo que da absorbancias negativas.

  Los dos colorantes que no absorben por encima de 650 nm son la rodamina B, fuertemente fluorescente (emisión ~575 nm con cola hacia el rojo), y el rojo Congo, débilmente fluorescente. Por la Fig. 3, deben de ser los dos colorantes afectados.

  Un espectrofotómetro convencional de barrido, con el monocromador antes de la muestra, apenas registra ese efecto. Este artefacto, propio de los instrumentos de «óptica inversa», es además dependiente de la muestra, que es justo lo que se observa.
- **Por qué importa:** si es fluorescencia, el recorte a cero (16 % de la mejora) estaría ocultando un efecto físico identificable. También afectaría a colorantes alimentarios fluorescentes del conjunto de calibración, como la eritrosina, que suele estar en los tonos rosa y rojo.
- **Acción solicitada:**
  - Nombrar los dos colorantes.
  - Comprobar si la zona negativa coincide con la emisión de cada uno.
  - Hacer una prueba sencilla: un filtro de paso corto o de banda en la iluminación que excluya la emisión, o dos concentraciones para ver si el efecto escala con ella.
  - Si se confirma, explicarlo en una frase y justificar así el recorte, o restringir el rango.

### P4. Extensión y referencia [21]

- **Ubicación:** manuscrito completo; Sec. I («unlike the four-coefficient model used for the camera platform in [21]»); ref. [21].
- **Observación:**
  1. El manuscrito ocupa 5 páginas, con 12 referencias en la pág. 5, y el límite es de 4 incluidas las referencias. Esto puede causar un rechazo administrativo.
  2. La ref. [21] ya es pública como preprint (arXiv:2610.09180). Ahí, y en la revisión de los mismos autores, la plataforma de cámara usa expansiones de 38 y 18 coeficientes, no «four-coefficient». La descripción no coincide.
- **Acción solicitada:**
  - Reducir el texto a 4 páginas. Candidatos:
    - la frase geométrica de la Sec. II, que puede ir a material suplementario;
    - la ref. [14];
    - la repetición de cifras entre el *abstract*, la Sec. V y la Conclusión;
    - la Conclusión puede quedarse en 3 frases.
  - Citar la ref. [21] como arXiv:2610.09180 y corregir la descripción de su modelo.

### P5. La descripción de la calibración de longitud de onda cambió entre versiones

- **Ubicación:** Sec. II («Pixel position is mapped to wavelength by a quadratic polynomial fitted to the emission peaks of a fluorescent lamp»).
- **Observación:** la V2 decía, para los mismos datos, «fitted to the band maxima of solutions measured on both instruments». Ahora dice «emission peaks of a fluorescent lamp». Una de las dos descripciones es incorrecta.
- **Acción solicitada:** confirmar cuál es la correcta. Explicarlo en la carta de respuesta a los revisores si este cambio llega a una ronda real. Indicar qué líneas de la lámpara fluorescente se usaron y con qué residuos.

# 4. Problemas menores

1. **Máximo del azul de metileno.** Con las cifras redondeadas del texto (0,54 frente a 0,51), la diferencia es de +6 %, no del 4 %. Hay que dar un decimal más o corregir el porcentaje, también en el *abstract*.
2. **Interpretación de g(λ).** g(780 nm) = g₀ + g₁ = 0,96 < 1, y g(420 nm) = 3,68. Si «the linear term carries the tone curve», una ganancia menor que 1 en el rojo necesita explicación. Lo más probable es la correlación entre g₁ y h. Conviene reportar la incertidumbre de los tres coeficientes y su correlación.
3. **Lectura excluida en la repetibilidad.** «One mislabeled reading excluded»: indicar el resultado con ella o explicar cómo se identificó el error de etiqueta. Aclarar si «vary by» es una desviación estándar relativa o un rango.
4. **Afirmación sin cuantificar.** «These lateral shifts account for much of the remaining error in Fig. 3»: cuantificarlo, por ejemplo con el RMSE tras alinear los máximos, o matizarlo.
5. **Repetibilidad en colorantes distintos de la validación.** Se midió con colorantes alimentarios. Basta con indicarlo como limitación.
6. **Fig. 3:** añadir los residuos o sombrear las regiones recortadas. La foto de los matraces (abajo a la derecha) aporta poco en una *letter* de 4 páginas.
7. **Fig. 1b:** sigue mostrando la carcasa abierta.
8. **Repositorio:** añadir el DOI (Zenodo) y el fabricante y lote de los colorantes alimentarios.

# 5. Comentarios confidenciales al editor

- La revisión es seria y transparente. La reutilización del conjunto de validación a lo largo de las rondas (P1) es el punto que más conviene vigilar. Los autores lo declaran en parte, pero la cifra del resumen todavía no lo refleja.
- La ref. [21] ya es un preprint público. Conviene pedir la cita correcta y la coherencia con el manuscrito de revisión de los mismos autores.

# 6. Nota para Alex: coherencia entre manuscritos (no forma parte del informe al editor)

- **Ref. [21] frente a FocalReview y arXiv:2610.09180.** Aquí se describe como «four-coefficient model»; en la revisión, los sistemas B y C usan 38 y 18 coeficientes. Hay que alinearlo en ambos manuscritos y citar el arXiv.
- **Selección con la validación en FocalReview.** En la revisión se pidió (M2) elegir el grado sin los colorantes de validación. Aquí el problema análogo (P1) es más sutil, pero un revisor que lea los dos lo verá. Conviene resolverlo de la misma manera en ambos.
- **Calibración de longitud de onda.** El cambio de descripción entre la V2 y la V3 (P5) debe quedar claro en tus notas, para no arrastrar la versión incorrecta a la carta de respuesta.

# 7. Recomendación

**Revisión menor**, condicionada a P1(a), P2 (texto), P4 y P5. Pasa de revisión mayor a menor.

- **Lo imprescindible es solo texto y reanálisis:**
  - encabezar con el modelo especificado antes de la validación, o con ambos;
  - tratar el azul de bromotimol de forma coherente;
  - declarar la sensibilidad al alineamiento;
  - ajustar a 4 páginas;
  - corregir la ref. [21] y la descripción de la calibración de longitud de onda.
- **Lo recomendado, que haría el artículo claramente más fuerte**, es una sesión de medida: validación nueva con el modelo congelado (P1b), prueba de supervivencia de los coeficientes tras el realineamiento (P2) y prueba de fluorescencia (P3). Las tres caben en la misma sesión, en la que de todos modos hay que recalibrar el eje.

# 8. Sugerencias de redacción

No son bloqueantes. El original y la propuesta están en inglés; el motivo, en español. Si alguna frase cambia por los puntos mayores, esa versión tiene prioridad.

| # | Ubicación | Texto original | Propuesta | Motivo |
|------|---------|----------------------|----------------------|-----------|
| S01 | *Abstract*, l. 2–3 | «…with components costing approximately €166 in total, single-board computer included.» | «…for about €166 in components, including the single-board computer.» | Concisión. |
| S02 | *Abstract* | «On three synthetic organic dyes not used in the fit, it lowers the root-mean-square error against the reference from 0.32 to 0.11 absorbance units over 420 nm to 780 nm, and to 0.07 when negative outputs are set to zero, raises the pooled R2 from 0.17 to 0.96, and brings the band maxima within 4 to 9 % of the reference.» | «On three synthetic organic dyes not used in the fit, it lowers the root-mean-square error against the reference from 0.32 to 0.11 absorbance units over 420–780 nm (0.07 with negative outputs set to zero). The pooled R² rises from 0.17 to 0.96, and the band maxima come within [X]–9 % of the reference.» | Claridad: una frase de cinco cifras se divide en dos. Corregir el 4 % (menor 1) y las cifras según P1. |
| S03 | *Abstract* | «Corrections with more freedom, up to a per-wavelength fit with 722 coefficients, do worse.» | «On these dyes, corrections with more freedom, up to a per-wavelength fit with 722 coefficients, do worse; in leave-one-dye-out validation all corrections perform alike.» | Precisión: refleja también el LODO (P1). |
| S04 | *Abstract* | «The remaining shortfall, about 10 % above an absorbance of 0.5, is attributed to the processed 8-bit acquisition and to stray light, and points to linear acquisition as the main improvement ahead.» | «Above an absorbance of 0.5 the corrected readings remain about 10 % low, which we attribute to the processed 8-bit acquisition and to stray light; raw acquisition and a mechanically stable alignment are the main improvements ahead.» | Voz activa. Añade la alineación (P2). |
| S05 | Sec. I | «…which a correction with only three coefficients brings back.» | «…which a three-coefficient correction largely undoes.» | Naturalidad («brings back» suena forzado). Precisión: queda un déficit del 10 %. |
| S06 | Sec. I | «Every choice but one, disclosed in Section III, is made without the validation dyes.» | «Two choices, disclosed in Sections III and IV, were made after the validation dyes had been scored; all others were made without them.» | Exactitud (P1). Ajustar según la vía elegida. |
| S07 | Sec. II | «The camera is tilted by the 36° dispersion angle specified for the grating, the first-order direction for 589 nm at normal incidence (sin θ1 = λ/d, with d the grating period), which centers the visible band on the sensor, and the stock lens (110° horizontal field) covers the 24.8° to 51.3° spanned by the first order over 420 nm to 780 nm.» | «The camera is tilted by the 36° dispersion angle specified for the grating, the first-order direction for 589 nm at normal incidence (sin θ1 = λ/d, with d the grating period), which centers the visible band on the sensor. The stock lens (110° horizontal field) covers the 24.8°–51.3° spanned by the first order over 420–780 nm.» | Claridad: frase de 60 palabras dividida en dos. |
| S08 | Sec. III | «Away from the bands MonoSpectro reads slightly negative before any correction, by 0.06 to 0.09 above 650 nm for two of the validation dyes, and the value changes from sample to sample.» | «Away from the bands, MonoSpectro reads slightly negative before any correction, by 0.06 to 0.09 above 650 nm for [dye] and [dye], and the value changes from sample to sample.» | Precisión: nombrar los colorantes (P3). |
| S09 | Sec. III | «…so negative outputs are instead set to zero, which removes the visible part of this artifact.» | «…so we instead set negative outputs to zero, which removes only the visible part of this artifact.» | Voz activa. «Only» deja claro el alcance. |
| S10 | Sec. III | «It is kept because it is the simplest form consistent with the growing compression, and both versions are reported.» | «We keep it as the simplest form consistent with the growing compression, and report both versions.» | Naturalidad: voz activa. |
| S11 | Sec. IV | «In a later session, after the instrument had been transported, three further tests were made, the emission lines of a mercury lamp for the wavelength axis, 30 min of a water blank for lamp drift, and repeatability on three food colorings (lime, red and grape)…» | «In a later session, after the instrument had been transported and realigned, we made three further tests: the emission lines of a mercury lamp for the wavelength axis; a 30 min water blank for lamp drift; and repeatability on three food colorings (lime, red and grape)…» | Claridad (enumeración con dos puntos) y precisión («realigned», P2). |
| S12 | Sec. V | «Eq. (2) gives the lowest error and the highest R2 of all corrections, with and without clipping.» | «On the validation dyes, Eq. (2) gives the lowest error and the highest R² of all corrections, with and without clipping.» | Precisión: limita el alcance (P1). |
| S13 | Sec. V | «With nine calibration samples, a correction with a few coefficients is therefore preferable to a flexible one.» | «With nine calibration samples, a correction with a few coefficients is at least as accurate as a flexible one, and simpler.» | Coherencia con el LODO (P1). |
| S14 | Sec. V | «Five readings of one preparation, with the cuvette reinserted, vary by 0.5 to 0.7 % at the band maximum (one mislabeled reading excluded)…» | «Five readings of one preparation, with the cuvette reinserted between readings, have a relative standard deviation of 0.5–0.7 % at the band maximum; one reading was excluded because it was mislabeled.» | Precisión: «vary by» es ambiguo (menor 3). |
| S15 | Sec. VI | «Despite these limitations, chiefly the processed 8-bit acquisition, MonoSpectro is cheap, simple to build and compact, which makes it a promising basis for field instruments once linear acquisition is in place.» | «Its main limitations are the processed 8-bit acquisition and an alignment that shifts with transport. Once both are addressed, its low cost and simplicity make MonoSpectro a promising basis for field instruments.» | Precisión (P2) y ritmo: dos frases claras en vez de una subordinada larga. |

# 9. Prompt de corrección

Está en el archivo adjunto **«Prompt_correccion_MonoSpectro_V3.md»**.
