# Informe de cambios — FocalReview V1

**Manuscrito:** *Low-Cost Spectrophotometers: Architectures, Calibration, Validation, and Reproducibility* (Rivera-Rivera, Martinez-Ortiz, Quitin, Terwagne, Nicolis, Altshuler y Campo)
**Revista objetivo:** Applied Spectroscopy (Sage/SAS), tipo *Focal Point Review*
**Recibido:** paquete LaTeX «V10» (versión interna de los autores), 2026-11-07. En el registro es la **V1**.
**Entregables:** fuente LaTeX corregido + PDF, diff, figuras en TIFF, borrador del resumen gráfico, este informe, hoja de estilo y pendientes.

---

## 1. Resumen ejecutivo

El manuscrito llega muy pulido: redacción clara, limitaciones bien declaradas y cifras coherentes. Comprobé todo lo que se puede comprobar:
- las sumas de la Tabla II por familia y por aplicación (las 16 columnas cuadran con n = 111);
- los porcentajes del resumen y de las conclusiones (46 %, 47 %, 27 %, 79 %, 54 %);
- los n de la Fig. 6 (33, 903 y 1710, es decir n_λ × 3);
- N_c (22, 38 y 18, es decir 2 × canales o 2 × (grado + 1));
- los costes de la Fig. 7, convertidos al tipo de cambio declarado;
- el 17 % del ejemplo del sulfato de cobre.

Solo apareció **un error de cifras**: el texto y la Fig. 1 decían 136 documentos (111 + 25), pero la bibliografía tiene 138 entradas, todas citadas. Alex confirmó que son 138 = 111 + 27 (15 + 7 + 5) y lo he corregido.

Cambios aplicados:
- **Formato Applied Spectroscopy:** coma serial ACS en todo el texto; fabricante entre paréntesis en la primera mención de cada instrumento; ningún párrafo empieza ya con abreviatura; la ecuación va sin puntuación final y se cita como «Eq. 1»; las palabras clave pasan de 5 a 8, con las formas desarrollada y abreviada.
- **Resumen:** reescrito sin frase introductoria (lo pide la guía), con la cifra exacta de estudios y el rango espectral de las RMSD.
- **Métodos:** declaración de cómo se codificaron los estudios; declaración explícita de que las absorbancias de referencia > 2,5 (limón y rosa) se mantuvieron en el ajuste; umbral de exclusión aclarado como absorbancia medida.
- **Figuras:** Fig. 1 rehecha; figuras exportadas a TIFF a la resolución de la revista; borrador del resumen gráfico, que la revista exige.

**Estimación honesta:** hoy un árbitro de Applied Spectroscopy pediría **revisión menor a mayor acotada**. Lo de fondo que queda:
- **(a) Cribado sin cifras:** no hay diagrama con las cifras del cribado (de 2114 registros a 111 estudios) ni lista de verificación EQUATOR/PRISMA-ScR, que Sage pide subir.
- **(b) Datos sin publicar:** la tabla de codificación y los espectros siguen «bajo petición» (decisión de Alex; riesgo anotado).
- **(c) Extensión corta:** unas 9300 palabras, frente a las 15 000–20 000 que la revista indica como habituales para un *Focal Point*.

Nada de esto lo puedo resolver sin datos o decisiones de los autores (ver §4).

---

## 2. Cambios aplicados

### 2.1 Ciencia, integridad y encuadre

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| §Literature search, párr. 1; pie y figura 1 | «136 documents: 111 … and 25 supporting … five are additional contextual» | «138 documents: 111 … and 27 supporting … seven are additional contextual» | La bibliografía tiene 138 entradas, todas citadas. Alex confirmó 27 de apoyo (15 + 7 + 5). Fig. 1 regenerada (script en `scripts/prisma.py`) |
| §Literature search, último párr. | (sin descripción de la codificación) | «One author extracted the data and coded each study, and a second author checked the coding; disagreements were resolved by discussion.» | Un árbitro de una revisión con recuentos lo pide siempre. Texto confirmado por Alex |
| §Preparation of the dye solutions | «…beyond the range over which the photometric accuracy of the reference is specified.» | «…is specified; these values were retained in the calibration fits.» | Por el procedimiento declarado (solo se excluye s > 5; A y C usan 8 pares en todo el rango), esos valores entraron en el ajuste. Ahora se declara |
| §Absorbance calibration | «absorbance values above 5 were automatically excluded» | «measured absorbances above 5 were excluded automatically» | Ambiguo: el umbral se aplica a la absorbancia medida (el caso navy en B lo confirma) |
| §Results, párr. 1 | «Calibration stretched the initially compressed responses, especially those of systems A and C.» | «…; such compression is consistent with stray light and with broad effective bandwidths, neither of which we measured.» | Anticipa la pregunta obvia sobre las ganancias grandes de A y C, sin afirmar más de lo medido |
| Resumen | «more than one hundred device studies published since 2012» | «111 studies, published from 2012 onward, that describe low-cost ultraviolet, visible, or near-infrared spectrophotometers» | Cifra exacta y alcance. Sin frase introductoria (la guía lo pide) |
| Resumen | RMSD sin rango | «…absorbance differences over 400–700 nm were 0.281, 0.077, and 0.094» | El rango define la métrica (Tabla III) |
| Conclusiones | «The examination of more than one hundred published studies … low-cost spectroscopy» | «Our analysis of 111 published studies … low-cost spectrophotometry» | Coherencia con el resumen y con el alcance (absorbancia/reflectancia) |
| Data availability | «C used the Theremino Spectrometer software.» | «System C was operated with the Theremino Spectrometer software.[ref]» | Frase completa y con su cita |
| Declaración de IA | «…and reviewing the language.» | «…and reviewing and editing the language.» | Refleja la edición hecha en esta revisión. **Si usáis el borrador del resumen gráfico, añadid «and drafting the graphical abstract».** |

### 2.2 Formato de Applied Spectroscopy

| Ubicación | Cambio | Regla |
|---|---|---|
| Todo el texto, tablas y pies | Coma serial (A, B, and C; …, and …) en todas las enumeraciones | La revista sigue el ACS Style Guide |
| Primera mención de cada equipo | Genesys 30 (Thermo Fisher Scientific); C12880MA (Hamamatsu Photonics); AS7262/AS7263/AS7265x (ams OSRAM); SparkFun Triad (SparkFun Electronics); BH1750 (ROHM Semiconductor); ESP32 (Espressif Systems); Raspberry Pi 4B (Raspberry Pi Ltd); USB2000+ (Ocean Optics); Cary 60 (Agilent Technologies); Pocket Spectroscope (Paton Hawksley Education) | «Give manufacturer names in parentheses» |
| 3 párrafos que empezaban por «LED…» | «When an assay needs only one or a few bands, LEDs are…»; «The output of an LED also changes…»; «Instruments built around LEDs keep the optics…» | «Do not start a paragraph with an abbreviation» |
| Ec. 1 | Quitada la coma final; variables descritas justo después, incluido λ; referencia en el texto como «Eq. 1» | Normas de ecuaciones de la revista |
| CV en métodos | `CV=100 SD/A` en cursiva matemática → siglas en redonda (`\mathrm{CV}`, `\mathrm{SD}`) | Siglas, no variables |
| Palabras clave | 5 → 8: «Low-cost spectrophotometry; Open-source instrumentation; Ultraviolet–visible spectroscopy; UV–Vis spectroscopy; Multispectral sensors; Absorbance calibration; Method validation; Reproducibility» | 4–10 términos, con la forma desarrollada y la abreviada |
| Tabla IV (cabecera) | «A, B and C» → «Systems A–C» | Claridad |
| «B gave…» / «C had…» | «System B gave…» / «System C had…» | Evitar empezar frase con una letra suelta |
| Pie de la Fig. 5 | «(a) reference» → «(a) reference spectrophotometer (Genesys 30)» | El panel está rotulado «Commercial (Genesys 30)»; ahora pie y figura casan |
| Bibliografía | O’Grady con apóstrofo tipográfico → O'Grady; Eurachem con campo *publisher* | Avisos de BibTeX y render consistente |

### 2.3 Redacción (cambios relevantes; el resto, en el diff)

| Ubicación | Antes | Después |
|---|---|---|
| Resumen, cierre | «We close with a reporting checklist intended to help readers judge whether a low-cost instrument suits a given application, and to help others rebuild it.» | «We close with an application-dependent reporting checklist intended to help readers judge whether a low-cost instrument suits a given measurement and to help others rebuild it.» |
| §Control and acquisition | «…an open-hardware ESP32 environmental data logger combines on one board.» | «…an open-hardware environmental data logger based on the ESP32 microcontroller (Espressif Systems) combines on one board.» |
| §Implementation and cost | «…do not cover the same things as the retail price…» | «…do not cover the same items as the retail price…» |
| §Reading reported costs | «a list of exclusions, assembly and calibration services, and recurring expenses» | «a list of exclusions, the cost of assembly and calibration, and recurring expenses» |
| Tabla I, fila R² | «Calculation, calibration or evaluation set, sample number and range» | «Calculation method; calibration or evaluation set; sample number and range» |
| §Applications, párr. 1 | enumeración ambigua con «and» internos | separada con punto y coma: «environmental monitoring; agriculture and food; biomedical testing; …» |
| §Choosing an architecture | «…while resolved spectra reveal…» | «…whereas resolved spectra reveal…» (contraste, estilo ACS) |
| §System A | «Absorbance was calculated from the logarithm of the ratio…» | «…as the base-10 logarithm of the ratio…» |

El texto original ya era natural y preciso. No reescribí párrafos que no lo necesitaban, para no introducir cambios sin beneficio.

### 2.4 Figuras y archivos de envío

- **Fig. 1** rehecha con 138/27/7, mismo diseño y tipografía (vector PDF + TIFF).
- **TIFF para el envío** (`figuras_envio/`): Figs. 1, 2, 6 y 7 a 600 ppi desde el vector (dibujo lineal, mínimo de la revista); Figs. 3–5 a 300 ppi (fotos y gráficos raster; mínimo 200 ppi). La guía dice que no se envíen PDF de figuras en la primera entrega.
- **Resumen gráfico (borrador)**: `Graphical_abstract_draft.tif/.png`, 300 ppi. A la izquierda, los recuentos de la Tabla II (% de 111); a la derecha, la Fig. 6 con las RMSD. Solo usa datos del propio manuscrito. Script en `scripts/ga.py`.

### 2.5 Comprobaciones hechas

- **Cifras:** comparé todas las cifras del texto original con las del corregido. Solo cambian 136 → 138 y 25 → 27 (decisión de nivel 2). Las cifras añadidas (111, 400–700, «base-10», «Genesys 30») ya estaban en el manuscrito.
- **Compilación:** sin referencias indefinidas; 56 páginas a doble espacio con números de línea.
- **Referencias:** las 132 entradas con DOI se verificaron contra OpenAlex. Las 132 existen; título, primer autor y año coinciden (las dos alertas, O'Grady y Martínez-Aviñó, eran falsos positivos por tildes o apóstrofos). Las 6 entradas sin DOI son documentación técnica (especificaciones del Genesys 30, hoja de datos del AS7265x, PySpectrometer2, Theremino, Paton Hawksley) y la guía Eurachem.
- **Contenido de las citas** (cada cifra frente a la fuente), muestreado en las afirmaciones más específicas: Keresteš 2023 (picos 458/520/630 nm, FWHM 33/27/17 nm, ensayo de Ellman a 412 nm «imitado por color»), Prairie 2020 (65,2 % y 67,0 %; 63 USD), Stevens 2024 (USD 70 por placa; calibración en mL, evaluación frente a CE, modelos distintos por sensor) y Tran 2020 (48 muestras de predicción; R²p 0,852/0,876; RMSEP 0,416/0,398 °Brix). Todas correctas. Los 13 019,59 y 36 185,52 *counts* de Stevens están en una tabla en imagen que no pude leer.

### 2.6 Pasada de humanización (petición de Alex, 2026-11-07)

Segunda reescritura completa de la prosa para que suene a investigadores escribiendo y no a texto generado. **Sin cambios de contenido** (instrucción expresa de Alex): mismas afirmaciones, cifras, matices, citas y estructura.

- **Qué cambia:** ritmo y longitud de frase variados; frases largas con varias enumeraciones partidas en dos; conectores menos mecánicos («Broadly, the calibrations we found do one of three jobs», «Selectivity is another matter», «What these studies do not offer is a single best design»); voz de los autores en primera persona del plural donde es natural («we still do not know how the instrument does on new samples», «we were unable to separate»); menos fórmulas repetidas del tipo «X does not… nor…» y «Each of these…».
- **Qué no cambia:** tablas de datos (I–IV) y sus notas; pies de figura; declaraciones (financiación, contribuciones, IA, disponibilidad de datos); ecuación; etiquetas y referencias cruzadas.
- **Comprobación automática** frente a la versión anterior, archivo por archivo: mismo conjunto de cifras, mismas 406 llamadas a cita en el mismo orden (la numeración de las referencias no varía), mismas etiquetas y referencias cruzadas, tablas idénticas carácter a carácter. Compila sin referencias indefinidas (56 páginas).
- **Términos técnicos protegidos:** se mantuvieron «stray light» frente a «unwanted light», «insensitive to a constant bias» y «located the main absorption bands» donde una paráfrasis coloquial habría cambiado el matiz.
- **Ojo:** en las tablas 2.1–2.3, la columna «Después» muestra el texto de la primera pasada; varias de esas frases cambiaron de redacción (no de contenido) en esta segunda. La redacción final está en el diff.
- **Diffs:** `FocalReview_V1_diff_humanizacion.pdf` (solo esta pasada) y `FocalReview_V1_diff.pdf` (original recibido → versión final).

---

## 3. Decisiones de nivel 2

| Pregunta | Decisión de Alex | Qué se hizo |
|---|---|---|
| ¿Cómo se codificaron los 111 estudios? | Un autor codificó y otro revisó | Frase añadida en §Literature search |
| ¿Publicar la tabla de codificación, las consultas y cribado, y los espectros con el script? | **No; mantener «bajo petición»** | Sin cambios. Riesgo en §5 |
| 136 frente a 138 documentos | 27 de apoyo: 15 de la búsqueda + **7 contextuales** + 5 técnicos | Texto, pie y Fig. 1 corregidos |
| Resumen gráfico | Sí, preparar borrador | Hecho (§2.4) |

---

## 4. Pendientes de nivel 3 (para los autores)

Detalle e instrucciones en `Pendientes_autor_FocalReview_V1.md`. Resumen:

| # | Pendiente | Por qué no lo puedo hacer | Criterio de «hecho» |
|---|---|---|---|
| A1 | Cifras del cribado (registros tras deduplicar, cribados por título y resumen, textos completos evaluados, excluidos con motivo) en la Fig. 1 o en el texto, y lista PRISMA-ScR (EQUATOR, que Sage pide subir) | Requiere los registros de cribado | Fig. 1 con el flujo 789 + 1325 → … → 111 y lista PRISMA-ScR rellenada |
| A2 | Sensibilidad de la calibración a A_ref > 2,5 (limón 2,85, rosa 2,68): repetir sin esos puntos y decir si cambian las RMSD de la Tabla III | Requiere los datos y el script | Una frase con las RMSD sin esos puntos (o «differed by < x») |
| A3 | Sistema A frente a la referencia convolucionada con la respuesta nominal (gaussiana de 20 nm FWHM) para separar el efecto del ancho de banda | Requiere los espectros de referencia | RMSD de A frente a la referencia convolucionada, en una frase o en suplemento |
| A4 | Datos de métodos: modelo de cámara de B (Pi Camera v1.3/v2/v3/HQ) y sensor del webcam de C; versiones de PySpectrometer2 y Theremino; paso de barrido del Genesys 30; número de lecturas de los colorantes de calibración; fabricante o vendedor del Little Garden | Solo los autores lo saben | Fila «Optical design» de la Tabla IV pasa a «Yes» |
| A5 | Fig. 7: espacio en blanco entre ejes y leyenda, y etiqueta «Other designs» cortada a la derecha. Fig. 5: rótulo del panel (a) «Commercial» → «Reference» | Requiere los scripts de las figuras | Figuras regeneradas sin recortes |
| A6 | Extensión: ~9300 palabras frente a las 15 000–20 000 habituales en un *Focal Point*. Confirmarlo con el editor (si fue una propuesta invitada) y decirlo en la carta | Decisión editorial | Respuesta del editor o mención en la carta de presentación |
| A7 | Compilar con newtx (aquí se compiló con mathptmx, equivalente Times) y revisar el borrador del resumen gráfico | Fuente no instalada aquí | PDF final con newtx; resumen gráfico aprobado |

---

## 5. Comentarios confidenciales al editor y riesgos

- **Datos «bajo petición»:** la contribución cuantitativa principal (Tabla II) no se puede reproducir sin la tabla de codificación. Es la objeción más probable de un árbitro y la más barata de resolver. Mi recomendación sigue siendo publicarla como suplemento (< 10 MB).
- **Validación débil del caso de estudio:** los colorantes de validación son de la misma familia que los de calibración (azul ≈ teal), con una sola unidad por sistema y los sistemas ya no disponibles. Está bien declarado, y el texto presenta el caso como ilustración, no como ranking.
- **Calibración de B:** un polinomio de grado 18 para la ganancia y el offset, con 8 colorantes. Lo eligió la validación cruzada dejando un colorante fuera, y la validación queda fuera de la selección. Un árbitro puede pedir la curva de error frente al grado; tenerla preparada.
- **Mapas de longitud de onda sin grados de libertad residuales:** declarado. Si existe alguna medida con una línea adicional (p. ej., Hg 579,1 nm o la lámpara CFL), dar el residuo.
- **Fila «Systems A–C (this work)» de la Tabla II:** junta autoevaluación y recuentos de la literatura. Es aceptable porque el pie aclara el criterio (colorantes preparados ≠ matriz real), pero algún árbitro puede pedir que pase solo a la Tabla IV.

## 6. Nota de coherencia con otros manuscritos de Alex (no forma parte del envío)

El sistema A (AS7265x + ESP32, Fab Lab ULB / Cuban Water Lab) y el proyecto ARES de bahías cubanas aparecen también en el Comment ChlaComment (prototipo AS7265x). Si ambos se publican, conviene que las descripciones del sensor (18 canales, 410–940 nm, ~20 nm FWHM) y el repositorio citado coincidan.

---

*Herramientas:* lectura completa del LaTeX y de las 7 figuras; compilación pdflatex + BibTeX (con mathptmx en lugar de newtx, que falta en este entorno); verificación de las 132 referencias con DOI contra OpenAlex (plugin reference-lookup); búsqueda web de la guía de Applied Spectroscopy (s-a-s.org y Sage) y de 4 fuentes citadas; comprobación automática de cifras entre versiones; diff palabra a palabra (sin latexdiff, que no está instalado). Las skills de revisión, citas y corrección de estilo se aplicaron siguiendo su método, pero no se invocaron una a una. **No verificado:** el contenido de las otras ~128 citas frente a su frase; las cifras internas del caso de estudio que dependen de los datos (RMSD, SD, CV, cocientes por debajo y por encima de 480 nm); el acceso a la carpeta Review y al vault, que el sistema denegó.
