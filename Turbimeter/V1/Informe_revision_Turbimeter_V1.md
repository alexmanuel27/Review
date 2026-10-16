# Revisión externa del turbidímetro alimentado por teléfono

IEEE Sensors Journal · V1 · 16 de octubre de 2026


Recomendación: RECHAZAR esta versión como artículo de investigación para IEEE Sensors Journal, con posibilidad de una nueva presentación después de completar y documentar la validación experimental. El obstáculo es la ausencia de evidencia del sistema óptico ensamblado; no se resuelve mediante una revisión de redacción. Esta es una evaluación externa simulada para el autor, no una decisión emitida por la revista.

Versión revisada: Turbimeter_EN.pdf, 10 páginas, encabezado del 12 de octubre de 2026; revisión realizada el 16 de octubre de 2026. Se leyó el texto completo y se inspeccionaron visualmente las diez páginas, incluidas las nueve figuras, las dos tablas, las dos ecuaciones y las 44 referencias. Las ubicaciones siguientes usan la numeración impresa del PDF. Es la primera revisión de este trabajo en el archivo Review, por lo que se registra como V1.

Las cifras rojas y las figuras cuantitativas 6–9 son sintéticas y NO constituyen evidencia experimental. La figura 8(a) es una imagen generada por IA, no una fotografía de un ensayo. Sus valores de sesgo, RMSE, CV, consumo y diferencias entre teléfonos no permiten estimar ninguna prestación del equipo. El manuscrito lo advierte de forma visible; no hay fundamento aquí para acusar de ocultación de datos ficticios. Las figuras 1, 2 y 5 son esquemas; la figura 3 contiene visualizaciones de diseño; la figura 4 muestra una aplicación desconectada.

La ciencia ciudadana con pescadores y residentes de La Habana es una aplicación futura. No se han presentado participantes, datos comunitarios, aprendizaje, despliegue, plataforma operativa ni tendencias ambientales. No exijo realizar ese estudio social para publicar un artículo técnico delimitado al instrumento; sí exijo mantener esta separación y validar cualquier alcance técnico que finalmente se reclame.


SHA-256: `ba7de73f5814952773fca1f9c9cf3663a6ad4b5d74476088c392351db8fd17df`


## Resumen


El trabajo propone un cabezal externo con LED de 850 nm, fotodiodo BPW34 a 90 grados, segundo fotodiodo para monitorizar el emisor, amplificación MCP6002, conversión ADS1115 y adquisición XIAO SAMD21. Un teléfono Android aporta alimentación USB, interfaz y almacenamiento local. La señal propuesta es R = (S_on − S_off)/(L_on − L_off). Se plantea calibración individual por transferencia frente a un instrumento profesional, validación con preparaciones independientes, comparación de un mismo sensor entre tres teléfonos y transferencia congelada de coeficientes de A a B. La contribución declarada sería una cadena abierta y reproducible de adquisición, calibración y control de calidad, aún por demostrar.

## Evaluación general


Relevancia: el tema encaja en sensores ópticos, interfaces y alimentación de sistemas de medida, áreas cubiertas por la revista [S1]. La integración puede ser útil donde se dispone de teléfonos y se busca evitar pantalla y batería propias en el sensor. La utilidad práctica dependerá del coste completo, la calibración accesible, el comportamiento en muestras reales y la conservación de los registros.

Novedad: potencialmente incremental y todavía no acreditada. El texto reconoce correctamente que la geometría, el hardware abierto, las aplicaciones móviles y la alimentación desde un teléfono tienen precedentes. Pokela describe específicamente alimentación y control por USB desde Android [S2]. Kelley ya calibra un instrumento abierto frente a un comparador y lo contrasta con materiales independientes [S3]. Droujko y Molnar ensayan múltiples unidades [S4]. La combinación propuesta puede constituir una contribución de ingeniería si ofrece una ventaja medible; un listado de componentes y pruebas futuras no basta para demostrarla.

Solidez: el plan contiene decisiones acertadas: separar lotes de entrenamiento y evaluación, distinguir repetibilidad de acuerdo, congelar coeficientes durante la transferencia, registrar el donante y no inferir cumplimiento ISO/EPA de una comparación comercial. Sin embargo, faltan el instrumento final, los datos y las decisiones operativas que harían ejecutable ese plan. El resumen y la conclusión reconocen las limitaciones; precisamente por ello describen un protocolo de trabajo y no resultados de investigación concluidos.

Presentación: el PDF es legible y las advertencias de material sintético son claras. Las figuras ocupan una proporción grande de las páginas y varias repiten mensajes de planificación. No observé un defecto visual general que impida leerlo; los problemas científicos dominan sobre los de maquetación.

## Problemas mayores


### M1 No existe todavía la evidencia central del artículo


**Ubicación:** p. 1, Abstract; pp. 2–3, III-A/B; pp. 6–9, V y VII

El resumen declara que no se ha validado el sistema óptico ensamblado. III-A indica que ambas placas están colocadas pero sin rutear; III-B solo documenta carga, PING y ADC_MISSING sin ADS1115 conectado. La sección V reemplaza los resultados por observaciones inventadas. Esos elementos no demuestran medición de turbidez, funcionamiento del conjunto, repetibilidad ni portabilidad de calibración.

**Solución:** [REQUIERE AL AUTOR] Construir y documentar la revisión realmente ensayada, adquirir datos ópticos reales, calibrarla y evaluarla con muestras independientes. Sustituir íntegramente las maquetas y sus estadísticas. Mientras falte esa evidencia, conservar el documento como borrador/protocolo y describirlo así en título, resumen y conclusión; cambiar el tiempo verbal no convierte un plan en un artículo validado.

**Criterio de cierre:** Todas las prestaciones reclamadas se vinculan a archivos de datos, ensayos realizados y análisis reproducibles; no queda ningún resultado sintético presentado como resultado del dispositivo. La recomendación solo puede reconsiderarse tras revisar esa evidencia.

### M2 La implementación no es reproducible a partir del PDF


**Ubicación:** p. 2, III-A y ecuación (1); p. 4, figura 3; p. 6, IV-E

No se especifican de forma suficiente la polaridad y el punto de trabajo de los transimpedancia, el modelo y espectro del LED, la corriente real, las aperturas y ángulos de aceptación, el acoplamiento del monitor, los ajustes del ADC ni la secuencia temporal. Cuatro lecturas off/on pueden significar promediar señales antes del cociente o promediar cocientes: no son operaciones idénticas. Tampoco se presenta una revisión fabricable y ensayada de la conexión USB.

**Solución:** Publicar esquema eléctrico, dimensiones ópticas y lista exacta de piezas de la revisión final, configuración PGA/canales/tasa del ADS1115, tiempos de estabilización y orden de lecturas, fórmula de promediado y umbrales de error. [REQUIERE AL AUTOR] Medir señales y ruido, polaridad, saturación, aislamiento óptico, corriente LED, montaje y operación USB con el conjunto real; aportar fotografías y archivos de fabricación coincidentes.

**Criterio de cierre:** Un tercero puede ensamblar la misma revisión y reconstruir cada R desde los canales crudos y la secuencia documentada, sin deducir parámetros esenciales de una visualización.

### M3 La calibración por transferencia carece de anclaje y protocolo material definidos


**Ubicación:** pp. 4–5, IV-A y figura 5; p. 10, referencias [1], [3], [4]

Es admisible asignar valores mediante un comparador; la ausencia de formazina en el prototipo no invalida por sí sola el enfoque. Pero no se identifica el comparador real ni la suspensión, su preparación, estabilidad, homogeneización, temperatura, cubeta o ventana temporal de lectura. Un certificado o historial de servicio no sustituye la verificación de desempeño el día del ensayo. Adoptar el rótulo del comparador tampoco iguala las respuestas espectrales y geométricas de los dos instrumentos [S3, S5].

**Solución:** [REQUIERE AL AUTOR] Identificar modelo, método óptico, unidad, calibración y verificaciones del comparador, materiales usados, blancos y controles independientes. Describir composición/lotes y un procedimiento de mezcla, tiempo máximo entre lecturas, limpieza y orientación de cubetas; comprobar estabilidad por lecturas que enmarquen cada comparación. Definir la magnitud como equivalente al modelo/método del comparador y limitar su validez a matrices y rangos ensayados. Si no hay controles certificados disponibles, justificar la alternativa y explicitar la limitación de incertidumbre y trazabilidad.

**Criterio de cierre:** Cada valor asignado conserva su procedencia y controles; las discrepancias por método y matriz se evalúan o delimitan. No se afirma cumplimiento ISO/EPA ni equivalencia universal NTU–FNU.

### M4 El plan estadístico no permite decidir aceptación o fracaso


**Ubicación:** p. 5, IV-B y tabla II; pp. 5–6, IV-C/D

La regla |y − y_ref| ≤ a + b y_ref tiene a y b sin justificar; tampoco se fijan tamaño muestral, número de construcciones, días, operadores, lotes o márgenes entre teléfonos/unidades. Reconocer los conglomerados es correcto, pero falta especificar el estimador y la población objetivo. No se define si el criterio se aplica a una lectura, al promedio de varias o a una proporción de muestras. Un RMSE agrupado puede ocultar fallos en una matriz o en el extremo bajo.

**Solución:** Antes del conjunto final de evaluación, fijar rango de uso, tolerancias justificadas por el objetivo técnico, unidad de resultado, fracción mínima de mediciones conformes y tratamiento de fallos. [REQUIERE AL AUTOR] Diseñar y justificar cantidades de lotes, unidades, teléfonos, operadores y días según la precisión requerida de intervalos/contrastes. Especificar un análisis de medidas repetidas, por ejemplo modelo jerárquico o remuestreo por lote, con intervalos para sesgo, error, límites de acuerdo y proporción conforme; evaluar heterocedasticidad. [33]–[34] ya ofrecen una base pertinente [S6].

**Criterio de cierre:** Un plan fechado anterior al hold-out permite decidir cumplimiento con incertidumbre por rango y matriz, usando el número real de muestras independientes y todos los intentos. No se copian los tamaños ficticios de V como justificación.

### M5 Selección del modelo e incertidumbre de predicción insuficientes


**Ubicación:** p. 4, IV-A, párrafo sobre fit family; p. 5, IV-B; pp. 6–7, V-A/E

Separar preparaciones es adecuado, pero no se explica cómo elegir familia, ponderación, transformaciones y rango sin utilizar el hold-out. Repetir diluciones de un mismo stock o muestras del mismo evento puede dejar dependencia aun usando distintos identificadores. No hay un presupuesto que integre ruido de canales, ajuste, asignación del comparador, manejo y variabilidad entre días. Un coeficiente de determinación alto, o error pequeño sobre datos usados para seleccionar el modelo, no resolvería estas carencias.

**Solución:** Definir entrenamiento y selección interna del modelo por grupos, reservar el hold-out final y congelar tanto coeficientes como rango y reglas de invalidez. [REQUIERE AL AUTOR] Evaluar residuos, falta de ajuste, efecto de matriz e incertidumbre de resultados individuales, incluyendo incertidumbre del comparador y de calibración. Elegir tratamiento de error en ambas variables si la incertidumbre del comparador resulta relevante. Para reclamar utilidad en agua ambiental, incluir muestras naturales independientes; si no se obtienen, restringir las conclusiones a las suspensiones ensayadas.

**Criterio de cierre:** Se entregan particiones por stock/lote/evento y fechas, reglas congeladas y predicciones externas con intervalos y límites de uso. El tratamiento de incertidumbre sigue un modelo documentado, apoyado cuando corresponda en JCGM [S7].

### M6 La normalización y la política cerca del blanco necesitan validación


**Ubicación:** p. 2, III-A, ecuación (1) y párrafo posterior; p. 5, IV-B; p. 8, figura 7(a/b/d)

Dividir por L_on − L_off puede reducir fluctuaciones comunes, pero también amplifica ruido si el denominador es débil; un monitor aislado de la muestra no corrige necesariamente color, reflexión o cambios geométricos. Además, rechazar toda dispersión corregida negativa cerca del blanco puede seleccionar solo fluctuaciones positivas y sesgar los resultados válidos. Es una posibilidad inferida de la regla descrita, no un fallo experimental demostrado. El CV deja de ser útil cuando la media se aproxima a cero.

**Solución:** [REQUIERE AL AUTOR] Comparar R y dispersión corregida sola con calibraciones y evaluación independientes comparables, bajo perturbaciones medidas de emisor/alimentación. Evaluar incertidumbre y covarianza de canales y fijar un umbral del denominador basado en señal/ruido. Conservar señales negativas en el registro de investigación y distinguir señal no cuantificable de fallo de hardware; no forzar un valor NTU. Medir blancos y niveles bajos, informar SD/error absoluto y justificar límite de cuantificación/rango inferior mediante un criterio definido.

**Criterio de cierre:** La ventaja o ausencia de ventaja del cociente se demuestra con datos; se reportan fallos y resultados bajo rango sin censura oculta. No se estima detección ni repetibilidad a cero mediante CV.

### M7 El alcance de los ensayos entre teléfonos y sensores debe fijarse


**Ubicación:** p. 1, pregunta final de I; p. 5, tabla II y IV-C; p. 6, IV-D; pp. 6–9, V-C/D y figuras 8–9

El ensayo de un sensor con tres teléfonos estima diferencias para ese sensor y esos teléfonos; no permite estimar una interacción sensor–teléfono ni variación poblacional de Android. Una pareja donante–receptor tampoco permite concluir portabilidad de fabricación. El texto reconoce ambas limitaciones, pero la pregunta introductoria sobre unidades ensambladas independientemente y teléfonos compatibles exige decidir cuánto alcance tendrá la respuesta final. Las barras de SD de las maquetas no son intervalos de equivalencia.

**Solución:** [REQUIERE AL AUTOR] Ejecutar comparaciones pareadas y aleatorizadas, con referencias que controlen evolución de la muestra, registro de cables/adaptadores y todos los fallos. Si se reclama generalización entre kits, incluir construcciones y pares donante–receptor independientes suficientes para la inferencia, y cruzar sensores/teléfonos/operadores. Si el alcance es exploratorio, limitarlo expresamente a los dispositivos ensayados. Fijar márgenes de equivalencia y dar intervalos sobre diferencias, además de la comparación individual contra referencia.

**Criterio de cierre:** El alcance de resumen, métodos y conclusión coincide con las unidades independientes realmente estudiadas. La transferencia usa f_A congelada sin ajuste de B; una recalibración posterior se analiza por separado.

### M8 Robustez y demanda energética siguen siendo una lista de intenciones


**Ubicación:** p. 3, III-C; p. 5, IV-B/tabla II; p. 6, V-B; p. 8, figura 7

El artículo propone pruebas de luz, burbujas, reinserción, deriva y batería, pero no fija condiciones ni criterios. Falta incorporar temperatura del agua/electrónica y caracterizar interferencias relevantes para el alcance ambiental que se reclame. Una traza sintética de 60 minutos no define un intervalo de verificación; una corriente del cabezal no representa por sí sola la carga del teléfono, que incluye pantalla, conversión y aplicación. El uso futuro en la bahía no justifica asumir comportamiento frente a matrices costeras.

**Solución:** [REQUIERE AL AUTOR] Especificar y ejecutar condiciones controladas de manejo, luz y temperatura; extender estabilidad a los días/tiempo de uso que se pretenda cubrir. Evaluar matrices representativas, incluidas condiciones costeras si se reclama ese alcance, o declarar su exclusión. Medir tensión y corriente USB en reposo y adquisición, energía por medida y consumo incremental del teléfono frente a un estado base comparable. Determinar intervalos de chequeo y límites de cambio con datos; si no se ensayan, retirarlos como prestación.

**Criterio de cierre:** Se informan condiciones, réplicas independientes, incertidumbre, fallos y restricciones. El artículo distingue ausencia de batería propia del sensor de consumo energético nulo o autonomía demostrada.

### M9 Faltan registros completos y una liberación abierta verificable


**Ubicación:** p. 3, III-B; p. 6, IV-E; p. 9, Declarations for Submission; p. 10, [17]

El CSV actual carece de canales crudos, identificación del sensor y otros campos esenciales; el manuscrito reconoce que aún no es un registro de investigación. No se aportan resultados de integridad de extremo a extremo ni una liberación completa de la revisión ensayada. La referencia a un commit de desarrollo no sustituye esa liberación. El acceso web al commit [17] no pudo comprobarse en esta revisión; esto no demuestra que sea inexistente o privado.

**Solución:** Completar el registro en la app o mediante adquisición auxiliar vinculada de forma inequívoca por ID de medida. [REQUIERE AL AUTOR] Probar tramas válidas, incompletas, duplicadas, malformadas y sintéticas, desconexión/reinicio/exportación y restauración de calibración; aportar casos y resultados. Depositar esquemas, PCB final, carcasa, firmware/app, instrucciones, licencias por componente, datos crudos y análisis en una versión persistente que corresponda a los ensayos. Verificar que el paquete permite regenerar tablas y figuras.

**Criterio de cierre:** Cada resultado se reconstruye desde sus canales y metadatos; no entra demo en el conjunto real ni un cociente sin calibrar aparece como NTU. El paquete y sus licencias son accesibles y coherentes con la revisión fabricada.

### M10 La ventaja científica de la combinación propuesta debe demostrarse


**Ubicación:** pp. 1–3, I–II y tabla I; p. 7, V-E; p. 9, VII

La tabla I explica antecedentes, pero la fila propia solo ofrece validación pendiente. Añadir USB, un monitor de LED y metadatos a piezas conocidas no acredita por sí solo una contribución suficiente. Falta considerar ColorX (2025), un lector externo con fotodiodos, app, archivos abiertos y ensayo de turbidez, aunque usa otra óptica, batería y Bluetooth [S8]. No atribuyo prioridad universal a ese antecedente ni considero obligatoria una lista extensa de citas.

**Solución:** Actualizar la comparación con los antecedentes más próximos, en especial Pokela, Kelley, diseños de múltiples unidades y ColorX. Formular una pregunta concreta: por ejemplo, qué error y variabilidad conserva un cabezal alimentado por diferentes teléfonos con calibración y procedencia explícitas. [REQUIERE AL AUTOR] Responderla con los ensayos anteriores y una comparación pertinente de prestaciones, reproducibilidad y coste; separar ventajas demostradas de decisiones de diseño. Si el resultado solo alcanza viabilidad limitada, presentar ese alcance con honestidad y reevaluar su encaje editorial.

**Criterio de cierre:** Introducción y conclusión identifican una aportación demostrada y sus límites frente a precedentes; no reclaman primacía del USB, del teléfono, de la geometría ni del hardware abierto.

## Problemas menores


### m1 · p. 10, bibliografía completa


La comprobación de metadatos no reveló una referencia central inventada. Se consultaron 36 DOI tomados de la bibliografía auxiliar: 35 resolvieron en Crossref y Kelley [5] se comprobó en el editor tras un fallo de esa consulta. Resolver un DOI no acredita que cada frase esté respaldada por el texto completo. Añadir DOI a los artículos donde corresponda, homogeneizar fechas de acceso de recursos web y verificar los permisos/licencias en versiones concretas. No sustituir 2022 por 2021 en OpenOBS sin distinguir publicación anticipada de volumen final.

### m2 · pp. 1–3, I–II y tabla I


Añadir ColorX como antecedente cercano [S8], evitando presentar su transreflectancia verde/Bluetooth como equivalente a nephelometría infrarroja/USB. Una revisión general de plataformas de análisis con teléfonos de 2025 puede aportar contexto [S9], pero no es una cita bloqueante ni demuestra rendimiento del diseño propuesto. La literatura faltante debe mejorar la comparación, no aumentar el número de citas por sí mismo.

### m3 · pp. 7–9, ejes y pies de figuras 6–9


Al sustituir las maquetas, emplear un nombre uniforme de la unidad y definir signo de error, denominador del error relativo, número de lotes y significado exacto de barras. No mezclar SD dentro de conexión, SD entre muestras e intervalo del sesgo. En el extremo de blanco usar unidades absolutas. Las curvas y colores de las maquetas no deben sobrevivir como evidencia sin regeneración desde datos reales.

### m4 · p. 8, figura 7(b); pp. 7–8, final de V-E


La leyenda de 7(b) cubre una parte apreciable de la traza del cociente. Reubicarla en el gráfico definitivo. El final de V-E queda separado por una página de figuras y aparece como dos líneas aisladas al pie de p. 8; mantener ese párrafo unido o mover las figuras para no interrumpir la lectura. Son ajustes de presentación, no defectos de los datos sintéticos.

### m5 · p. 1, resumen gráfico; p. 2, figura 1; p. 4, figura 3


El resumen gráfico duplica la figura 1. Diferenciar sus funciones o condensar la figura en el cuerpo. En el esquema indicar direcciones de alimentación, transmisión digital y transformación de datos con claridad: la posición de las flechas no debe sugerir que el teléfono genera por sí mismo la calibración. En la figura 3 final aumentar etiquetas y ofrecer cotas reproducibles en el suplemento.

### m6 · p. 6, IV-E, párrafo EUR 76.52


El importe corresponde a una cesta anterior y se identifica correctamente como no representativo del coste actual. No usarlo en resumen, comparación económica o conclusión como coste unitario. [REQUIERE AL AUTOR] Actualizar piezas consumidas, fabricación, conectores, montaje y calibración, indicando qué equipos/teléfono se excluyen y por qué; si no se consigue, omitir una cifra de coste actual.

### m7 · pp. 1–10; p. 9, afiliaciones y declaraciones


El PDF tiene 10 páginas. La guía de IEEE Sensors Journal establece normalmente ocho para artículos regulares y cargos obligatorios por exceso [S1]. No es un límite absoluto de admisión, pero contradice la intención de evitar cargos si se mantiene esa extensión final. Reducir duplicaciones y trasladar detalles reproducibles al suplemento sin retirar resultados esenciales. [REQUIERE AL AUTOR] Confirmar autoría, afiliaciones, contribuciones, financiación, conflictos y declaración de asistencia de IA; ajustar las afiliaciones a la plantilla de envío.

### m8 · pp. 3 y 9, III-C y VI


Conservar la ciencia ciudadana como motivación y evaluación futura. Una app en inglés desconectada no demuestra accesibilidad, competencia de usuarios ni participación. Mantener consentimiento, gobernanza y posibles aprobaciones como requisitos de ese estudio posterior; no redactar retrospectivamente que ya se cumplieron. No convertir turbidez en diagnóstico de contaminantes o seguridad de pescado.

## Comentarios confidenciales al editor


El manuscrito está explícitamente identificado como borrador visual y reconoce que los resultados son sintéticos. Mi recomendación negativa se basa en su inmadurez como investigación experimental, no en una imputación de conducta indebida. La validación pendiente comprende la aportación completa, por lo que una revisión mayor convencional sería insuficiente si se espera solo corregir texto. Una nueva presentación con resultados reales, construcción reproducible y contribución delimitada merecería una evaluación desde el inicio. El futuro estudio ciudadano puede permanecer fuera de ese artículo técnico.

## Recomendación


RECHAZAR la versión actual. La relevancia temática y el buen planteamiento de varias precauciones metrológicas no compensan la ausencia de resultados reales. La opción de revisión menor no es defendible; revisión mayor solo sería una etiqueta informal de trabajo interno, no mi recomendación editorial para este PDF. Ningún prompt de edición puede garantizar aceptación. La prioridad es cerrar M1–M9 con evidencia y verificar M10 frente a esa evidencia, antes de invertir en pulido final. Una versión nueva debe revisarse como V2 con su propio SHA-256 y tabla de estado de M1–M10 y m1–m8.

## Sugerencias de redacción


| Ubicación | Texto original | Propuesta | Motivo |
|---|---|---|---|

| R1 · p. 1, título | A Phone-Powered Open Turbidimeter | An Open Turbidimeter Powered by a Smartphone | Naturalidad y especificidad. Aplicar solo si no entra en conflicto con la delimitación de borrador exigida en M1. |

| R2 · p. 1, Abstract, segunda frase | An Android phone supplies USB power and the user interface, while a separate optical head combines an 850-nm emitter, a 90-degree scattering photodiode, an emitter-reference photodiode, and dark-signal subtraction. | An Android phone provides USB power and the user interface. A separate optical head combines an 850-nm emitter, a photodiode for 90-degree scattering, an emitter-reference photodiode, and dark-signal subtraction. | Claridad: divide la frase y evita que 90-degree parezca una propiedad del fotodiodo. |

| R3 · p. 1, Abstract, ensayos separados | Separate tests will hold one sensor fixed across three phones and apply its unchanged calibration to a second sensor. | Separate tests will compare one sensor across three phones and transfer its unchanged calibration to a second sensor. | Claridad: hace explícitas las dos comparaciones sin modificar el plan. |

| R4 · p. 1, I, primera parte | A numerical turbidity result therefore depends on a documented method and calibration. | A numerical turbidity result therefore requires a documented measurement method and calibration. | Precisión verbal: concreta el tipo de método. |

| R5 · p. 2, II, primera frase | The comparison in Table I is targeted rather than exhaustive. | Table I compares selected designs relevant to this study. | Concisión: expresa directamente la selección y su propósito. |

| R6 · p. 2, III-A, después de ecuación (1) | The ratio is not itself an NTU reading. | The ratio R is an uncalibrated optical index, not an NTU reading. | Claridad: identifica la variable y su estado actual; no introduce una prestación nueva. |

| R7 · p. 3, III-B, primer párrafo | The reserved RESULT frame is not emitted until a validated calibration exists. | The firmware withholds the reserved RESULT frame until a validated calibration is available. | Naturalidad: usa un sujeto y verbo concretos. |

| R8 · p. 4, IV, primera frase | Fig. 5 specifies the paired measurement and batch separation needed to interpret the calibration and independent tests. | Fig. 5 shows the paired measurements and batch separation used in the proposed calibration and independent tests. | Claridad y fluidez: conserva que se trata de pruebas propuestas. |

| R9 · p. 4, IV-A, controles periódicos | A single check level can detect change but cannot replace a multipoint recalibration. | A check at one level can detect a change, but it cannot replace multipoint recalibration. | Naturalidad: simplifica la construcción nominal. |

| R10 · p. 6, IV-E, registro | The current app’s five-column CSV is a useful local history but is not this complete research record. | The current app’s five-column CSV provides a local measurement history but lacks the fields required for this research record. | Claridad: explica de manera directa la insuficiencia ya declarada. |

| R11 · p. 7, V-D, interpretación | A small within-unit spread would indicate consistent readings but would not justify copying calibration. | Low variability within a unit would indicate consistent readings, but would not justify transferring its calibration. | Precisión terminológica y naturalidad sin cambiar la inferencia condicional. |

| R12 · p. 9, VI, gobernanza | The scientific purpose would be to support questions residents themselves ask about water conditions, while giving contributors access to the records and their uncertainty. | The aim would be to address residents’ own questions about water conditions and give contributors access to the measurements and their uncertainty. | Concisión: reduce nominalizaciones y mantiene el carácter futuro. |

| R13 · p. 9, VII, última frase | Community use requires subsequent evaluation. | Use by the community will require a separate evaluation. | Claridad: explicita la separación de la evaluación futura. |

## Referencias de apoyo


**S1. [IEEE Sensors Council · Guide for Authors y alcance de IEEE Sensors Journal](https://ieee-sensors.org/ieee-sensors-journal/for-authors/page/31/)**. Fuente oficial consultada: manuscritos completos, plantilla de dos columnas y extensión ordinaria de ocho páginas. Alcance: https://ieee-sensors.org/ieee-sensors-journal/.

**S2. [Pokela (2021) · Design, construction and calibration of a turbidity sensor in compliance with ISO 7027-1:2016](https://www.theseus.fi/bitstream/handle/10024/510274/Pokela_Jouko.pdf?sequence=2)**. Repositorio institucional: búsqueda indexada confirma alimentación/control por teléfono USB y Android Serial USB Terminal. La descarga íntegra no fue accesible en esta sesión; no se certificó el cumplimiento ISO que afirma el título.

**S3. [Kelley et al. (2014) · An Affordable Open-Source Turbidimeter](https://www.mdpi.com/1424-8220/14/4/7142)**. DOI 10.3390/s140407142. Texto del editor: comparación comercial y comprobación con materiales independientes; antecedente directo de transferencia de escala.

**S4. [Droujko y Molnar (2022) · Open-source, low-cost, in-situ turbidity sensor for river network monitoring](https://www.nature.com/articles/s41598-022-14228-4)**. DOI 10.1038/s41598-022-14228-4. Editor: varios prototipos replicados y comparación comercial. No se extrapola su desempeño al dispositivo revisado.

**S5. [EPA · Method 180.1, revision 2.0 (1993)](https://www.epa.gov/sites/default/files/2015-08/documents/method_180-1_1993.pdf)**. Fuente oficial: condiciones ópticas, estándares y controles, interferencias por burbujas, sedimentación y color. La ficha ISO 7027-1:2016 se consultó en https://www.iso.org/standard/62801.html; no se tuvo acceso al texto completo de la norma de pago.

**S6. [Bland y Altman (2007) · Agreement Between Methods of Measurement with Multiple Observations Per Individual](https://ora.ox.ac.uk/objects/uuid%3Aad6962cc-e146-404c-a424-84e7bb2afc95)**. DOI 10.1080/10543400701329422. Resumen institucional y versión de autores: https://eprints.whiterose.ac.uk/id/eprint/3411/1/Bland_2006_Agreement.pdf. Sustenta considerar observaciones agrupadas; el manuscrito ya lo cita.

**S7. [JCGM · Publications and Guides in Metrology](https://www.bipm.org/en/committees/jc/jcgm/publications)**. Página oficial con GUM, propagación Monte Carlo y VIM. Referencia adicional pertinente para definir el presupuesto de incertidumbre; la página por sí sola no constituye un análisis del equipo.

**S8. [Yallapragada et al. (2025) · ColorX: A Fitness Tracker-Based Device for Rapid, Optical Sensing of Water Quality Parameters](https://www.mdpi.com/1424-8220/25/16/4935)**. DOI 10.3390/s25164935; Sensors 25(16), 4935. Registro de autores: https://pure.mtu.ie/en/publications/colorx-a-fitness-tracker-based-device-for-rapid-optical-sensing-o/ y texto indexado en https://pmc.ncbi.nlm.nih.gov/articles/PMC12390361/. Fotodiodos, app, archivos abiertos, batería y Bluetooth; arquitectura diferente.

**S9. [Smartphones as a platform for molecular analysis: concepts, methods, devices and future potential (2025)](https://pubs.rsc.org/uk/content/articlehtml/2025/lc/d4lc00966e)**. DOI 10.1039/D4LC00966E. Revisión contextual localizada por búsqueda en RSC; su texto completo no pudo recuperarse. Sugerencia no bloqueante, no base de la recomendación.

**S10. [FFEM Water · manual de turbidez y código; HydroColor · código](https://ffem.io/manuals/turbidity/)**. Manual consultado: cámara, soporte, caja de luz y calibración guiada. Repositorios consultados: https://github.com/foundation-for-environmental-monitoring/ffem-app y https://github.com/Thomas-Leeuw/HydroColor. Respaldan antecedentes de interfaz y apertura; no validan esta app.

**S11. [Lee et al. (2026) · A Dual-Port, Smartphone-Linked, Pocket-Size Fluorimeter for Rapid Molecular Diagnostic Assays at Point of Care](https://pubmed.ncbi.nlm.nih.gov/42559496/)**. DOI 10.1109/JSEN.2026.3693175. Registro y texto indexado de autores: volumen 26(14), 20538–20555; confirma los datos de [30]. Es fluorescencia, no un antecedente directo de turbidez USB.

## Prompt de corrección


Véase el archivo autocontenido Prompt_correccion_Turbimeter_V1.md adjunto a esta revisión.