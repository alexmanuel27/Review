# PROMPT DE CORRECCIÓN — MonoSpectro V2 → V3 (IEEE Sensors Letters)

Copia todo lo que sigue y pégalo en la IA, adjuntando el LaTeX de la V2. Si quieres que haga los reanálisis, adjunta también el repositorio con los datos (github.com/alexmanuel27/MonoSpectro).

---

## CONTEXTO

Eres coautor técnico de una *letter* para **IEEE Sensors Letters**. Límite: **4 páginas, incluidas las referencias**. La V2 ocupa 5.

El manuscrito, «Absorbance Spectrophotometry on a Monochrome Camera», presenta MonoSpectro: cámara OV9281 monocroma con salida procesada de 8 bits, red de 1000 líneas/mm, lámpara halógena de 10 W y Raspberry Pi 4. Incluye una corrección de 2 coeficientes, A_ref = (a₀ + a₁t)·A_dev, ajustada con 9 colorantes alimentarios y validada con 4 colorantes sintéticos, además de una validación *leave-one-dye-out* (LODO) sobre las 13 soluciones.

La segunda ronda de revisión reconoce mejoras importantes y pide los cambios de abajo para aceptar.

## REGLAS ESTRICTAS

1. **No inventes** datos, cifras, resultados, figuras ni citas. Toda cifra nueva debe salir de un cálculo que ejecutes sobre los datos del repositorio, o quedar como `[X]`.
2. Lo que requiera medidas nuevas se marca así: `\textbf{[REQUIERE AL AUTOR: …]}`.
3. Lo que requiera reanálisis y no puedas ejecutar se marca así: `\textbf{[REANÁLISIS PENDIENTE: …]}`.
4. Escribe en inglés técnico, con estilo IEEE, y conserva la voz y la estructura salvo donde se indique.
5. No cambies autores ni afiliaciones.

## CAMBIOS OBLIGATORIOS

### C1. Modelo coherente con la compresión no lineal documentada
- **Dónde:** Sec. III, Ec. (3) y la frase «The form of Eq. (3) is chosen from the physics above»; Tabla I; Fig. 2; Sec. V, frase «the ratio A_ref/A_dev rises from 2.4… to 4.9 above 2… level off near 0.65».
- **Problema:** la curva tonal (A/γ) justifica una ganancia constante, pero la luz parásita produce una compresión que crece con A y satura, y eso es lo que muestran los datos. La Ec. (3) no puede representarlo. Además, las 5 soluciones de calibración con A_ref > 2 inflan la ganancia y causan la sobrecorrección del azul de metileno.
- **Acción:**
  - (a) Reanálisis: ajusta el modelo físico invertido A_ref = −log₁₀[(1+s)·10^(−γ·A_dev) − s], con γ y s globales. Si lo justifica la validación cruzada dentro de la calibración, prueba también s lineal en λ. Evalúalo con el mismo protocolo (validación con y sin recorte, y LODO) y añádelo como fila a la Tabla I. Referencia de plausibilidad: γ ≈ 2,4 y s ≈ 3 % reproducen el cociente de 2,4 y la meseta de 0,65.
  - (b) Reanálisis alternativo o adicional: la Ec. (3) ajustada solo con puntos A_ref < límite útil.
  - (c) Sustituye el panel b(λ) de la Fig. 2, que es idénticamente cero, por un gráfico de A_dev frente a A_ref (todas las muestras de calibración, en 450/550/650/750 nm) con la curva del modelo elegido.
  - (d) Si el modelo γ + s es igual o mejor, adóptalo como modelo principal y reescribe la Sec. III en consecuencia. Si no, mantén la Ec. (3), pero explica explícitamente que solo captura la parte de curva tonal y que por eso sobrecorrige las absorbancias bajas.
- **Hecho cuando:** el modelo principal es coherente con la frase de la Sec. V sobre el cociente que crece y se satura, y existe la figura A_dev frente a A_ref.

### C2. Explicar la línea base negativa en lugar de justificar «sin offset» por el blanco
- **Dónde:** Sec. III, frase «The model has no offset, since both instruments read zero on the blank»; Sec. V, frase «MonoSpectro reads slightly negative, by up to about 0.1, away from the bands».
- **Acción:**
  - (a) Indica si el −0,1 se mide antes o después de aplicar la ganancia.
  - (b) Reanálisis: si hay blancos sucesivos guardados, cuantifica la deriva de I₀ entre blanco y muestra. Si no los hay: `[REQUIERE AL AUTOR: medir la deriva de la lámpara durante 10–30 min tras un calentamiento de 5 min]`.
  - (c) Comprueba si la referencia del rojo Congo tiene una línea base de ~0,1 por encima de 650 nm (Fig. 3) y cuánto RMSE aporta.
  - (d) Reescribe la justificación: el modelo no lleva offset porque [causa identificada], y el recorte corrige [artefacto identificado]. Sustituye «as absorbance cannot be negative» por la causa real.
- **Hecho cuando:** el texto identifica el origen del offset negativo y el recorte deja de justificarse solo por el signo de la absorbancia.

### C3. Alinear el *abstract* y la conclusión con la Tabla I
- **Dónde:** *abstract*, frase «It performs as well as models with up to eight coefficients and better than a per-wavelength fit with 722»; Sec. V, frase «the per-wavelength fit… is the least accurate of the corrections»; Sec. VI.
- **Hechos que debes respetar:**
  - En LODO, el orden es: escalar 0,271 < por longitud de onda 0,273 < ganancia lineal 0,277 < …, todas con DE ≈ 0,2.
  - Sin recorte, el grado 2 (0,242) es peor que el ajuste por longitud de onda (0,208).
- **Acción:**
  - Reescribe el *abstract* y la Sec. VI con la conclusión «one or two coefficients suffice; further freedom brings no benefit».
  - Elimina «better than a per-wavelength fit» o limítalo explícitamente al conjunto de validación con recorte.
  - En la Sec. V, añade «with clipping» a la frase sobre el menos exacto.
  - Si C1 cambia los números, actualízalos en todo el texto.
- **Hecho cuando:** ninguna afirmación comparativa contradice ninguna columna de la Tabla I.

### C4. Definir el rango útil
- **Dónde:** *abstract* («below about 1.5»); Sec. V.
- **Acción:**
  - Define el límite con un criterio explícito (por ejemplo, el error relativo corregido < 10 %), calculado con los datos de calibración.
  - Comenta que la rodamina B, con un pico de 1,58, está en el límite.
  - Reanálisis: añade a la Tabla I una columna «LODO, A_ref < límite».
- **Hecho cuando:** el límite tiene un criterio y una cifra calculada, y el LODO se reporta también dentro de rango.

### C5. Precisión y eje de longitud de onda
- **Dónde:** Sec. II, frase «Pixel position is mapped to wavelength by a quadratic polynomial fitted to the band maxima of solutions measured on both instruments»; Sec. V, frase «Precision across preparations was not quantified».
- **Acción:**
  - (a) Indica qué soluciones se usaron para la calibración de longitud de onda. Si incluyen colorantes de validación, recalibra solo con los de calibración: `[REANÁLISIS PENDIENTE]`.
  - (b) `[REQUIERE AL AUTOR: n ≥ 3 preparaciones independientes por colorante de validación; reportar DE del RMSE y de la absorbancia de pico]`. Prepara en la Tabla I o en el texto el hueco «RMSE [X] ± [X]».
  - (c) `[REQUIERE AL AUTOR: recalibrar el eje λ con líneas de emisión (LEDs caracterizados en el espectrofotómetro de referencia, láseres de 405/532/650 nm o una lámpara de Hg/Ar); reportar el error residual en nm y la FWHM de una línea]`. Redacta la frase con `[X]`.
  - (d) Sustituye «far enough for the beam reaching the grating to be nearly parallel» por la FWHM medida `[X] nm`.
- **Hecho cuando:** el manuscrito reporta, o reserva con marcadores, la repetibilidad, el error de longitud de onda frente a patrones de emisión y la resolución.

### C6. 4 páginas como máximo
- **Acción:** reduce el manuscrito a 4 páginas, incluidas las referencias, conservando lo añadido en C1–C5. Dónde recortar:
  - la derivación geométrica de la Sec. II (Ec. (1) y los ángulos, que pueden quedar en una frase con referencia al material suplementario);
  - la frase sobre HTTP y el punto de acceso;
  - las referencias [14]–[15], o una de ellas;
  - el panel b(λ) (ver C1c).
- **Hecho cuando:** el PDF compilado ocupa ≤ 4 páginas.

## CAMBIOS RECOMENDADOS

- **R1.** Valorar eliminar el suavizado de Savitzky–Golay: aporta el 2 % (0,005 UA). Si se mantiene, indicar el orden de la ablación (71/27/2 %).
- **R2.** Azul de bromotimol: `[REQUIERE AL AUTOR: indicar pH o tampón]`, o eliminar «in its acid form».
- **R3.** Fig. 3: añadir residuos o sombrear las regiones recortadas.
- **R4.** Fig. 1b: `[REQUIERE AL AUTOR: foto del prototipo cerrado, fondo neutro]`.
- **R5.** Una frase sobre el sesgo de atenuación por error en el regresor A_dev.
- **R6.** Repositorio con DOI (Zenodo), incluyendo espectros crudos y blancos sucesivos; fabricante y lote de los colorantes alimentarios; muestreo nativo en nm/píxel.

## FORMATO DE TU RESPUESTA

1. **El LaTeX completo revisado**, compilable, con los marcadores en negrita.
2. **Una tabla de trazabilidad** con las columnas: Cambio (C1–C6, R1–R6) | Dónde | Qué se hizo | Estado (Hecho / Pendiente del autor / Pendiente de reanálisis).
3. **El código y los resultados de cada reanálisis** que ejecutes, incluidos los valores de γ y s si ajustas el modelo de C1.
4. **Una lista priorizada** de lo que el autor debe medir: C5b, luego C5c, luego C2b.
5. **El número de páginas** del PDF compilado.
