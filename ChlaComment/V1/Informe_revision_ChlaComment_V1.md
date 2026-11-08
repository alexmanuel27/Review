# Informe de revisión — ChlaComment V1

**Manuscrito:** *Comment on "Portable Multispectral Fluorometer with Embedded Machine Learning for Chlorophyll-a Estimation in Acetone-Extracted Samples"* (Martinez-Ortiz, Rivera-Rivera, Altshuler). Archivo recibido: `Version1.docx` (816 palabras incluidos título, afiliaciones, pie de figura y referencia).
**Artículo comentado:** Blanco-Jáquez et al., *Sensors* 2026, 26, 4086, doi:10.3390/s26134086 (leído completo, 23 páginas, figuras y tablas incluidas).
**Revista objetivo:** *Sensors* (MDPI), tipo de artículo *Comment*.
**Fecha:** 22-10-2026. **Versión:** V1 (primera entrega de este trabajo).

> Lectura hecha dentro del proyecto por una IA; no es una revisión externa. Alex es coautor del Comment, así que la revisión se escribe como si la hiciera un árbitro de la revista, pero va dirigida a los autores del Comment.

---

## 1. Resumen del trabajo y contribución declarada

El Comment plantea dos cuestiones sobre el fluorómetro de Blanco-Jáquez et al. (1) Todos los modelos del *benchmark* usan las mismas 24 entradas espectrales, de modo que el artículo compara algoritmos pero no muestra cuánto aporta el conjunto completo de canales; se propone comparar con subconjuntos reducidos y físicamente justificados, entre ellos una línea base en el rojo. (2) Se pide acceso a los datos por muestra y por canal para que los lectores puedan examinar las respuestas. Se añade una figura con medidas de un prototipo propio (AS7265x) que, según el pie, no es comparable con el sistema del artículo.

## 2. Evaluación general

**Pertinencia.** Las dos preguntas son legítimas y se apoyan en hechos del artículo. Lo he comprobado en el original: la sección 2.6 dice que los 24 canales se usaron como predictores en los cinco modelos y que el modelo final los conservó todos «rather than introducing an additional custom feature-screening step». La Declaración de Disponibilidad de Datos dice «available on request from the corresponding author» (p. 21). Ninguna afirmación del Comment sobre el artículo es falsa.

**Debilidad principal.** Tal como está escrito, el Comment *pide* análisis, pero no *demuestra* por qué importan. No cita ninguna sección, tabla ni cifra del artículo (aparte de «24»). Además, cada propuesta va seguida de una cautela («does not imply…», «without presupposing…», «where scientifically appropriate»). Según la política de MDPI, un Comment es una carta para «publicly question a specific paper» y debe tratar «significant aspects of the paper». Un editor puede leer la versión actual como una sugerencia de lector que no justifica su publicación. Sin embargo, el propio artículo contiene la evidencia que hace falta (Tabla 1, Tabla 3, secciones 3.3, 4.3 y 4.5, ecuación 2). Con ella, el Comment pasa de deseable a necesario.

**La figura** es el punto más arriesgado: procede de otro instrumento, no tiene métodos, contiene una respuesta difícil de explicar (canal de 900 nm) y puede leerse como un argumento a favor de los autores originales (véase P2).

**Valoración:** buena base, pero hoy no alcanza el umbral de un Comment publicable. Con la reescritura propuesta (texto completo en `Comment_revisado_ChlaComment_V1.docx`) sí lo alcanza.

### Afirmaciones frente a evidencia (todas las del resumen y la conclusión)

| Afirmación | Dónde | Evidencia en [1] | Veredicto | Arreglo |
|---|---|---|---|---|
| Las comparaciones evalúan algoritmos con la misma configuración de entrada | Abstract, §2 | §2.6, p. 9–10; Tabla 3 | apoyada | citar §2.6 con la cita literal |
| No está claro cuánto aportan las 24 entradas | Abstract, §2 | Ninguna ablación en [1]; ratio muestras/variables ≈3,2 reconocido en §4.5 | apoyada (razonamiento) | añadir composición de la Tabla 1 y ratio 3,2 |
| Una comparación con entradas reducidas ayudaría | Abstract, §2, §4 | — | parcial: no dice qué subconjuntos ni con qué protocolo | concretar los subconjuntos y el protocolo anidado (§3 reescrito) |
| El acceso a datos por muestra facilitaría el examen | Abstract, §3, §4 | DAS: «on request»; el equipo guarda los 24 valores (§2.4) | apoyada | citar la DAS y la política de datos de MDPI; listar qué depositar |
| «The study demonstrates the feasibility…» | Abstract, §4 | Tablas 4 y 6 | apoyada | dejar una sola vez (conclusión) |
| La figura «illustrates the type of instrumental information…» | Figura | Medidas de otro equipo sin métodos | no apoyada como argumento | eliminar o completar (P2) |

---

## 3. Problemas mayores

**P1. El argumento central no se apoya en datos del artículo comentado.**
*Ubicación:* abstract, §2 y §4. *Observación:* el texto no señala ni una sección, tabla o cifra de [1]. *Por qué importa:* sin anclaje, el editor no ve un problema; ve una sugerencia, y los autores pueden responder en una línea («elegimos conservar los 24 canales»). *Acción:* apoyar la pregunta en cinco hechos verificables de [1]:
1. §2.6: los 24 canales se usaron en todos los modelos y no hubo cribado de variables (cita literal).
2. Tabla 1: entre las 24 entradas hay tres canales con centros nominales de 405 a 425 nm, junto a la banda de excitación de 420–425 nm (AS7343 F1 y F2, AS7341 F1). También hay tres salidas de banda ancha o auxiliares: Clear, VIS y FD, que es el canal de detección de parpadeo (*flicker*). A ellas se suman dos canales NIR (855 y 910 nm) y bandas solapadas (515 nm en ambos sensores; 550–555 nm en tres canales). Solo cuatro canales (630–690 nm) caen en la región roja de emisión. Recuento comprobado: 4 + 3 + 3 + 2 + 12 restantes = 24.
3. §4.5: los autores reconocen un ratio muestras/variables de ≈3,2 (76/24 = 3,17) y riesgo de sobreajuste.
4. §3.3, §4.3 y §4.5: el sesgo positivo de 22,00 µg/L se atribuye en parte a cambios en el control de los LED de excitación entre el prototipo y el equipo final, y se propone normalización como trabajo futuro. Saber si el modelo depende de canales de emisión o de canales que siguen a la excitación decide qué corrección hace falta. Este es el vínculo más fuerte: convierte la ablación en algo útil para los propios autores.
5. Tabla 3: el mejor modelo fue el Lasso (R² = 0,994; RMSE = 32,99 µg/L), y Lasso ya selecciona variables. Basta con publicar sus coeficientes no nulos: es la respuesta más barata posible y no requiere medir nada.
*Hecho cuando:* cada afirmación del §2 cita sección o tabla de [1].

**P2. La Figura 1 no sostiene el argumento y puede volverse en contra.**
*Ubicación:* figura, encabezado y pie. *Observaciones:*
- Procede de otro sensor (AS7265x, canales de 20 nm FWHM según la hoja de datos), con geometría, excitación, disolvente, ganancia, tiempo de integración, réplicas y blanco no descritos. El pie dice que no es una comparación, así que la pregunta del editor será obvia: ¿para qué está?
- Los canales de 510, 645, 705 y 900 nm caen entre 3 y 4 veces con la concentración (lectura aproximada de la figura: 900 nm de ≈235 a ≈58 IU), con una forma casi idéntica. La Chl-a no absorbe a 900 nm (razonamiento: su banda Qy en acetona está hacia 664 nm), así que esa caída exige una explicación (¿atenuación de la excitación con fuga fuera de banda?, ¿dispersión?, ¿efecto común del sensor?). Un árbitro lo preguntará.
- El canal de 680 nm, el de la fluorescencia, es plano por debajo de ≈0,1 µg/mL y solo se duplica (≈61 → ≈127 IU) en un intervalo de concentración de ≈160 veces, mientras que los demás canales cambian más. Un lector puede concluir que los canales sin fluorescencia contienen *más* información de concentración, lo que respalda la decisión de Blanco-Jáquez et al. de usar todos los canales y debilita la «red-region baseline» que propone el propio Comment.
- Las unidades no coinciden: el eje dice «IU» y el pie «i.u.». El eje está en µg mL⁻¹ de extracto, mientras que [1] informa µg/L de agua. Quedan restos de resaltado amarillo y un rótulo duplicado («Figure 1.» como encabezado y «Fig1:» en el pie).
- Si se publica, MDPI pedirá que sus datos estén disponibles. Un Comment que pide datos y no deposita los suyos pierde autoridad.
*Acción (recomendada):* eliminar la figura (así está en la versión reescrita). *Alternativa:* mantenerla solo si (a) se añade un párrafo de métodos completo, (b) se explica la caída a 900 nm y (c) se usa con un propósito explícito: mostrar que canales fuera de la emisión cambian con la concentración por mecanismos distintos de la fluorescencia, y que por eso hace falta saber qué canales usa el modelo. En el prompt hay un texto alternativo con [REQUIERE AL AUTOR]. *Hecho cuando:* la figura no está, o tiene métodos, explicación y datos depositados.

**P3. Faltan las secciones obligatorias de MDPI.**
No hay Author Contributions, Funding, Data Availability Statement (obligatoria en *Sensors*) ni Conflicts of Interest, y falta el e-mail de correspondencia. *Conflicto de intereses:* los autores desarrollan un prototipo multiespectral propio (la figura lo muestra); conviene declararlo, porque los autores originales pueden verlo como competencia. *IA:* MDPI exige declarar el uso de IA generativa que vaya más allá de la edición superficial. *Hecho cuando:* las cuatro secciones existen y están completas.

**P4. Las propuestas de análisis son vagas y sin protocolo.**
«A smaller, physically justified selection of channels», «a red-region baseline… where scientifically appropriate» y «consistent data partitions» no permiten a los autores responder con precisión. *Acción:* (i) coeficientes Lasso y su estabilidad entre pliegues (con canales correlacionados la selección no es única); importancia por permutación del RF. (ii) Tres subconjuntos concretos: canales de emisión; un solo canal cerca de 680 nm, análogo a la banda de emisión de la fluorometría extractiva estándar (filtro de emisión de 680 nm, Welschmeyer 1994); 24 canales sin los de excitación, banda ancha y auxiliares; y además un cociente emisión/excitación como normalización interna. (iii) Selección y ajuste anidados en la validación cruzada de las 76 muestras; las 15 de validación, una sola vez; intervalos *bootstrap* de RMSE, MAE y sesgo, porque con n = 15 diferencias de pocos µg/L no se distinguen. *Hecho cuando:* §3 reescrito.

**P5 (recomendado, decisión de los autores). La variable objetivo depende de volúmenes que [1] no informa.**
El fluorómetro mide el extracto (3 mL en cubeta, §2.5), pero el modelo se entrena con Cₛ, la concentración en el agua original (ec. 2: depende del volumen filtrado, el volumen de extracto y el factor de dilución). [1] dice que se recogió 1 L, pero no qué volumen se filtró ni si fue constante. Si varió (el prefiltro se usó «to reduce premature clogging», lo que sugiere filtraciones de volumen variable), el factor extracto→agua cambia entre muestras y los espectros no pueden conocerlo. En la versión reescrita está como petición de aclaración breve dentro de §4. Si los autores no quieren ampliar el alcance, se puede borrar ese párrafo sin tocar el resto.

**P6 (opcional, decisión de los autores). Diferencia Python–ESP32 mayor de lo esperable.**
La Tabla 6 de [1] da MAE = 10,75 µg/L, RMSE = 14,81 µg/L y una diferencia máxima de 35,63 µg/L entre las predicciones de Python y del ESP32, «using the same multispectral measurements as input» (§2.7). Un bosque aleatorio exportado con micromlgen debería reproducir su origen salvo por redondeos de coma flotante cerca de los umbrales. Una MAE de un tercio del RMSE de validación (35,41 µg/L) pide explicación, y además no queda claro si la Tabla 4 usa las predicciones de Python o las del ESP32. Es un punto objetivo y breve. No lo he metido en el texto reescrito para no ampliar el alcance, pero en el prompt (R-b) está listo para añadirlo como pregunta de una frase.

## 4. Problemas menores

1. **Título:** usar el formato de MDPI para Comments: «Comment on Blanco-Jáquez et al. [título]. *Sensors* 2026, *26*, 4086». No he podido verificarlo en un Comment publicado de MDPI; confirmadlo con la oficina editorial o con un ejemplo reciente.
2. **Afiliaciones:** «1*» pone el asterisco en la afiliación; debe ir junto al autor de correspondencia y en una línea «* Correspondence: e-mail».
3. **Keywords:** errata «fluorescense». «calibration» e «instrumental response» no describen el Comment. Propuesta: *chlorophyll-a; fluorescence; multispectral sensor; machine learning; feature selection; data availability*.
4. **Repetición:** la misma idea se dice cuatro veces (abstract, introducción, §2 y conclusión). Recuento de hedges en 816 palabras: «would» ×8, «could» ×5, «complementary» ×4, «physically justified» ×3.
5. **Restos de edición:** marcas de resaltado en el título de autores, el encabezado de la figura y el pie; doble rótulo de figura.
6. **Referencia [1]:** lista «et al.» tras el tercer autor; en el estilo MDPI se listan todos los autores (8). Metadatos verificados (título, año, revista, volumen, número de artículo, DOI).
7. **Procedimiento MDPI:** según la política de ética de MDPI, el lector debe contactar primero con la Oficina Editorial; si el Comment se aprueba, pasa a revisión y se invita a los autores a responder (Reply). Es aconsejable enviar primero una carta breve al editor de *Sensors*.
8. **Extensión:** sin límite publicado; la versión reescrita tiene ≈990 palabras de cuerpo y un resumen de 171 palabras (MDPI: ≤200).
9. **Referencias nuevas** en la versión reescrita: Tibshirani 1996 (Lasso; también citado en [1]) y Welschmeyer 1994 (banda de emisión de 680 nm).

### Resultado de la comprobación de citas (citation-check)
Herramientas: `reference-lookup` (OpenAlex) y búsqueda web.

| Ref. | Dónde se usa | Real | Apoya la frase | Estilo | Nota |
|---|---|---|---|---|---|
| [1] Blanco-Jáquez 2026 | todo | verified (DOI 10.3390/s26134086, OpenAlex W7166534510) | supported (PDF leído completo) | incompleta: faltan 5 autores | https://doi.org/10.3390/s26134086 |
| [2] Tibshirani 1996 (nueva) | §3, Lasso | verified (DOI 10.1111/j.2517-6161.1996.tb02080.x) | supported: el L1 anula coeficientes (resultado clásico; artículo no abierto) | OK; páginas tomadas de la ref. 26 de [1] | — |
| [3] Welschmeyer 1994 (nueva) | §3, filtro de 680 nm | verified (DOI 10.4319/lo.1994.39.8.1985) | partial: lo confirma el SOP LG405 de la US EPA (rev. 09, 2013), «based on Welschmeyer (1994)», filtros de 436/680 nm; el artículo no se pudo abrir (fallo de carga) | página final 1992 sin verificar | comprobar en el PDF del artículo |

Huérfanas: ninguna. La versión original solo tenía [1] y se cita.

## 5. Comentarios confidenciales al editor
Los autores del Comment desarrollan un prototipo multiespectral propio; recomiendo que lo declaren en Conflicts of Interest. No hay otros asuntos de integridad.

## 6. Recomendación
**Revisión mayor.** Las dos preguntas son pertinentes y correctas, pero el texto actual no las apoya con evidencia del artículo, la figura debilita el argumento y faltan secciones obligatorias. Con los cambios P1–P4 (aplicados en la versión reescrita) recomendaría aceptarlo para enviar a los autores originales para su Reply.

**Preguntas que hará un árbitro:**
1. ¿Por qué no basta con los coeficientes del Lasso que los autores ya calcularon? (Respuesta: es justo lo que se pide primero.)
2. ¿Qué subconjunto concreto proponéis y con qué justificación física?
3. ¿Qué aporta la figura si no es comparable con el sistema de [1]?
4. ¿Por qué cae la señal a 900 nm en vuestro prototipo?
5. ¿Habéis contactado con los autores antes de enviar el Comment?

**Lo fuerte (protegerlo):** la observación de que la Tabla 3 compara algoritmos y no entradas es exacta y difícil de rebatir; el vínculo con el sesgo de transferencia de hardware la convierte en algo útil para los propios autores.

**Si cambiáis solo tres cosas:** (1) anclar el §2 en la Tabla 1, §2.6, §4.5 y el sesgo de 22,00 µg/L; (2) quitar la figura o completarla; (3) añadir las secciones obligatorias y el formato del título.

---

## 7. Revisión de redacción completa

**Nivel:** medio-alto (reescritura completa). **Variante:** inglés de EE. UU. (*normalization* ×1; ninguna forma británica). El texto completo reescrito está en `Comment_revisado_ChlaComment_V1.docx/.md`. La tabla cubre todas las frases del original; cada «texto original» está comprobado literalmente contra el .docx mediante un script.

| # | Ubicación | Texto original | Propuesta | Motivo |
|---|---|---|---|---|
| R1 | Título | Comment on “Portable Multispectral Fluorometer with       Embedded Machine Learning for Chlorophyll-a Estimation in Acetone-Extracted Samples” | Comment on Blanco-Jáquez et al. Portable Multispectral Fluorometer with Embedded Machine Learning for Chlorophyll-a Estimation in Acetone-Extracted Samples. *Sensors* 2026, *26*, 4086 | Formato de Comment de MDPI (por confirmar) e identificación completa del artículo; además, el original tiene 7 espacios seguidos entre «with» y «Embedded» |
| R2 | Afiliación 1 | 1* Center for Complex Systems | 1 Center for Complex Systems … + línea «* Correspondence: [e-mail]» | El asterisco marca al autor de correspondencia, no la afiliación |
| R3 | Abstract, frase 1 | Blanco-Jáquez et al. report a portable multispectral fluorometer integrating optical acquisition and embedded machine learning for chlorophyll-a (Chl-a) estimation in acetone-extracted samples. | Blanco-Jáquez et al. described a portable fluorometer that estimates chlorophyll-a (Chl-a) in 90% acetone extracts from the 24 channels of two multispectral sensors, using a Random Forest model that runs on an ESP32-S3 microcontroller. | Concreta qué es el sistema; el lector necesita el «24» desde la primera frase |
| R4 | Abstract, frase 2 | The study demonstrates the feasibility of combining multispectral sensing with on-device prediction. | This Comment raises two points that affect how the reported performance can be interpreted. | La valoración positiva se repetía en la introducción y en la conclusión; aquí se anuncia el contenido |
| R5 | Abstract, frase 3 | However, the extent to which the 24 spectral inputs contribute to estimation performance remains unclear, as the reported comparisons evaluate different regression algorithms using the same input configuration. | First, all models in the benchmark used the same 24 channels, so the study compares regression algorithms but not input sets. | Causa antes que consecuencia; frase más corta y verificable |
| R6 | Abstract, frase 4 | A complementary comparison with reduced-input models would help establish whether the complete set of spectral features provides a measurable advantage over a smaller, physically justified subset. | Besides the channels in the Chl-a emission region, the inputs include channels at or next to the excitation band, broadband and auxiliary outputs, and near-infrared channels. With 76 development samples, the contribution of each group of channels bears directly on the overfitting and hardware-transfer limitations that the authors themselves report. | Da la razón concreta (P1) en lugar de un condicional |
| R7 | Abstract, frase 5 | In addition, access to sample-level channel measurements would facilitate independent examination of the measured responses and their relationship with the reference Chl-a concentrations. | Second, the channel-level data are available only on request. | Hecho verificable (DAS) en vez de deseo; estructura «First/Second» |
| R8 | Abstract, frase 6 | These complementary analyses could clarify the contribution of the multispectral configuration without presupposing that a reduced-input approach would perform equally well or should replace the proposed system. | We suggest analyses that require no new measurements, namely reporting the coefficients of the Lasso model already benchmarked and comparing the full input set with reduced, physically motivated channel sets, and we ask that the sample-level data be deposited in a public repository. | Petición concreta y barata; la cautela pasa al §3 («We do not presuppose the outcome») |
| R9 | Keywords | chlorophyll-a fluorescense; multispectral sensor; calibration; instrumental response | chlorophyll-a; fluorescence; multispectral sensor; machine learning; feature selection; data availability | Errata y palabras clave que describan el Comment |
| R10 | §1, frase 1 | Blanco-Jáquez et al. [1] present a portable fluorometer combining multispectral acquisition and embedded machine learning to estimate Chl-a in acetone-extracted samples. | Blanco-Jáquez et al. [1] combined fluorescence excitation at a nominal 420–425 nm, two multispectral sensors (AS7341 and AS7343), on-device Random Forest inference and a smartphone interface in a portable instrument for Chl-a in acetone extracts. On 15 independent samples, the model reached R² = 0.979 and RMSE = 35.41 µg/L, and its predictions agreed closely with those of the original Python model (R² = 0.997). | Sitúa al lector con los datos clave de [1] (copiados de las Tablas 4 y 6); evita repetir el abstract |
| R11 | §1, frase 2 | The integration of optical sensing and on-device prediction represents a useful contribution to portable analytical instrumentation. | Integrating optical acquisition and embedded inference in a single portable device is a useful contribution to portable analytical instrumentation. | Verbo en lugar de nominalización («integration… represents») |
| R12 | §1, párrafo 2 | The present Comment focuses on two related methodological questions: the contribution of the full set of spectral inputs to estimation performance and the value of access to sample-level instrumental data for interpreting the measured responses. | This Comment addresses two related questions: how much of this performance depends on the full set of 24 spectral inputs, and which data readers need to answer that question. Both can be addressed with data that the authors already hold. | Más directo; anuncia que no hacen falta nuevas medidas |
| R13 | Título §2 | 2. Contribution of the multispectral inputs | 2. What the Benchmark Compares | Mayúsculas de título como en [1]; el título dice qué muestra la sección |
| R14 | §2, frase 1 | The authors compare several regression algorithms using the same 24 spectral features. | In Section 2.6 of [1], the 24 spectral features were used as predictors for all five regression models, and the final embedded model retained all 24 channels "rather than introducing an additional custom feature-screening step". | Ancla en [1] con cita literal (P1) |
| R15 | §2, frases 2–3 | This approach allows the evaluated algorithms to be compared under a common input configuration. However, it does not isolate the contribution of the complete set of spectral inputs relative to a reduced set of channels. | Table 3 of [1] therefore compares algorithms under a fixed input set. It does not show whether all 24 inputs are needed, or which of them the model relies on. | Señala la tabla concreta; «isolate the contribution… relative to» es abstracto |
| R16 | §2, párrafo 2, frase 1 | A complementary analysis could compare the full-input model with models using a smaller, physically justified selection of channels. | Nuevo párrafo con la composición de la Tabla 1 + §3 (ii) con subconjuntos concretos | Concreción (P1, P4) |
| R17 | §2, párrafo 2, frase 2 | A red-region baseline could also be considered where scientifically appropriate. | (ii) a single channel near 680 nm, analogous to the single emission band of standard extractive fluorometry, which uses an emission filter at 680 nm [3] | «where scientifically appropriate» no dice nada; se justifica con el método estándar |
| R18 | §2, párrafo 2, frases 3–4 | Such a comparison would not imply that a single-channel approach should replace the proposed multispectral system. Rather, it would help quantify the contribution of the additional spectral inputs to predictive performance. | We do not presuppose the outcome. If the reduced sets perform as well as the full set, the instrument and its calibration could be simplified; if the full set performs better, the comparison would quantify the advantage of the dual-sensor design. Either result would strengthen the interpretation of [1]. | La defensa se convierte en un beneficio para los autores; tono colegial sin rodeos |
| R19 | §2, párrafo 3, frase 1 | For the comparison to be informative, the alternative models should be evaluated using consistent data partitions and performance metrics, with feature selection and model tuning conducted without using the independent validation set. | All configurations should be evaluated under the same data partitions, with any channel selection and tuning nested within the cross-validation of the 76 development samples, and with the 15 validation samples used only once, for the final comparison. | Protocolo preciso (validación cruzada anidada) |
| R20 | §2, párrafo 3, frase 2 | This would help distinguish the effect of input configuration from the effect of the regression algorithm. | With 15 validation samples, RMSE differences of a few micrograms per liter may lie within sampling variability, so bootstrap confidence intervals for RMSE, MAE and bias should accompany the point estimates. | La frase original era implícita; se sustituye por un requisito estadístico necesario |
| R21 | Título §3 | 3. Access to sample-level instrumental data | 4. Access to Sample-Level Data | Numeración nueva; mayúsculas de título |
| R22 | §3, frase 1 | The article describes the acquisition and processing procedures used to obtain the model inputs. | The Data Availability Statement of [1] states that the data are available on request from the corresponding author. | El punto relevante es la DAS, no la descripción de procedimientos |
| R23 | §3, frase 2 | Access to sample-level channel measurements, together with the corresponding reference Chl-a concentrations and relevant acquisition information, would nevertheless facilitate independent examination of the spectral responses and their relationship with the predicted values. | Because the device stores the 24 spectral features of every measurement (Section 2.4 of [1]), these data already exist. Depositing them in a public repository, as MDPI's research data policy encourages, would allow readers to examine the channel responses and to repeat the analyses proposed above. | Hecho comprobable y apoyo en la política de la editorial |
| R24 | §3, párrafo 2, frase 1 | Representative channel-level data could help readers assess the information captured by the different spectral inputs and support further evaluation of full-input and reduced-input configurations. | For each sample, the most useful items are the raw and blank-corrected channel values and the replicate readings; the hardware version used (earlier prototype or final device); the reference concentration together with the filtered volume, extract volume and dilution factor used in Equation (2) of [1]; and the Python and ESP32 predictions. | «Representative» contradice la petición; lista concreta de lo que se necesita |
| R25 | §3, párrafo 2, frase 2 | This suggestion concerns the interpretability and independent assessment of the reported approach; it does not imply that the underlying data are unavailable to the authors or that the reported results are invalid. | (eliminada; en su lugar, el párrafo opcional sobre la ecuación 2, P5) | Cautela redundante; el tono ya es neutral |
| R26 | §4, frase 1 | The study demonstrates the feasibility of integrating multispectral acquisition and embedded machine learning for Chl-a estimation in acetone-extracted samples. | Blanco-Jáquez et al. [1] showed that multispectral fluorescence acquisition and embedded inference can be combined in a portable instrument for Chl-a in acetone extracts. | Evita repetir literalmente la frase 2 del abstract |
| R27 | §4, frase 2 | A comparison between the full multispectral configuration and physically justified reduced-input alternatives, together with access to sample-level instrumental data, would help clarify the contribution of the spectral inputs to the reported performance. | Three steps would show how much of the reported performance comes from the multispectral design: reporting which channels the model relies on, comparing the full input set with physically motivated subsets, and depositing the sample-level data. | Enumeración paralela y verbo principal temprano |
| R28 | §4, frase 3 | These complementary analyses could strengthen the interpretation of the results while preserving the practical objectives of the proposed system. | The same steps would guide the recalibration and normalization that the authors plan. | Cierra con un beneficio concreto para los autores (de §4.5 de [1]) |
| R29 | Figura, encabezado | Figure 1. Illustrative channel-level measurements from a separate multispectral prototype | (eliminada) — o, si se conserva, el pie del prompt (opción B) | P2 |
| R30 | Figura, párrafo previo | Channel-level measurements obtained using an independent multispectral prototype. | (eliminada) | P2; además repite el pie |
| R31 | Figura, pie | Fig1: | Figure 1. | Rótulo MDPI; quitar el doble rótulo y los resaltados |
| R32 | Figura, pie | Values are retained in instrument units (i.u.) | Values are in instrument units (IU) | Unificar con el eje («IU»); «retained» sobra |
| R33 | Figura, pie | These are not measurements from [1] | (fusionado en la primera frase del pie: «…a separate AS7265x-based prototype (not the instrument of [1])…») | Evitar repetir la advertencia tres veces (encabezado, párrafo y pie) |
| R34 | Referencias | Valenzuela-García, L.I.; et al. | Valenzuela-García, L.I.; Marín-Celestino, A.E.; Villarreal-Rodríguez, S.; Ayala-García, V.M.; Barbosa-Moreno, F.; Martínez-Cruz, D.A. | Estilo MDPI: todos los autores |
| R35 | Back matter | (ausente) | Author Contributions; Funding; Data Availability Statement; Conflicts of Interest; declaración de IA si procede | P3 |

**Consultas a los autores (no se cambia el contenido):**
- AQ-1: ¿Mantenéis el párrafo sobre la ecuación 2 (P5)? Es una pregunta nueva respecto a V1.
- AQ-2: ¿Mantenéis la figura (opción B del prompt) o la quitáis (versión reescrita)?
- AQ-3: e-mail de correspondencia, roles CRediT, financiación y conflictos.

**Prueba final (proofread) del texto reescrito:** **Hold**: quedan 6 marcadores [REQUIERE AL AUTOR] (e-mail, CRediT, financiación, DAS, conflictos, IA) que solo los autores pueden rellenar. Sin palabras duplicadas, comillas y paréntesis emparejados, sin formas británicas ni dobles espacios; cifras de [1] comprobadas por script. Con los marcadores rellenos: **Ship**.

**Bloqueos fijos:** cifras copiadas de [1] (24; 76; 15; 3,2; 22,00 µg/L; R² 0,979, 0,997, 0,994; RMSE 35,41 y 32,99 µg/L; 405–425, 630–690, 855, 910, 515, 550–555, 680, 420–425 nm) comprobadas contra el PDF; cambiadas de valor: 0.

## 8. Presentación estratégica
- **Abrid con lo más fuerte y menos discutible:** la Tabla 3 compara algoritmos, no entradas. Esa frase es imposible de rebatir.
- **Haced que la petición beneficie a los autores:** el vínculo con el sesgo de 22 µg/L y la normalización que ellos mismos planean convierte el Comment en una ayuda, no en un ataque, y hace más probable un Reply constructivo.
- **Primero lo barato:** los coeficientes del Lasso. Si los autores responden solo con eso, el Comment ya ha aportado algo.
- **Mencionad el canal FD (detección de parpadeo) de forma neutra**, sin adjetivos. El dato habla solo.
- **No pronostiquéis el resultado** de la ablación. La versión reescrita lo dice una vez («We do not presuppose the outcome») en vez de cuatro.
- **La figura:** fuera, salvo que podáis explicar el canal de 900 nm. Si son datos de un trabajo vuestro en preparación, publicarlos aquí podría además restar novedad a ese trabajo.
- **Antes de enviar:** carta breve al editor de *Sensors* (procedimiento MDPI) y, como cortesía, un aviso a los autores. Muchas veces se consigue que publiquen los datos sin llegar al Comment.

## 9. Nota de coherencia con otros manuscritos de Alex (no forma parte del informe al editor)
El Comment pide a otros (a) ablación de entradas con validación anidada y (b) datos depositados. MonoSpectro tiene pendiente el punto P1 (término cuadrático y exclusión del bromotimol tras ver la validación) y Turbimeter no tiene aún validación óptica real. Si alguno se publica en paralelo, debe cumplir los mismos estándares que aquí se exigen: modelo pre-especificado, exclusiones declaradas y datos en un repositorio. Si no, el Reply o un árbitro pueden señalarlo. Si la figura procede del trabajo de espectrofotometría de la bahía de La Habana, decidid antes si queréis adelantar esos datos.

## 10. Herramientas y límites
Usadas: venue-templates (más búsqueda web: política de Comments y de datos de MDPI; instrucciones de JSAN como muestra de las instrucciones comunes de MDPI), peer-review, paper-critique, scientific-critical-thinking, research-integrity, citation-check con `reference-lookup` (OpenAlex), style-sheet, redline-edit, scientific-writing y proofread. No se usó cut-to-length (no hay límite de extensión). Tampoco llm-council: no hay duda sobre la recomendación.
No verificado: formato exacto del título de Comments en MDPI (no encontré un ejemplo publicado); páginas finales de Welschmeyer 1994 y su texto (no cargó); mecanismo de la caída a 900 nm en vuestro prototipo (sin métodos). No hubo una segunda lectura adversarial en una sesión separada. Ningún texto del borrador se envió a servicios externos; solo títulos y DOI publicados.

**Fuentes:** [MDPI Research and Publication Ethics (Comments and Replies; data policy)](https://www.mdpi.com/ethics) · [MDPI Article Types](https://www.mdpi.com/about/article_types) · [MDPI JSAN Instructions for Authors](https://www.mdpi.com/journal/jsan/instructions) · [US EPA GLNPO SOP LG405 (Welschmeyer; 436/680 nm)](https://19january2021snapshot.epa.gov/sites/static/files/2017-01/documents/sop-for-in-vitro-determination-of-chlorophyll-a-in-freshwater-201303-11pp.pdf) · [AS7265x datasheet](https://cdn.sparkfun.com/assets/c/2/9/0/a/AS7265x_Datasheet.pdf) · [Adafruit AS7343 overview](https://learn.adafruit.com/adafruit-as7343-14-channel-light-color-sensor-breakout/overview) · [Blanco-Jáquez et al. 2026](https://doi.org/10.3390/s26134086)
