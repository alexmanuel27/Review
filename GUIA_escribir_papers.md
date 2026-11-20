# Guía para escribir papers científicos (para Codex y chats fuera del proyecto)

Copia para Codex de la habilidad de Claude `escribir-paper-cientifico`, actualizada el 2026-11-20. Si se actualiza la habilidad, hay que regenerar este archivo. Autor de los artículos: Alex Manuel Rivera-Rivera.

Objetivo: que el borrador que sale de este chat llegue al revisor (o a la revista) casi listo, con el menor número de versiones. Se escribe pensando ya en lo que pediría un árbitro de una revista de primer nivel. Hablar con el autor (Alex) en español; el artículo, en el idioma de la revista.

Hacer buena ciencia y contarla bien son dos trabajos distintos. Hay papers flojos escritos de forma impecable y resultados excelentes que nadie lee más allá de la página 1. **El relato de cada paper de Alex se trabaja con el estándar de Nature, sea cual sea el tamaño del resultado.** Lo que se eleva es la claridad, la tensión y la memoria; el tamaño del resultado nunca se infla.

El archivo tiene cuatro bloques de conocimiento propio que hay que usar activamente:
- **«Contarlo»**: cómo construir la historia.
- **«El modelo»**: qué hacen los papers de Nature en el campo de Alex (resumen, figuras, tablas y discusión), sacado de su carpeta de referencia.
- **«Errores frecuentes»**: lo que las revisiones han encontrado una y otra vez en sus manuscritos.
- **«Instrumentación y modelos»**: lo que los árbitros de su campo piden siempre.

## Reglas que no se negocian
1. **No inventar nada:** datos, cifras, resultados, citas ni detalles de métodos. Lo que falte se marca `[REQUIERE AL AUTOR: …]` o `[EXPERIMENTO E1 — resultado pendiente]` y se lista al final.
2. **Cada afirmación dentro de su evidencia.** Si los datos no la sostienen, se rebaja o se quita.
3. **Presentación estratégica sí, falsear no.** Sí: dar más espacio a lo sólido, ordenar y titular para destacar la contribución, limitaciones breves y constructivas, lo secundario al suplemento, conclusiones en positivo dentro de lo que muestran los datos. Un resultado desfavorable que afecta a una conclusión no desaparece (una frase o suplemento). Métricas, muestras y exclusiones siempre declaradas, también las elecciones hechas después de ver la validación.
4. **Hacer, no proponer:** la redacción y la presentación se escriben directamente. Solo se pregunta, en una sola tanda y con recomendación, lo que cambia conclusiones, título, cifras principales o afecta a coautores.
5. **«Mágico» significa claro, inevitable y memorable, no exagerado.** No se promete Nature a un resultado que no lo es; si un experimento más permitiría aspirar a una revista más alta, se dice en el Paso 0.

## Paso 0 — Aprobar la historia antes de redactar
Las rondas más caras han sido las de cambiar el enfoque cuando el paper ya estaba escrito. **Antes de redactar un paper o una sección principal**, presenta a Alex en el chat (breve) y espera su visto bueno:
1. **Revista y tipo de artículo** (con la alternativa si no encaja).
2. **La historia:** la escalera del «¿y qué?», el paper en tres frases Y / PERO / POR ESO y el hallazgo más sorprendente.
3. **Mensaje titular en una frase con su cifra**, que será idéntico en título, resumen, highlights y conclusiones. Comprueba que lo sostienen también las pruebas de robustez.
4. **3–5 títulos candidatos** con el recomendado.
5. **El arco de figuras** (ver «El modelo»): figura → afirmación que demuestra, la idea de la Fig. 1 y qué va al suplemento.
6. **Huecos:** datos, medidas o decisiones que faltan (lista de «Instrumentación y modelos» aplicada a este paper), en especial una demostración en muestra real y una comparación con un equipo de referencia.
Si hay dudas entre enfoques, títulos o revistas, compáralos con una matriz de criterios ponderados antes de presentarlos. Este paso se salta solo si Alex pide una tarea pequeña (una frase, un párrafo, un pie) o dice que siga sin consultar.

## Contarlo: construir la historia
Un editor decide en pocos minutos con el título, el resumen, la Fig. 1 y el final de la introducción. Referencias del método: Mensh y Kording, *Ten simple rules for structuring papers* (PLoS Comput Biol 2017); Gopen y Swan, *The Science of Scientific Writing* (American Scientist 1990); Schimel, *Writing Science* (OUP 2012); Olson, estructura ABT; guía del *summary paragraph* de Nature.

1. **Un solo mensaje central.** El lector debe poder repetirlo en una frase: «¿qué le contará un colega a otro en el pasillo?». Lo que no sirve a ese mensaje va al suplemento o fuera.
2. **La escalera del «¿y qué?».** Subir 2–3 peldaños desde el resultado hasta lo que le importa a cualquier científico. Ejemplo: «corregimos la respuesta de una cámara monocroma» → «medimos absorbancia con un instrumento de 166 €» → «se puede vigilar la calidad del agua donde no hay laboratorio». El peldaño de arriba abre el resumen y la introducción; el de abajo es el resultado.
3. **Tensión: el hueco como enigma.** **Y** (lo que se sabe y por qué importa), **PERO** (una contradicción, un coste, un riesgo o un compromiso concreto, con cifra si se puede), **POR ESO** (lo que hicimos y encontramos). Nunca «few studies have…»: eso es una ausencia, no un problema. Mejor: «calibrations are validated on the same samples used to fit them, so their field error is unknown».
4. **El hallazgo inesperado al frente.** Busca el resultado que sorprende (en HavanaBay, «la estructura del modelo pesa tanto como los datos»; en WaveFlume, «el periodo nominal no es el periodo de la ola») y constrúyelo como eje: título, primera frase de resultados y Fig. 1.
5. **Título como afirmación memorable.** 5–10 candidatos; elegir por precisión, gancho y búsqueda. Preferir el resultado o la tensión al tema: «The Nominal Period Is Not the Wave Period» mejor que «Determination of the stationary state in a wave flume».
6. **Primera frase del paper:** lo que está en juego, nunca generalidades («Water quality is important…», «In recent years…»). La última frase de la introducción dice exactamente qué se muestra y por qué importa.
7. **Contexto → contenido → conclusión en cada escala** (paper, sección, párrafo). La primera frase de cada párrafo dice su mensaje; la última lo entrega o enlaza. Leyendo solo las primeras frases se sigue la historia.
8. **Cada frase en su sitio** (Gopen y Swan): lo conocido al principio, lo nuevo e importante al final; sujeto y verbo juntos y pronto; cada frase recoge el hilo de la anterior. Frases cortas para los hallazgos.
9. **Resultados modestos o muy técnicos.** El valor se cuenta por lo que habilitan (coste, acceso, reproducibilidad, procedimiento transferible), por la lección general que dejan (un error que otros cometen sin saberlo) o por un rigor que otros no tienen. Elige el ángulo con una matriz de criterios; nunca lo infles.
10. **Prueba de los tres lectores** antes de entregar, con tres lecturas separadas, cada una desde un papel distinto: (a) el editor con 2 minutos (título, resumen, Fig. 1, final de la introducción): ¿lo mandaría a revisión?; (b) un científico de otro campo: ¿entiende qué se hizo y por qué importa?; (c) el árbitro escéptico: ¿se exagera algo? Corregir hasta que los tres pasen.

## El modelo: qué hacen los papers de Nature en el campo de Alex
Sale de leer resumen, figuras, tablas y discusión o conclusiones de los papers de la carpeta de referencia de Alex (`/Users/alex/Nube /repos/publication plan/paper-to-read`): 20 de *Nature Communications* (sensores de agua, espectroscopía portátil, hardware abierto), 20 de *Nature Water*, 9 de *Environmental Modelling & Software*, 3 de *IEEE Sensors Letters* y, como contraste, 12 papers de espectrofotómetros de bajo coste de revistas de nivel medio. Mismo tema, distinta forma de contarlo.

### Resumen
| Pieza | Nature Communications | Paper corriente de bajo coste |
|---|---|---|
| Primera frase | Lo que está en juego o el estándar de oro: «Detecting single molecules… is typically achieved with research-grade equipment» | Una generalidad: «The spectrophotometer is an important common analytical equipment» |
| El PERO | Un compromiso concreto: «the trade-off between miniaturizing size and retaining performance»; «resolution and price seem to be in inverse proportion»; «magnetics-based modalities remain unexplored, despite inherent advantages in optically opaque samples» | Ninguno, o «is expensive» |
| «Here we…» | Una idea o estrategia transferible: «a different approach to spectral sensing which dramatically simplifies the requirements on the hardware»; «an open standard» | Un aparato: «a portable and low-cost Arduino-based 2-in-1 UV–Vis spectrophotometer» |
| Cuerpo | El mecanismo en una frase | Inventario de especificaciones (mm, lista de LEDs, n.º de muestras) |
| Cifra titular | Choca con el coste o se mide frente a la referencia: moléculas individuales con un móvil; lámina de luz por 400 € | R² y límites de detección en lista |
| Demostración | Mundo real: agua del grifo, leche real, células, tejido, campo | Solo soluciones modelo |
| Cierre | Lo que se abre: «adaptable to numerous measurands, opening a path towards…» | Repetir métricas |
| Nombre | Propio: UC2, openSIM, mesoSPIM, ReSURF, «spectral barcode» | «the proposed device» |
| Título | Capacidad + medio inesperado: «Quantitative, high-sensitivity measurement of liquid analytes using a smartphone compass». En *Nature Water*, el hallazgo como frase: «River plastic transport and deposition amplified by extreme flood», «Flocs as vectors for microplastics in the aquatic environment» | «Development of a low-cost portable device for…», «for the first time» |

**Plantilla de resumen** (adaptar al límite de la revista):
1. Lo que está en juego o el estándar actual (1 frase).
2. El compromiso o la contradicción que lo impide (1–2), con «However» o «By contrast».
3. «Here we show/present…» + la idea o estrategia, con nombre propio si lo tiene (1).
4. Cómo funciona, en una frase (1).
5. La cifra titular frente a la referencia o al coste (1–2).
6. La demostración en un caso real (1).
7. Lo que se abre, con alcance honesto (1).

En *Environmental Modelling & Software*, los mejores resúmenes nombran una ambigüedad concreta y su consecuencia antes de la solución («its implementation remains ambiguous due to the 5 mm inflow-based subdivision… hindering model reproducibility. To address this issue, we introduce…») o plantean una pregunta afilada («it is still unclear whether better forecasts lead to better water services»). Las revisiones dan las cifras del cribado ya en el resumen.

### Estructura
- En *Nature Communications*: introducción sin encabezado → Resultados con **subtítulos que son afirmaciones** («Direct single-molecule detection with the smartphone-based microscope», «Algorithmic assessment enables sensing of arsenite and cadmium at EPA limits») → Discusión → Métodos al final. No hay sección de Conclusiones. Unas 5 figuras principales y casi ninguna tabla; el detalle va al suplemento.
- En revistas con Conclusiones obligatorias, mantenerlas cortas y con la misma lógica que la Discusión de Nature (idea → alcance → lo que se abre), no como lista de métricas.

### Figuras: el arco de la historia
Las figuras de *Nature Communications* cuentan la historia en orden; las de los papers corrientes son un álbum del aparato.
1. **Fig. 1 — concepto y principio de funcionamiento.** Varios paneles (a–f): esquema o render 3D limpio con rótulos, el mecanismo o el flujo de la señal (entrada → transducción → salida) y, si ayuda, una foto o secuencia del sistema funcionando. Ejemplos: «Proof-of-concept design for magnetometer-based smartphone sensing», «Optical layout and working principle of miniaturized Raman system», «Concept and design of ReSURF». En los papers corrientes la Fig. 1 es la foto del prototipo, un collage de componentes o el esquema de cableado.
2. **Fig. 2 — mecanismo o caracterización:** por qué funciona (simulación, respuesta, estabilidad).
3. **Figs. 3–4 — prestaciones frente a la referencia:** sensibilidad, límite de detección, resolución, comparación con un equipo de laboratorio o con la versión anterior.
4. **Fig. 5 en adelante — demostración real, a escala creciente:** muestras ambientales, agua del grifo, leche, células; en algunos, laboratorio → escala intermedia → campo («Intermediate-scale validation», «Field-scale validation of the nano reporter»).
- Cableados, capturas de la app, piezas impresas y curvas de calibración analito por analito van al suplemento.
- Aspecto: paleta coherente en todas las figuras, renders limpios en lugar de fotos de mesa, rótulos dentro de la figura, paneles con letra, escalas y unidades siempre.

**Pies de figura.** La primera frase, en negrita, es el titular de la figura y a menudo una afirmación: «openSIM increases resolution and optical sectioning compared to widefield illumination», «Multichannel bioelectronic sensors enable simultaneous detection of heavy metals in environmental samples». Después, panel por panel (a, b, c…) qué muestra cada uno, y al final la estadística («Data are presented as mean values ± s.d. from three independent experiments»). En los papers corrientes el pie es una etiqueta («Schematic diagram of spectrophotometer») o una lista de piezas.

**Tablas.** Pocas y con una función: comparar con la literatura o con la versión anterior («Comparison of the analytical properties of the Ca-sensor and P-sensor with previous literature»; «mesoSPIM v.5 vs Benchtop comparison») o recoger parámetros. Las tablas de R², LOD y fases de modelo analito por analito van al suplemento o se convierten en una figura.

### Discusión y cierre
- **Abre con la idea central como lección**, no como resumen de lo hecho: «Our basic strategy is centered around a built-in and real-time calibration of Raman shift and laser intensity».
- **Honestidad sobre lo que no es nuevo**, que da credibilidad a lo que sí lo es: «The sensor platform relies on the basic idea of a magnet being moved by a hydrogel. This in itself is not new. A key to adapting such a system for smartphone-based sensing, however, is amplifying the change…».
- **Posicionarse sin competir con lo que no se pretende superar:** «our intention was not to compete with the most advanced SIM systems. Instead, our focus was on enhancing existing instruments…». Muy útil para instrumentos de bajo coste.
- **Generalización y límites concretos** (qué más se puede medir, qué habría que mejorar y cómo).
- **Cierre con lo que se abre**, a veces como pregunta: «this raises the question of whether magnetics-based smartphone measurement might one day enable useful, home-based analyses… even individual drops of blood»; o con la comunidad: «We encourage open, test-based, and well-documented modifications…».
- Los papers corrientes cierran con «In this work, an inexpensive X was developed», la lista de métricas y «viable alternative», a veces en viñetas. Evitarlo.

### Cómo aplicarlo a los temas de Alex
- El contraste «coste bajo × prestación de laboratorio» es el gancho natural de sus instrumentos, pero solo con una comparación cuantitativa frente a un equipo de referencia y sin decir «comparable» si la cifra no lo es.
- Contar una **estrategia** que otros puedan reutilizar (una corrección derivada de cómo la cámara registra la luz, un procedimiento con datos públicos, el diagnóstico de un error que otros canales también tienen), no solo el aparato.
- Nombre propio para el sistema o el método (como SpecToGo).
- Al menos una medida en una muestra real y, si se puede, una escala más (laboratorio → campo).
- Fig. 1 con el principio de funcionamiento; el cableado y la app, al suplemento.
- En trabajos ambientales y de modelos (*Nature Water*, EMS): título con el hallazgo y resumen que nombra la ambigüedad concreta que se resuelve.
- **Antes de redactar**, si la carpeta de referencia está accesible, leer 2–3 papers de la revista objetivo (o de *Nature Communications*) del mismo tema e imitar su arquitectura (primera frase, PERO, «Here we», arco de figuras, pies, discusión). Nunca su texto.

## Flujo de trabajo (equivalente a las habilidades de Claude)
Codex no tiene las habilidades (skills) de Claude, así que cada paso se hace a mano y se dice en la entrega qué se hizo. Crea una lista de pasos y márcalos.

### Antes de escribir
1. **Revista y formato:** busca y lee la guía de autores vigente (límites, estructura, resumen, highlights, declaraciones, política de IA y preprints). Parte de la ficha de abajo si la revista está en ella.
2. **Literatura:** estado del arte reciente y trabajos rivales; cada referencia verificada por DOI (Crossref u OpenAlex) antes de citarla.
3. **Arco de figuras:** decide qué afirmación demuestra cada figura antes de escribir Resultados; la Fig. 1 es el principio de funcionamiento.
4. **Hoja de estilo** desde el inicio: términos, siglas, unidades, US/UK.

### Mientras se escribe
5. Redacta con «Contarlo», «El modelo», el estilo de abajo y la lista de errores frecuentes.
6. Citas: DOI y BibTeX correctos; cada cita debe apoyar su frase, no solo existir (lee al menos el resumen de la fuente).
7. Si faltan experimentos o medidas, diséñalos (objetivo, montaje, n, controles, análisis, coste, prioridad) y márcalos como pendientes.

### Antes de entregar el borrador
8. Autorrevisión como árbitro: cada afirmación frente a su evidencia, controles y comparaciones que faltan, estadística; recalcula toda cifra comprobable con los datos o scripts si están. Pasa «Errores frecuentes» e «Instrumentación y modelos» punto por punto, y la prueba de los tres lectores.
9. Edición final completa (claridad, concisión, coherencia); si sobra extensión, recorta sin perder hechos.
10. Prueba final: erratas, recuentos, cifras repetidas, marcadores sobrantes, referencias cruzadas; compila el LaTeX.
11. Cierra con una tabla **Paso | Hecho (sí/no) | Qué encontró o cambió**, la lista de marcadores pendientes y una estimación honesta de cómo lo vería un revisor (aceptar / menor / mayor).

## Errores frecuentes en los papers de Alex (con ejemplos reales)
Cada uno apareció en revisiones de sus manuscritos. Búscalos activamente.

**Redacción**
1. **Estilo telegráfico o de notas:** frases sin verbo, matices encadenados, texto comprimido que se lee como lista. → Prosa completa, una idea por frase.
2. **Describir el propio trabajo como si fuera un revisor externo.** «Degree-selection criteria are unspecified», «no additional-line check was reported», «These are configured settings, not verified settling or bandwidth». → Decir lo que se hizo o no se hizo: «Both degrees were selected by leave-one-dye-out cross-validation within the calibration dyes», «no additional line was measured to check either mapping», «These settings do not establish the settling time or bandwidth».
3. **Cautelas en cadena.** En un texto de 816 palabras: «would» ×8, «could» ×5, «complementary» ×4, más «does not imply…», «without presupposing…», «where scientifically appropriate». → Una cautela, una vez, donde toca; peticiones y afirmaciones concretas.
4. **Frases con 4–5 cifras.** «…lowers the RMSE from 0.32 to 0.11 … over 420 nm to 780 nm, and to 0.07 when …, raises the pooled R2 from 0.17 to 0.96, and brings the band maxima within 4 to 9 %…». → Dividir en dos o tres frases.
5. **Nominalizaciones y sujetos vagos.** «The integration of optical sensing and on-device prediction represents a useful contribution» → «Integrating optical acquisition and embedded inference … is a useful contribution». «it» sin antecedente claro → nombrar el sujeto.
6. **Física dicha con imprecisión.** «the sample is lit with white light and dispersed» (se dispersa la luz, no la muestra); «90-degree scattering photodiode» (→ «photodiode for 90-degree scattering»); «amplitude S» cuando S es la carrera completa; «tone curve divides every absorbance by the same factor» (solo una curva de potencia).
7. **Términos que cambian:** «overall/pooled R²», «residence/renewal time», «stroke/amplitude», «survey/values». → Uno por concepto, fijado en la hoja de estilo.
8. **«significantly» sin prueba estadística**, «close to significance» con p = 0,08. → Cifra y, si hay prueba, su resultado.
9. **Párrafos que empiezan por «Figure X shows» o por una abreviatura.** → Empezar por el hallazgo; desarrollar la abreviatura.
10. **La misma idea repetida** en resumen, introducción, sección y conclusión con las mismas palabras. → Decirla una vez en cada sitio y con una función distinta.
11. **Restos de edición:** resaltados, dobles rótulos de figura, espacios dobles, unidades distintas en eje y pie (IU / i.u.), afiliación con el asterisco mal puesto, «et al.» donde la revista pide todos los autores.

**Afirmaciones**
12. **Afirmar más de lo que dan los datos:** «quantitatively comparable to a laboratory-grade instrument» (con RMSE 0,07 y un déficit del 10 %), «This ensures a robust generalization» (con 3 colorantes), «the wave height follows linear wavemaker theory» (−22 % a +5 %), «This relation is general» (era la relación de una sinusoide), «renews the bay in about a week» cuando la Discusión dice una a dos semanas. → Cifra con su rango y su alcance.
13. **Novedad sin búsqueda:** «no study has…», «rarely characterised», «first». → «To our knowledge…» solo tras búsqueda documentada, o quitarlo.
14. **Causas no demostradas:** «the change is attributed to input smoothing». → Quitar o presentarla como hipótesis con lo que la apoyaría.
15. **Cifras sin punto de partida:** «reduced to 0.07». → «from 0.32 to 0.07».
16. **Verbos que exageran la fuente:** una ficha dice «12.8 m» y el texto dice «maintained at 12.8 m»; unos valores tabulados se llaman «survey»; «left out» cuando la fuente solo no lo cuantifica. → El verbo exacto de la fuente.
17. **Citas que no apoyan su frase aunque existan** (una ref. de detección óptica citada como «smartphone photometry»; una de calibración de longitud de onda citada para filtros Bayer; un ejemplo de despliegue citado como fuente de costes). → Citar cada fuente para lo que dice.

**Formato y cierre**
18. **Declaraciones ausentes:** autor de correspondencia y e-mail, CRediT, financiación, disponibilidad de datos y código, conflictos (también tener un prototipo competidor), uso de IA.
19. **Resumen por encima del límite** (187 frente a 175 palabras) o con frase introductoria cuando la revista no la quiere.
20. **Paquete incompleto:** faltan `\input`, `.bst` o figuras; figuras en PDF donde la revista pide TIFF.

## Instrumentación y modelos: lo que los árbitros piden siempre
Pásalo en el Paso 0 (para detectar huecos) y en la autorevisión.

**Calibración y validación**
- Conjuntos de calibración y validación **independientes** (muestras, preparaciones o colorantes distintos; no de la misma familia si se reclama generalidad).
- Modelo, grado e hiperparámetros elegidos **solo con la calibración** (LOO o validación cruzada anidada). Cualquier elección hecha después de ver la validación (un término añadido, una muestra excluida) se declara; no reutilizar el mismo conjunto de validación versión tras versión sin decirlo.
- Exclusiones con criterio previo y declarado; puntos fuera del rango fotométrico de la referencia, declarados y con prueba de sensibilidad sin ellos.
- Con n pequeño (p. ej. 15 muestras o 3 colorantes), intervalos *bootstrap* de RMSE, MAE y sesgo; no ordenar métodos por diferencias dentro del ruido.
- Comparar con un modelo simple de referencia (pocos coeficientes, un solo canal, línea base) antes de defender uno complejo.
- Al menos una muestra real (no solo colorantes o soluciones modelo).

**Caracterización del instrumento**
- Referencia: fabricante, modelo, rango fotométrico y ancho de banda; si los anchos de banda difieren, comparar también con la referencia convolucionada.
- Eje de longitud de onda calibrado con líneas de emisión (Hg/Ar, láseres, LEDs caracterizados), con residuo en nm y FWHM medida; decir qué método se usó de verdad y mantenerlo igual entre versiones.
- Rango útil con criterio explícito (p. ej. error relativo < 10 %); luz parásita, corriente oscura (*dark*), saturación, profundidad de bits (8 bits procesados frente a RAW).
- Repetibilidad (n lecturas) y reproducibilidad (≥ 3 preparaciones independientes, días, unidades); deriva tras el calentamiento; incertidumbre según GUM; incertidumbre y correlación de los coeficientes ajustados.
- La caracterización corresponde al montaje que produjo los datos (si se realineó, decirlo y, mejor, comprobar que los coeficientes siguen valiendo).
- Generalidad: más de una unidad, teléfono o sensor antes de afirmar transferibilidad.
- Medidas ópticas o por imagen validadas frente a un método independiente (sonda, limnímetro, segunda cámara); distorsión del objetivo, escala y refracción en paredes; réplicas de cada ensayo.
- Coste: qué incluye (componentes, montaje, calibración), qué excluye, fecha y tipo de cambio.
- Apertura: diseños, firmware, datos crudos y código con DOI (Zenodo) o commit citado; MIT u otra licencia para código y CC BY para datos.

**Modelos numéricos**
- Comparar cada prueba de estructura (física añadida, contorno, solver) con el rango del ensamble; si lo supera, es un eje del artículo.
- Equilibrio del spin-up declarado; convergencia de índices de sensibilidad con N creciente; rangos de entrada justificados uno a uno; el ranking de sensibilidad vale para esos rangos, no para los procesos en general.
- Desviaciones del protocolo fijado, declaradas como tales.

**Revisiones bibliográficas**
- Flujo de cribado con cifras (registros → cribados → evaluados → incluidos, con motivos) y lista PRISMA-ScR; las cifras del cribado también en el resumen.
- Codificación por un autor y comprobada por otro; recuentos que suman su n; número de documentos igual al de entradas citadas; tabla de extracción publicada.

## Fichas de revistas habituales
Verificadas en revisiones de 2026; **confirma siempre la guía vigente** antes de cerrar el formato.
- **IEEE Sensors Letters:** 4 páginas incluidas las referencias, sin páginas extra de pago (si no cabe, IEEE Sensors Journal); plantilla IEEEtran. IA: declarar en agradecimientos el contenido generado; recomendado también para edición de lenguaje.
- **IEEE Sensors Journal:** artículo regular en torno a 8 páginas; el exceso tiene cargos obligatorios.
- **Applied Spectroscopy (Sage/SAS):** estilo ACS (coma serial); fabricante entre paréntesis en la primera mención de cada equipo; ningún párrafo empieza por abreviatura; ecuaciones sin puntuación final y citadas como «Eq. 1»; 4–10 palabras clave con forma desarrollada y abreviada; resumen sin frase introductoria; resumen gráfico obligatorio; figuras en TIFF (≥ 600 ppi dibujo lineal, ≥ 300 ppi fotos), no PDF en la primera entrega; en revisiones, lista EQUATOR/PRISMA-ScR. Focal Point Review: habitualmente 15 000–20 000 palabras.
- **Environmental Modelling & Software (Elsevier):** resumen ≤ 150 palabras; 3–5 highlights de ≤ 85 caracteres; sección *Software availability* (nombre, desarrolladores, contacto, año, hardware y software requeridos, disponibilidad y coste); declaración de IA con la fórmula de Elsevier; contribución generalizable (el procedimiento, no solo el caso).
- **Sensors (MDPI):** resumen ≤ 200 palabras; *back matter* obligatorio (Author Contributions con CRediT, Funding, Data Availability Statement, Conflicts of Interest); declarar IA generativa más allá de la edición superficial; referencias con todos los autores. Comments: contactar antes con la oficina editorial.
- **ASCE JWPCOE (Technical Note):** resumen ≤ 175 palabras; autor de correspondencia; declaraciones de disponibilidad de datos y de IA.

## Cómo escribir cada parte
- **Título:** el resultado, la capacidad o la tensión, no el tema («Contarlo» 5 y «El modelo»). Sin «novel», «first» ni generalizaciones que no se puedan probar.
- **Resumen:** plantilla de 7 pasos de «El modelo», con cifras y su punto de partida, y su alcance. Nada que no esté en el cuerpo. Dentro del límite.
- **Highlights** (si se piden): afirmaciones respaldadas; lo mismo que resumen y conclusiones, no más.
- **Introducción:** primera frase con lo que está en juego → qué se sabe (citas recientes y rivales) → el compromiso o la contradicción concreta → qué hace este trabajo. Termina con «Here we…» y la contribución en 2–3 puntos.
- **Métodos reproducibles:** equipo con fabricante y modelo, versiones de software, muestras y n, condiciones, preprocesado, exclusiones definidas antes de ver resultados, selección de modelos sin usar los datos de validación, métricas definidas, estadística e incertidumbre, enlace o DOI de datos y código.
- **Resultados:** en el orden del arco de figuras, con subtítulos que son afirmaciones. Cada párrafo empieza por el hallazgo. Cifras con incertidumbre y n. Separar observación e interpretación.
- **Discusión:** como en «El modelo»: idea central como lección → qué no es nuevo y qué sí → posición frente a sistemas más caros → comparación cuantitativa con trabajos previos → mecanismo como hipótesis si no está probado → límites concretos y cómo superarlos → lo que se abre. Nunca cerrar con las limitaciones.
- **Conclusiones** (si la revista las exige): cortas, misma lógica, sin cifras nuevas ni lista de métricas.
- **Figuras y tablas:** arco de «El modelo»; pie con titular en negrita, panel por panel y estadística; ejes con magnitud y unidad; paleta coherente y apta para daltónicos; paneles legibles a tamaño de columna (el resto al suplemento). Tablas solo para comparar o para parámetros.
- **Declaraciones:** datos y código, conflictos, financiación, contribuciones (CRediT) y uso de IA según la revista.
- **Carta al editor:** una página. Qué problema resuelve y por qué importa ahora, el hallazgo principal con su cifra, por qué encaja en esta revista y sus lectores, y declaraciones (no enviado a otra revista, conflictos, preprint). No repetir el resumen.
- **Respuesta a revisores:** punto por punto: comentario literal, respuesta, cambio hecho con su ubicación (sección y línea). Discrepar solo con evidencia y con cortesía; si no se puede hacer algo, decirlo y explicar por qué, y añadir la limitación al texto.

## Estilo
- Una idea por frase, sujeto y verbo claros, párrafos con frase temática.
- Voz activa cuando el agente importa («We measured…»); pasado para lo hecho y observado, presente para lo establecido y lo que muestran las figuras.
- Precisión: «increased by 12 %» mejor que «significantly improved».
- Un término por concepto; siglas definidas la primera vez en resumen y cuerpo.
- Natural y humano: longitud de frase variada, primera persona del plural donde es natural, sin muletillas de IA («delve», «crucial», «pivotal», «landscape», «furthermore» en cada párrafo), sin fórmulas repetidas del tipo «X does not…, nor…».
- Términos técnicos precisos aunque una paráfrasis suene más coloquial («stray light», no «unwanted light»).
- Convenciones de la revista (US/UK, coma serial, unidades, estilo de citas).

## Comprobaciones finales (errores que los revisores sí encuentran)
- Toda cifra repetida (resumen, texto, tablas, figuras, conclusiones) es idéntica.
- Las tablas de recuentos suman su n; el número de referencias declarado cuadra con las citadas.
- Ninguna cifra de una tabla contradice su figura (barras, bandas, escalas).
- Resumen y highlights no afirman más que la Discusión ni que las pruebas de robustez.
- Si una prueba de robustez mueve el resultado más que todo el rango de incertidumbre, es un eje del artículo, no un matiz escondido.
- Cada cita apoya su frase; las fuentes grises dicen lo que se les atribuye.
- Al recortar, cada cifra que queda conserva su método y sus datos (texto o suplemento).
- Si hay datos o scripts, las cifras principales se recalcularon con ellos.
- Revisar figuras no usadas y patrones de las figuras que el texto no describe.
- Las 20 entradas de «Errores frecuentes» revisadas una a una.
- El resumen sigue la plantilla de 7 pasos (o la de la revista) y no abre con una generalidad ni se queda en un inventario de especificaciones.
- Las figuras siguen el arco (concepto → mecanismo → prestaciones frente a referencia → caso real); la Fig. 1 es el principio de funcionamiento, no la foto ni el cableado; cada pie empieza con su titular; los subtítulos de Resultados son afirmaciones.
- La Discusión abre con la idea central y cierra con lo que se abre, no con limitaciones ni con una lista de métricas.
- El mensaje central cabe en una frase y es el mismo en título, resumen, final de la introducción, Fig. 1 y conclusiones; leyendo solo las primeras frases de los párrafos se sigue la historia; la prueba de los tres lectores está pasada.
- El paquete LaTeX está completo (todos los `\input`, .bst, figuras), compila y respeta la extensión.
- Declaraciones obligatorias presentes y prueba final en Ship.