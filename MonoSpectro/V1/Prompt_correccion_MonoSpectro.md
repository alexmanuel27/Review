# PROMPT DE CORRECCIÓN — MonoSpectro (IEEE Sensors Letters)

Copia todo lo que sigue y pégalo en la IA, adjuntando el código LaTeX del manuscrito. Si quieres que haga los reanálisis, adjunta también el repositorio con los datos.

---

## CONTEXTO

Eres coautor técnico y editor de un manuscrito que se enviará a **IEEE Sensors Letters**. Límite: **4 páginas, incluidas las referencias**. Te adjunto:

- el código LaTeX de la *letter* «Absorbance Spectrophotometry on a Monochrome Camera»,
- opcionalmente, el repositorio con datos y scripts (github.com/alexmanuel27/MonoSpectro).

El trabajo presenta MonoSpectro, un espectrofotómetro de bajo coste (cámara OV9281 monocroma, red de 1000 líneas/mm, lámpara halógena de 10 W y Raspberry Pi 4), y una transferencia de calibración de 4 coeficientes: A_ref = a(λ)·A_dev + b(λ), con a y b lineales en λ. El modelo se ajusta con 9 colorantes alimentarios y se valida con 4 colorantes sintéticos (azul de metileno, rodamina B, azul de bromotimol y rojo Congo).

Un revisor ha recomendado **revisión mayor**. Tu tarea es aplicar los cambios de abajo para que el artículo sea aceptable.

## REGLAS ESTRICTAS (léelas antes de empezar)

1. **No inventes nada.** No inventes datos, valores numéricos, resultados, figuras, citas bibliográficas ni detalles experimentales. Cualquier número nuevo debe salir de un cálculo que hayas ejecutado sobre los datos del repositorio, o quedar como marcador.
2. Si un cambio requiere un **experimento o una medida nueva**, no redactes resultados. Inserta en el LaTeX un marcador visible, `\textbf{[REQUIERE AL AUTOR: descripción exacta de lo que falta]}`, y redacta el texto que lo rodea con los valores pendientes como `[X]`.
3. Si un cambio requiere un **reanálisis con datos existentes** y tienes acceso al repositorio, ejecútalo y reporta el código y los resultados. Si no tienes acceso, usa el marcador `[REANÁLISIS PENDIENTE: …]`.
4. Escribe todo el texto del manuscrito en **inglés técnico**, con el estilo IEEE, y conserva la voz y la estructura originales salvo donde se indique.
5. Respeta el límite de 4 páginas. Para compensar lo que añadas, condensa la Sec. II y la discusión, y lleva los detalles secundarios al material suplementario.
6. No cambies la lista de autores ni las afiliaciones, salvo para renumerarlas por orden de aparición.

## CAMBIOS OBLIGATORIOS (bloquean la aceptación)

### C1. Corregir la justificación física del modelo e investigar la no linealidad
- **Dónde:** Sec. III, primer párrafo; Sec. II, párrafo que empieza «The sensor is read at 1280 × 720 and 8 bits».
- **Problema:** el texto atribuye la desviación a la respuesta espectral del detector y a la transmisión de la óptica. Ambas se cancelan en A = log₁₀(I₀/I). Una ganancia de 2–4,5 (Fig. 2) indica una no linealidad de la adquisición: curva tonal del ISP si se usa el stream procesado de picamera2, nivel de negro u oscuro no restado, luz que no atraviesa la cubeta, o exposición y ganancia automáticas.
- **Acción:**
  - (a) Reescribe el párrafo con una justificación físicamente correcta. Las causas admisibles de un error de escala en absorbancia son: no linealidad del detector o del procesado, offset de oscuro, luz parásita, ancho de banda finito y error en el eje de longitud de onda.
  - (b) Añade en la Sec. II una frase que indique el stream usado (RAW o procesado), si la exposición y la ganancia son fijas, y si se resta un fotograma oscuro: `[REQUIERE AL AUTOR: confirmar stream, exposición, ganancia y resta de oscuro]`.
  - (c) Reanálisis: grafica A_dev frente a A_ref en 450, 550, 650 y 750 nm con las 9 muestras de calibración, y reporta en una frase si la relación es lineal o curva.
  - (d) Marca `[REQUIERE AL AUTOR: prueba de linealidad del detector con serie de exposiciones o filtros ND; si no es lineal, repetir las medidas en RAW de 10 bits con resta de oscuro]`.
- **Hecho cuando:** la Sec. III no afirma que la respuesta del detector o la transmisión de la óptica causen un error de escala en absorbancia, y la Sec. II documenta la adquisición completa.

### C2. Eliminar la fuga de información hacia el conjunto de validación
- **Dónde:** Sec. III, frases «The window is 45 nm, the narrowest at which the validation error stops decreasing» y «Higher degrees scored marginally better in cross-validation… and then did worse on the validation set».
- **Acción:** reselecciona la ventana de suavizado, el orden de Savitzky–Golay, el grado del modelo y el rango espectral usando solo validación cruzada *leave-one-out* dentro de las 9 muestras de calibración. Evalúa una única vez sobre los 4 colorantes de validación. Añade además una validación *leave-one-dye-out* sobre las 13 soluciones y reporta media ± desviación estándar. Actualiza el *abstract*, la Tabla I y el texto con las cifras nuevas.
- **Hecho cuando:** ninguna frase del manuscrito dice que un hiperparámetro se eligió o se confirmó con el conjunto de validación.

### C3. Resolver la contradicción en la descomposición de la mejora
- **Dónde:** Sec. V, primer párrafo, frase «Input smoothing alone accounts for about two thirds of that gain, and the nonnegativity constraint for the rest».
- **Acción:** calcula una ablación con estas filas y añádela a la Tabla I o a una tabla nueva:
  - (a) sin corrección;
  - (b) solo suavizado;
  - (c) solo ganancia y offset;
  - (d) suavizado + ganancia y offset;
  - (e) lo anterior + recorte de negativos.

  Reescribe la frase con la contribución real de cada paso.
- **Hecho cuando:** los porcentajes atribuidos a cada paso suman la mejora total y son coherentes con la tabla.

### C4. Demostrar, o reformular, que «4 coeficientes es lo que permite generalizar»
- **Dónde:** *abstract*, última frase antes de «All hardware designs…»; Sec. III; Tabla I; Sec. VI.
- **Acción:**
  - Con el protocolo de C2, compara estos modelos:
    - (i) ganancia escalar (1 coeficiente);
    - (ii) ganancia y offset constantes (2; corrección slope/bias, ref. [21]);
    - (iii) ganancia lineal sin offset (2);
    - (iv) el modelo propuesto (4);
    - (v) grados 2 y 3;
    - (vi) ajuste por longitud de onda con regularización ridge o suavizado posterior.
  - Reporta el RMSE medio con IC del 95 % por bootstrap sobre los colorantes, o la desviación estándar *leave-one-dye-out*.
  - Aclara si la versión «per wavelength» actual se suavizó.
  - Si el modelo de 4 coeficientes no es significativamente mejor que (i) o (ii), cambia la afirmación a algo del tipo «a low-dimensional correction (≤ 4 coefficients) suffices», y no afirmes que el grado 1 es necesario.
- **Hecho cuando:** cada afirmación comparativa del *abstract* y de la conclusión está respaldada por una fila de la tabla con incertidumbre.

### C5. Añadir la caracterización metrológica mínima
- **Dónde:** nueva subsección breve o tabla «Instrument performance», al final de la Sec. IV o al principio de la Sec. V.
- **Acción:** crea una tabla con estas filas y valores `[X]`:
  - exactitud de longitud de onda (nm);
  - ancho de banda espectral, FWHM (nm);
  - rango lineal y R² de Beer–Lambert para un colorante;
  - repetibilidad (desviación estándar entre n ≥ 3 preparaciones);
  - ruido fotométrico (UA);
  - luz parásita (%);
  - límite de detección.

  Marca cada fila como `[REQUIERE AL AUTOR: experimento correspondiente]`. Corrige además la contradicción entre «records the position… of every band» (Sec. IV) y «every band maximum lies within 18 nm» (Sec. V). Reporta el desplazamiento del máximo por colorante.
- **Hecho cuando:** la tabla existe y todas sus filas están completas o marcadas para el autor.

### C6. Corregir los problemas de las muestras
- **Dónde:** Sec. IV.
- **Acción:**
  - (a) Inserta `[REQUIERE AL AUTOR: verificar concentraciones de azul de metileno y rodamina B]`. Con ε₆₆₄ ≈ 7,4 × 10⁴ M⁻¹cm⁻¹, 11 mg/L de azul de metileno darían A ≈ 2,2–2,5, pero la referencia muestra ≈ 0,55. Con ε ≈ 0,9–1,1 × 10⁵ M⁻¹cm⁻¹, 14 mg/L de rodamina B darían A ≈ 2,5–3, pero la referencia muestra ≈ 1,5. Hay que explicar la causa: pureza, dimerización, adsorción o una dilución no descrita.
  - (b) Indica el pH o el tampón del azul de bromotimol, o elimina «in its acid form»: `[REQUIERE AL AUTOR]`.
  - (c) Documenta el tipo de cubeta del instrumento de referencia y el tiempo entre las medidas en ambos equipos.
  - (d) Comenta la línea base de ~0,1 UA de la referencia por encima de 650 nm en el rojo Congo y el bromotimol (Fig. 3), si se confirma.
  - (e) Identifica los colorantes alimentarios por fabricante y lote, además del ASIN.
- **Hecho cuando:** las concentraciones declaradas son coherentes con las absorbancias mostradas o la discrepancia está explicada en el texto.

### C7. No alterar la referencia ni la métrica con el preprocesamiento
- **Dónde:** Sec. III, último párrafo; Sec. V.
- **Acción:**
  - Evalúa siempre contra el espectro de referencia sin suavizar.
  - Indica el orden del polinomio de Savitzky–Golay.
  - Reporta como resultado principal los valores sin recortar a cero. El recorte puede mencionarse como opción de visualización, con su efecto cuantificado.
  - Cuantifica la reducción de altura de pico que produce el suavizado en el azul de metileno.
- **Hecho cuando:** la Tabla I refleja resultados sin recorte y frente a la referencia cruda.

### C8. Ajustar las afirmaciones a la evidencia
- **Dónde:** título, Introducción (párrafo 1), Sec. VI.
- **Acción:**
  - Cambia el título para que refleje la contribución. Por ejemplo: «A Four-Coefficient Calibration Transfer for a Low-Cost Monochrome-Camera Absorbance Spectrophotometer», ajustándolo a lo que resulte de C4.
  - Suprime o matiza «practical reference for field measurements» y «reused across units»: solo hay una unidad y ningún ensayo de campo.
  - Mantén la motivación de campo como perspectiva de futuro.
  - Añade una frase de novedad explícita frente a la corrección slope/bias [21] y frente a [23].
- **Hecho cuando:** ninguna afirmación de la Conclusión requiere datos que no estén en el artículo.

### C9. Cumplimiento editorial
- **Acción:**
  - (a) Reduce el manuscrito a 4 páginas, incluidas las referencias.
  - (b) Describe en 2–3 frases la calibración píxel→λ en lugar de remitir solo a [23], que es un «manuscript in preparation».
  - (c) Completa la sección de agradecimientos (financiación) o elimínala: `[REQUIERE AL AUTOR: fuentes de financiación y, si aplica, declaración de uso de IA según la política IEEE]`.
  - (d) Unifica la descripción de la carcasa: la Sec. II dice «opaque enclosure» y la Sec. V dice «open enclosure». Añade `[REQUIERE AL AUTOR: sustituir Fig. 1b por una foto nítida del prototipo cerrado]`.
- **Hecho cuando:** el PDF compilado ocupa ≤ 4 páginas y no hay secciones vacías ni contradicciones.

## CAMBIOS RECOMENDADOS (no bloqueantes, pero mejoran las opciones)

- **R1.** Sustituir «written in a Chebyshev basis because it remains numerically well conditioned» por «with wavelength centred and scaled to [−1, 1]», y eliminar la cita [25].
- **R2.** Definir el «pooled R²» y advertir que los 1444 puntos están autocorrelacionados. Indicar el muestreo nativo en nm/píxel.
- **R3.** Mencionar el sesgo de atenuación por errores en la variable A_dev, o usar mínimos cuadrados totales.
- **R4.** Reportar las cuentas de I₀ o el SNR por longitud de onda, justificar el uso de 8 bits (el OV9281 admite RAW de 10 bits) y justificar el límite de 780 nm, teniendo en cuenta el solapamiento con el segundo orden por encima de ~760 nm sin filtro de orden.
- **R5.** Fig. 3: añadir paneles de residuos y la curva «per wavelength». Tabla I: añadir la desviación estándar, el error en λmax y el desplazamiento del máximo.
- **R6.** Verificar el número de catálogo de Edmund Optics (el formato habitual es XX-XXX) y citar la fuente de «±0.002 photometric accuracy».
- **R7.** Escribir «1000 lines/mm» en vez de «1000 mm⁻¹», renumerar las afiliaciones por orden de aparición, añadir la lista de materiales con precios al material suplementario y archivar el repositorio con DOI (Zenodo), incluyendo los espectros crudos de ambos instrumentos.
- **R8.** Añadir literatura sobre linealidad y datos RAW en cámaras (por ejemplo, Burggraaff et al., *Opt. Express* 27(14), 2019) y trabajos recientes de transferencia de calibración con pocos patrones. Verifica cada referencia antes de añadirla y no inventes ninguna.
- **R9.** Explicar cómo se controló la temperatura de 25 °C.

## FORMATO DE TU RESPUESTA

1. **El LaTeX completo revisado**, compilable, con los marcadores `[REQUIERE AL AUTOR: …]` y `[REANÁLISIS PENDIENTE: …]` resaltados en negrita.
2. **Una tabla de trazabilidad** con las columnas: Cambio (C1…C9, R1…R9) | Sección/línea modificada | Qué se hizo | Estado (Hecho / Pendiente del autor / Pendiente de reanálisis).
3. **Si ejecutaste reanálisis:** el código usado y las cifras resultantes, sin redondeos engañosos.
4. **Una lista final** de todo lo que el autor debe medir o confirmar, ordenada por prioridad. C1 va primero, porque puede cambiar todos los resultados.
5. **El número de páginas** del PDF compilado.
