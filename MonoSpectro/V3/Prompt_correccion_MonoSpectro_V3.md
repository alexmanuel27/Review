# PROMPT DE CORRECCIÓN — MonoSpectro V3 → V4 (IEEE Sensors Letters)

Copia todo lo que sigue y pégalo en la IA, adjuntando el LaTeX de la V3. Si quieres que haga los reanálisis, adjunta también el repositorio con los datos (github.com/alexmanuel27/MonoSpectro).

---

## CONTEXTO

Eres coautor técnico de una *letter* para **IEEE Sensors Letters**. Límite: **4 páginas, incluidas las referencias**. La V3 ocupa 5.

El manuscrito, «Absorbance Spectrophotometry on a Monochrome Camera», presenta MonoSpectro: cámara OV9281 con salida procesada de 8 bits, red de 1000 líneas/mm, lámpara halógena de 10 W y Raspberry Pi 4, por unos 166 €. Incluye una corrección de 3 coeficientes:

A_ref = (g₀ + g₁t)·A_dev + h·A_dev²

ajustada con 9 colorantes alimentarios y validada con 3 colorantes sintéticos (azul de metileno, rodamina B y rojo Congo). La tercera ronda de revisión recomienda **revisión menor**, condicionada a los cambios de abajo.

## REGLAS ESTRICTAS

1. **No inventes nada.** Ni datos, ni cifras, ni resultados, ni figuras, ni citas. Toda cifra nueva debe salir de un cálculo que ejecutes sobre los datos del repositorio, o quedar como `[X]`.
2. Lo que requiera medidas nuevas o información de los autores se marca así: `\textbf{[REQUIERE AL AUTOR: …]}`.
3. Lo que requiera un reanálisis que no puedas ejecutar se marca así: `\textbf{[REANÁLISIS PENDIENTE: …]}`.
4. Escribe en inglés técnico, con estilo IEEE, y conserva la voz y la estructura salvo donde se indique.
5. No cambies autores ni afiliaciones.

## CAMBIOS OBLIGATORIOS

### C1. Reflejar en la cifra principal que la validación se usó para elegir el modelo y las muestras
- **Dónde:** *abstract* (cifras 0,32 → 0,11 y 0,07, y la frase «Corrections with more freedom… do worse»); Sec. I, frase «Every choice but one, disclosed in Section III, is made without the validation dyes»; Sec. III (final); Sec. IV (exclusión del azul de bromotimol); Sec. V, frase «With nine calibration samples, a correction with a few coefficients is therefore preferable to a flexible one»; Tabla I.
- **Problema:** hubo dos elecciones posteriores a la validación: el término cuadrático y la exclusión del azul de bromotimol. La validación cruzada dentro de la calibración no prefiere la Ec. (2), y el LODO da 0,28–0,31 para todas las correcciones.
- **Acción:**
  - (a) En el *abstract*, presenta el modelo especificado antes de la validación (término lineal, 2 coeficientes: 0,163 sin recorte y 0,081 con recorte) junto a la Ec. (2), o encabeza con el primero. Presenta la Ec. (2) como forma exploratoria.
  - (b) Sustituye «Every choice but one…» por una frase exacta: dos elecciones posteriores a la puntuación de la validación (término cuadrático y exclusión del azul de bromotimol).
  - (c) Reanálisis: añade a la Tabla I una variante con el azul de bromotimol incluido, o recorta el rango de trabajo a ≥ 500 nm **para todos** los colorantes y recalcula la Tabla I. Indica en el texto cuál de las dos opciones se usa.
  - (d) Cambia la conclusión de modelos por: «one to three coefficients suffice; more freedom brings no benefit (LODO 0.28–0.31 for every correction)».
  - (e) Opcional, recomendado: `[REQUIERE AL AUTOR: nueva validación con forma e hiperparámetros congelados y colorantes o preparaciones nuevos, medidos una sola vez; incluir uno que absorba por debajo de 500 nm]`. Prepara el texto con `[X]`.
- **Hecho cuando:** el lector puede distinguir, en el *abstract* y en la Tabla I, el modelo especificado de antemano del exploratorio, y ninguna frase afirma que se usó la validación una sola vez si no fue así.

### C2. Sensibilidad al alineamiento
- **Dónde:** *abstract* (última frase de resultados); Sec. IV, frase «In a later session, after the instrument had been transported…»; Sec. V, frase «whether the coefficients of Eq. (2) survive realignment was not tested»; Sec. VI.
- **Acción:**
  - (a) Indica en la Sec. IV que las cifras de Hg, deriva y repetibilidad corresponden al instrumento **realineado**, no al que produjo los datos de calibración y validación.
  - (b) Añade al *abstract* y a la Sec. VI la sensibilidad al alineamiento (desplazamiento de ~80 píxeles tras el transporte, unos 110 nm) como limitación, junto con la adquisición procesada.
  - (c) Recomendado: `[REQUIERE AL AUTOR: tras recalibrar el eje con Hg, volver a medir 2–3 soluciones de calibración y aplicar los coeficientes existentes de la Ec. (2); reportar el RMSE resultante]`.
- **Hecho cuando:** la conclusión de uso en campo menciona la estabilidad mecánica y el texto no atribuye las cifras metrológicas al estado de alineamiento equivocado.

### C3. Hipótesis de fluorescencia para el offset negativo
- **Dónde:** Sec. III, frase «Away from the bands MonoSpectro reads slightly negative before any correction, by 0.06 to 0.09 above 650 nm for two of the validation dyes…».
- **Acción:**
  - (a) `[REQUIERE AL AUTOR: nombrar los dos colorantes]`. Previsiblemente son la rodamina B y el rojo Congo.
  - (b) Añade una frase con la hipótesis: «Because the sample is illuminated with white light and dispersed afterwards, its fluorescence adds to I and can produce negative absorbance; rhodamine B and Congo red fluoresce in this region».
  - (c) `[REQUIERE AL AUTOR: prueba con un filtro en la iluminación que excluya la emisión, o con dos concentraciones]`. Si se confirma, justifica el recorte por esta causa.
- **Hecho cuando:** el texto propone y, si es posible, prueba una causa física del offset dependiente de la muestra.

### C4. Coherencia de la calibración de longitud de onda
- **Dónde:** Sec. II, frase «Pixel position is mapped to wavelength by a quadratic polynomial fitted to the emission peaks of a fluorescent lamp».
- **Acción:** `[REQUIERE AL AUTOR: confirmar el procedimiento real usado para los datos de calibración y validación; la V2 decía «band maxima of solutions measured on both instruments»]`. Indica qué líneas de la lámpara fluorescente se usaron y con qué residuos.
- **Hecho cuando:** el método descrito es el realmente usado y sus residuos están reportados.

### C5. Cuatro páginas y ref. [21]
- **Acción:**
  - (a) Reduce el manuscrito a 4 páginas, incluidas las referencias, sin perder C1–C4. Dónde recortar:
    - la frase geométrica de la Sec. II, que puede resumirse o ir al suplemento;
    - la ref. [14];
    - las cifras repetidas entre el *abstract*, la Sec. V y la Sec. VI (la Sec. VI puede quedarse en 3 frases);
    - la foto de los matraces de la Fig. 3.
  - (b) Cita la ref. [21] como preprint: A. M. Rivera-Rivera *et al.*, «Low-Cost Spectrophotometers: A Comparative Evaluation of Open-Source Architectures», arXiv:2610.09180, 2026.
  - (c) Sustituye «unlike the four-coefficient model used for the camera platform in [21]» por una descripción coherente con ese preprint: `[REQUIERE AL AUTOR: confirmar cómo describir el modelo de [21]]`.
- **Hecho cuando:** el PDF compilado ocupa ≤ 4 páginas y la ref. [21] está bien citada y descrita.

### C6. Correcciones numéricas y de precisión
- **Máximo del azul de metileno:** 0,54 frente a 0,51 es +6 %, no 4 %. Da un decimal más o corrige el porcentaje en el *abstract* y en la Sec. V.
- **Coeficientes:** reanálisis. Reporta la incertidumbre de g₀, g₁ y h y la correlación entre g₁ y h. Comenta que g(780 nm) = 0,96 < 1 no es compatible con una curva tonal pura.
- **Repetibilidad:** indica si «vary by» es una desviación estándar relativa o un rango, y cómo se identificó la lectura mal etiquetada (o el resultado con ella).
- **Desplazamientos laterales:** cuantifica «These lateral shifts account for much of the remaining error in Fig. 3», por ejemplo con el RMSE tras alinear los máximos (reanálisis), o matízalo.

## CAMBIOS RECOMENDADOS

- **R1.** Fig. 3: añade residuos o sombrea las regiones recortadas. Quita la foto de los matraces (también ayuda a C5).
- **R2.** Fig. 1b: `[REQUIERE AL AUTOR: foto del prototipo cerrado]`.
- **R3.** Data Availability: DOI de Zenodo; fabricante y lote de los colorantes alimentarios.
- **R4.** Indica que la repetibilidad se midió con colorantes alimentarios y no con los de validación.

## SUGERENCIAS DE REDACCIÓN (reemplazos literales; aplícalos si no chocan con C1–C6)

| # | Original | Propuesta |
|---|---|---|
| S01 | …with components costing approximately €166 in total, single-board computer included. | …for about €166 in components, including the single-board computer. |
| S02 | On three synthetic organic dyes not used in the fit, it lowers the root-mean-square error against the reference from 0.32 to 0.11 absorbance units over 420 nm to 780 nm, and to 0.07 when negative outputs are set to zero, raises the pooled R2 from 0.17 to 0.96, and brings the band maxima within 4 to 9 % of the reference. | On three synthetic organic dyes not used in the fit, it lowers the root-mean-square error against the reference from 0.32 to 0.11 absorbance units over 420–780 nm (0.07 with negative outputs set to zero). The pooled R² rises from 0.17 to 0.96, and the band maxima come within [X]–9 % of the reference. *(ajustar cifras según C1 y C6)* |
| S03 | Corrections with more freedom, up to a per-wavelength fit with 722 coefficients, do worse. | On these dyes, corrections with more freedom, up to a per-wavelength fit with 722 coefficients, do worse; in leave-one-dye-out validation all corrections perform alike. |
| S04 | The remaining shortfall, about 10 % above an absorbance of 0.5, is attributed to the processed 8-bit acquisition and to stray light, and points to linear acquisition as the main improvement ahead. | Above an absorbance of 0.5 the corrected readings remain about 10 % low, which we attribute to the processed 8-bit acquisition and to stray light; raw acquisition and a mechanically stable alignment are the main improvements ahead. |
| S05 | …which a correction with only three coefficients brings back. | …which a three-coefficient correction largely undoes. |
| S06 | Every choice but one, disclosed in Section III, is made without the validation dyes. | Two choices, disclosed in Sections III and IV, were made after the validation dyes had been scored; all others were made without them. |
| S07 | …which centers the visible band on the sensor, and the stock lens (110° horizontal field) covers the 24.8° to 51.3° spanned by the first order over 420 nm to 780 nm. | …which centers the visible band on the sensor. The stock lens (110° horizontal field) covers the 24.8°–51.3° spanned by the first order over 420–780 nm. |
| S08 | …by 0.06 to 0.09 above 650 nm for two of the validation dyes, and the value changes from sample to sample. | …by 0.06 to 0.09 above 650 nm for [dye] and [dye], and the value changes from sample to sample. |
| S09 | …so negative outputs are instead set to zero, which removes the visible part of this artifact. | …so we instead set negative outputs to zero, which removes only the visible part of this artifact. |
| S10 | It is kept because it is the simplest form consistent with the growing compression, and both versions are reported. | We keep it as the simplest form consistent with the growing compression, and report both versions. |
| S11 | In a later session, after the instrument had been transported, three further tests were made, the emission lines of a mercury lamp for the wavelength axis, 30 min of a water blank for lamp drift, and repeatability on three food colorings (lime, red and grape), | In a later session, after the instrument had been transported and realigned, we made three further tests: the emission lines of a mercury lamp for the wavelength axis; a 30 min water blank for lamp drift; and repeatability on three food colorings (lime, red and grape), |
| S12 | Eq. (2) gives the lowest error and the highest R2 of all corrections, with and without clipping. | On the validation dyes, Eq. (2) gives the lowest error and the highest R² of all corrections, with and without clipping. |
| S13 | With nine calibration samples, a correction with a few coefficients is therefore preferable to a flexible one. | With nine calibration samples, a correction with a few coefficients is at least as accurate as a flexible one, and simpler. |
| S14 | Five readings of one preparation, with the cuvette reinserted, vary by 0.5 to 0.7 % at the band maximum (one mislabeled reading excluded), | Five readings of one preparation, with the cuvette reinserted between readings, have a relative standard deviation of 0.5–0.7 % at the band maximum (one reading was excluded because it was mislabeled), |
| S15 | Despite these limitations, chiefly the processed 8-bit acquisition, MonoSpectro is cheap, simple to build and compact, which makes it a promising basis for field instruments once linear acquisition is in place. | Its main limitations are the processed 8-bit acquisition and an alignment that shifts with transport. Once both are addressed, its low cost and simplicity make MonoSpectro a promising basis for field instruments. |

## FORMATO DE TU RESPUESTA

1. **El LaTeX completo revisado**, compilable, con los marcadores en negrita.
2. **Una tabla de trazabilidad** con las columnas: Cambio (C1–C6, R1–R4, S01–S15) | Dónde | Qué se hizo | Estado (Hecho / Pendiente del autor / Pendiente de reanálisis / No aplicado y por qué).
3. **El código y los resultados de cada reanálisis** (C1c, C6), incluidas la incertidumbre y la correlación de g₀, g₁ y h.
4. **Una lista priorizada** de lo que el autor debe confirmar o medir: C4, luego C3a, luego C2c y C1e, y por último C3c.
5. **El número de páginas** del PDF compilado.
