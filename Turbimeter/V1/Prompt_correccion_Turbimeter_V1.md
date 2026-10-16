# Prompt de corrección del turbidímetro V1

Trabaja sobre el manuscrito en inglés «A Phone-Powered Open Turbidimeter», un proyecto de artículo experimental de sensores para IEEE Sensors Journal. La revisión V1 corresponde al PDF de 10 páginas con encabezado del 12 de octubre de 2026 y SHA-256 `ba7de73f5814952773fca1f9c9cf3663a6ad4b5d74476088c392351db8fd17df`. Si recibes una versión diferente, identifica los cambios antes de aplicar ubicaciones. El PDF actual contiene un diseño, software de lectura y un plan de validación; el sistema óptico ensamblado no está validado. No supongas resultados reales a partir de las maquetas.

El objetivo es preparar una versión científicamente defendible y una lista explícita de evidencia pendiente. La aceptación editorial no puede garantizarse. Trabaja en una copia; conserva íntegro el original y sigue sus instrucciones de proyecto.

## Restricciones

- No inventes datos, resultados, análisis, citas, prestaciones, aprobaciones, autoría ni financiación. No conviertas una propuesta en un experimento realizado cambiando el tiempo verbal.
- Las cifras rojas, las observaciones de las figuras 6–9 y sus estadísticas son sintéticas, sin valor probatorio. La figura 8(a) es generada por IA. No las recolorees ni las reutilices como evidencia. Retíralas de un manuscrito destinado a envío, o consérvalas claramente identificadas solo en un anexo interno de planificación.
- Todo experimento, dato, análisis sobre datos no disponibles o confirmación pendiente se marca [REQUIERE AL AUTOR], indicando qué se necesita. Distingue esos casos de las correcciones que sí puedes efectuar con la documentación suministrada.
- La ciencia ciudadana en La Habana es futura. No inventes usuarios, despliegues, plataforma, consentimientos, aprendizaje ni efectos ambientales. El ensayo social no es condición para un artículo técnico si este limita su alcance al equipo.
- No afirmes conformidad ISO/EPA, intercambiabilidad universal NTU–FNU, exactitud trazable ni primacía de USB/teléfono/app a partir de comparación comercial.
- Conserva estructura y estilo salvo donde los cambios siguientes requieran reorganizar. No edites fuentes vecinas ajenas a este trabajo. Si la tarea posterior autoriza editar las versiones EN y ES, conserva su correspondencia.

## Cambios obligatorios para reconsiderar el artículo

### M1 · No existe todavía la evidencia central del artículo

**Ubicación en V1:** p. 1, Abstract; pp. 2–3, III-A/B; pp. 6–9, V y VII.

**Problema:** El resumen declara que no se ha validado el sistema óptico ensamblado. III-A indica que ambas placas están colocadas pero sin rutear; III-B solo documenta carga, PING y ADC_MISSING sin ADS1115 conectado. La sección V reemplaza los resultados por observaciones inventadas. Esos elementos no demuestran medición de turbidez, funcionamiento del conjunto, repetibilidad ni portabilidad de calibración.

**Acción:** [REQUIERE AL AUTOR] Construir y documentar la revisión realmente ensayada, adquirir datos ópticos reales, calibrarla y evaluarla con muestras independientes. Sustituir íntegramente las maquetas y sus estadísticas. Mientras falte esa evidencia, conservar el documento como borrador/protocolo y describirlo así en título, resumen y conclusión; cambiar el tiempo verbal no convierte un plan en un artículo validado.

**Criterio de hecho:** Todas las prestaciones reclamadas se vinculan a archivos de datos, ensayos realizados y análisis reproducibles; no queda ningún resultado sintético presentado como resultado del dispositivo. La recomendación solo puede reconsiderarse tras revisar esa evidencia.

### M2 · La implementación no es reproducible a partir del PDF

**Ubicación en V1:** p. 2, III-A y ecuación (1); p. 4, figura 3; p. 6, IV-E.

**Problema:** No se especifican de forma suficiente la polaridad y el punto de trabajo de los transimpedancia, el modelo y espectro del LED, la corriente real, las aperturas y ángulos de aceptación, el acoplamiento del monitor, los ajustes del ADC ni la secuencia temporal. Cuatro lecturas off/on pueden significar promediar señales antes del cociente o promediar cocientes: no son operaciones idénticas. Tampoco se presenta una revisión fabricable y ensayada de la conexión USB.

**Acción:** Publicar esquema eléctrico, dimensiones ópticas y lista exacta de piezas de la revisión final, configuración PGA/canales/tasa del ADS1115, tiempos de estabilización y orden de lecturas, fórmula de promediado y umbrales de error. [REQUIERE AL AUTOR] Medir señales y ruido, polaridad, saturación, aislamiento óptico, corriente LED, montaje y operación USB con el conjunto real; aportar fotografías y archivos de fabricación coincidentes.

**Criterio de hecho:** Un tercero puede ensamblar la misma revisión y reconstruir cada R desde los canales crudos y la secuencia documentada, sin deducir parámetros esenciales de una visualización.

### M3 · La calibración por transferencia carece de anclaje y protocolo material definidos

**Ubicación en V1:** pp. 4–5, IV-A y figura 5; p. 10, referencias [1], [3], [4].

**Problema:** Es admisible asignar valores mediante un comparador; la ausencia de formazina en el prototipo no invalida por sí sola el enfoque. Pero no se identifica el comparador real ni la suspensión, su preparación, estabilidad, homogeneización, temperatura, cubeta o ventana temporal de lectura. Un certificado o historial de servicio no sustituye la verificación de desempeño el día del ensayo. Adoptar el rótulo del comparador tampoco iguala las respuestas espectrales y geométricas de los dos instrumentos [S3, S5].

**Acción:** [REQUIERE AL AUTOR] Identificar modelo, método óptico, unidad, calibración y verificaciones del comparador, materiales usados, blancos y controles independientes. Describir composición/lotes y un procedimiento de mezcla, tiempo máximo entre lecturas, limpieza y orientación de cubetas; comprobar estabilidad por lecturas que enmarquen cada comparación. Definir la magnitud como equivalente al modelo/método del comparador y limitar su validez a matrices y rangos ensayados. Si no hay controles certificados disponibles, justificar la alternativa y explicitar la limitación de incertidumbre y trazabilidad.

**Criterio de hecho:** Cada valor asignado conserva su procedencia y controles; las discrepancias por método y matriz se evalúan o delimitan. No se afirma cumplimiento ISO/EPA ni equivalencia universal NTU–FNU.

### M4 · El plan estadístico no permite decidir aceptación o fracaso

**Ubicación en V1:** p. 5, IV-B y tabla II; pp. 5–6, IV-C/D.

**Problema:** La regla |y − y_ref| ≤ a + b y_ref tiene a y b sin justificar; tampoco se fijan tamaño muestral, número de construcciones, días, operadores, lotes o márgenes entre teléfonos/unidades. Reconocer los conglomerados es correcto, pero falta especificar el estimador y la población objetivo. No se define si el criterio se aplica a una lectura, al promedio de varias o a una proporción de muestras. Un RMSE agrupado puede ocultar fallos en una matriz o en el extremo bajo.

**Acción:** Antes del conjunto final de evaluación, fijar rango de uso, tolerancias justificadas por el objetivo técnico, unidad de resultado, fracción mínima de mediciones conformes y tratamiento de fallos. [REQUIERE AL AUTOR] Diseñar y justificar cantidades de lotes, unidades, teléfonos, operadores y días según la precisión requerida de intervalos/contrastes. Especificar un análisis de medidas repetidas, por ejemplo modelo jerárquico o remuestreo por lote, con intervalos para sesgo, error, límites de acuerdo y proporción conforme; evaluar heterocedasticidad. [33]–[34] ya ofrecen una base pertinente [S6].

**Criterio de hecho:** Un plan fechado anterior al hold-out permite decidir cumplimiento con incertidumbre por rango y matriz, usando el número real de muestras independientes y todos los intentos. No se copian los tamaños ficticios de V como justificación.

### M5 · Selección del modelo e incertidumbre de predicción insuficientes

**Ubicación en V1:** p. 4, IV-A, párrafo sobre fit family; p. 5, IV-B; pp. 6–7, V-A/E.

**Problema:** Separar preparaciones es adecuado, pero no se explica cómo elegir familia, ponderación, transformaciones y rango sin utilizar el hold-out. Repetir diluciones de un mismo stock o muestras del mismo evento puede dejar dependencia aun usando distintos identificadores. No hay un presupuesto que integre ruido de canales, ajuste, asignación del comparador, manejo y variabilidad entre días. Un coeficiente de determinación alto, o error pequeño sobre datos usados para seleccionar el modelo, no resolvería estas carencias.

**Acción:** Definir entrenamiento y selección interna del modelo por grupos, reservar el hold-out final y congelar tanto coeficientes como rango y reglas de invalidez. [REQUIERE AL AUTOR] Evaluar residuos, falta de ajuste, efecto de matriz e incertidumbre de resultados individuales, incluyendo incertidumbre del comparador y de calibración. Elegir tratamiento de error en ambas variables si la incertidumbre del comparador resulta relevante. Para reclamar utilidad en agua ambiental, incluir muestras naturales independientes; si no se obtienen, restringir las conclusiones a las suspensiones ensayadas.

**Criterio de hecho:** Se entregan particiones por stock/lote/evento y fechas, reglas congeladas y predicciones externas con intervalos y límites de uso. El tratamiento de incertidumbre sigue un modelo documentado, apoyado cuando corresponda en JCGM [S7].

### M6 · La normalización y la política cerca del blanco necesitan validación

**Ubicación en V1:** p. 2, III-A, ecuación (1) y párrafo posterior; p. 5, IV-B; p. 8, figura 7(a/b/d).

**Problema:** Dividir por L_on − L_off puede reducir fluctuaciones comunes, pero también amplifica ruido si el denominador es débil; un monitor aislado de la muestra no corrige necesariamente color, reflexión o cambios geométricos. Además, rechazar toda dispersión corregida negativa cerca del blanco puede seleccionar solo fluctuaciones positivas y sesgar los resultados válidos. Es una posibilidad inferida de la regla descrita, no un fallo experimental demostrado. El CV deja de ser útil cuando la media se aproxima a cero.

**Acción:** [REQUIERE AL AUTOR] Comparar R y dispersión corregida sola con calibraciones y evaluación independientes comparables, bajo perturbaciones medidas de emisor/alimentación. Evaluar incertidumbre y covarianza de canales y fijar un umbral del denominador basado en señal/ruido. Conservar señales negativas en el registro de investigación y distinguir señal no cuantificable de fallo de hardware; no forzar un valor NTU. Medir blancos y niveles bajos, informar SD/error absoluto y justificar límite de cuantificación/rango inferior mediante un criterio definido.

**Criterio de hecho:** La ventaja o ausencia de ventaja del cociente se demuestra con datos; se reportan fallos y resultados bajo rango sin censura oculta. No se estima detección ni repetibilidad a cero mediante CV.

### M7 · El alcance de los ensayos entre teléfonos y sensores debe fijarse

**Ubicación en V1:** p. 1, pregunta final de I; p. 5, tabla II y IV-C; p. 6, IV-D; pp. 6–9, V-C/D y figuras 8–9.

**Problema:** El ensayo de un sensor con tres teléfonos estima diferencias para ese sensor y esos teléfonos; no permite estimar una interacción sensor–teléfono ni variación poblacional de Android. Una pareja donante–receptor tampoco permite concluir portabilidad de fabricación. El texto reconoce ambas limitaciones, pero la pregunta introductoria sobre unidades ensambladas independientemente y teléfonos compatibles exige decidir cuánto alcance tendrá la respuesta final. Las barras de SD de las maquetas no son intervalos de equivalencia.

**Acción:** [REQUIERE AL AUTOR] Ejecutar comparaciones pareadas y aleatorizadas, con referencias que controlen evolución de la muestra, registro de cables/adaptadores y todos los fallos. Si se reclama generalización entre kits, incluir construcciones y pares donante–receptor independientes suficientes para la inferencia, y cruzar sensores/teléfonos/operadores. Si el alcance es exploratorio, limitarlo expresamente a los dispositivos ensayados. Fijar márgenes de equivalencia y dar intervalos sobre diferencias, además de la comparación individual contra referencia.

**Criterio de hecho:** El alcance de resumen, métodos y conclusión coincide con las unidades independientes realmente estudiadas. La transferencia usa f_A congelada sin ajuste de B; una recalibración posterior se analiza por separado.

### M8 · Robustez y demanda energética siguen siendo una lista de intenciones

**Ubicación en V1:** p. 3, III-C; p. 5, IV-B/tabla II; p. 6, V-B; p. 8, figura 7.

**Problema:** El artículo propone pruebas de luz, burbujas, reinserción, deriva y batería, pero no fija condiciones ni criterios. Falta incorporar temperatura del agua/electrónica y caracterizar interferencias relevantes para el alcance ambiental que se reclame. Una traza sintética de 60 minutos no define un intervalo de verificación; una corriente del cabezal no representa por sí sola la carga del teléfono, que incluye pantalla, conversión y aplicación. El uso futuro en la bahía no justifica asumir comportamiento frente a matrices costeras.

**Acción:** [REQUIERE AL AUTOR] Especificar y ejecutar condiciones controladas de manejo, luz y temperatura; extender estabilidad a los días/tiempo de uso que se pretenda cubrir. Evaluar matrices representativas, incluidas condiciones costeras si se reclama ese alcance, o declarar su exclusión. Medir tensión y corriente USB en reposo y adquisición, energía por medida y consumo incremental del teléfono frente a un estado base comparable. Determinar intervalos de chequeo y límites de cambio con datos; si no se ensayan, retirarlos como prestación.

**Criterio de hecho:** Se informan condiciones, réplicas independientes, incertidumbre, fallos y restricciones. El artículo distingue ausencia de batería propia del sensor de consumo energético nulo o autonomía demostrada.

### M9 · Faltan registros completos y una liberación abierta verificable

**Ubicación en V1:** p. 3, III-B; p. 6, IV-E; p. 9, Declarations for Submission; p. 10, [17].

**Problema:** El CSV actual carece de canales crudos, identificación del sensor y otros campos esenciales; el manuscrito reconoce que aún no es un registro de investigación. No se aportan resultados de integridad de extremo a extremo ni una liberación completa de la revisión ensayada. La referencia a un commit de desarrollo no sustituye esa liberación. El acceso web al commit [17] no pudo comprobarse en esta revisión; esto no demuestra que sea inexistente o privado.

**Acción:** Completar el registro en la app o mediante adquisición auxiliar vinculada de forma inequívoca por ID de medida. [REQUIERE AL AUTOR] Probar tramas válidas, incompletas, duplicadas, malformadas y sintéticas, desconexión/reinicio/exportación y restauración de calibración; aportar casos y resultados. Depositar esquemas, PCB final, carcasa, firmware/app, instrucciones, licencias por componente, datos crudos y análisis en una versión persistente que corresponda a los ensayos. Verificar que el paquete permite regenerar tablas y figuras.

**Criterio de hecho:** Cada resultado se reconstruye desde sus canales y metadatos; no entra demo en el conjunto real ni un cociente sin calibrar aparece como NTU. El paquete y sus licencias son accesibles y coherentes con la revisión fabricada.

### M10 · La ventaja científica de la combinación propuesta debe demostrarse

**Ubicación en V1:** pp. 1–3, I–II y tabla I; p. 7, V-E; p. 9, VII.

**Problema:** La tabla I explica antecedentes, pero la fila propia solo ofrece validación pendiente. Añadir USB, un monitor de LED y metadatos a piezas conocidas no acredita por sí solo una contribución suficiente. Falta considerar ColorX (2025), un lector externo con fotodiodos, app, archivos abiertos y ensayo de turbidez, aunque usa otra óptica, batería y Bluetooth [S8]. No atribuyo prioridad universal a ese antecedente ni considero obligatoria una lista extensa de citas.

**Acción:** Actualizar la comparación con los antecedentes más próximos, en especial Pokela, Kelley, diseños de múltiples unidades y ColorX. Formular una pregunta concreta: por ejemplo, qué error y variabilidad conserva un cabezal alimentado por diferentes teléfonos con calibración y procedencia explícitas. [REQUIERE AL AUTOR] Responderla con los ensayos anteriores y una comparación pertinente de prestaciones, reproducibilidad y coste; separar ventajas demostradas de decisiones de diseño. Si el resultado solo alcanza viabilidad limitada, presentar ese alcance con honestidad y reevaluar su encaje editorial.

**Criterio de hecho:** Introducción y conclusión identifican una aportación demostrada y sus límites frente a precedentes; no reclaman primacía del USB, del teléfono, de la geometría ni del hardware abierto.

## Cambios recomendados y preparación editorial

- **m1 (p. 10, bibliografía completa):** La comprobación de metadatos no reveló una referencia central inventada. Se consultaron 36 DOI tomados de la bibliografía auxiliar: 35 resolvieron en Crossref y Kelley [5] se comprobó en el editor tras un fallo de esa consulta. Resolver un DOI no acredita que cada frase esté respaldada por el texto completo. Añadir DOI a los artículos donde corresponda, homogeneizar fechas de acceso de recursos web y verificar los permisos/licencias en versiones concretas. No sustituir 2022 por 2021 en OpenOBS sin distinguir publicación anticipada de volumen final.

- **m2 (pp. 1–3, I–II y tabla I):** Añadir ColorX como antecedente cercano [S8], evitando presentar su transreflectancia verde/Bluetooth como equivalente a nephelometría infrarroja/USB. Una revisión general de plataformas de análisis con teléfonos de 2025 puede aportar contexto [S9], pero no es una cita bloqueante ni demuestra rendimiento del diseño propuesto. La literatura faltante debe mejorar la comparación, no aumentar el número de citas por sí mismo.

- **m3 (pp. 7–9, ejes y pies de figuras 6–9):** Al sustituir las maquetas, emplear un nombre uniforme de la unidad y definir signo de error, denominador del error relativo, número de lotes y significado exacto de barras. No mezclar SD dentro de conexión, SD entre muestras e intervalo del sesgo. En el extremo de blanco usar unidades absolutas. Las curvas y colores de las maquetas no deben sobrevivir como evidencia sin regeneración desde datos reales.

- **m4 (p. 8, figura 7(b); pp. 7–8, final de V-E):** La leyenda de 7(b) cubre una parte apreciable de la traza del cociente. Reubicarla en el gráfico definitivo. El final de V-E queda separado por una página de figuras y aparece como dos líneas aisladas al pie de p. 8; mantener ese párrafo unido o mover las figuras para no interrumpir la lectura. Son ajustes de presentación, no defectos de los datos sintéticos.

- **m5 (p. 1, resumen gráfico; p. 2, figura 1; p. 4, figura 3):** El resumen gráfico duplica la figura 1. Diferenciar sus funciones o condensar la figura en el cuerpo. En el esquema indicar direcciones de alimentación, transmisión digital y transformación de datos con claridad: la posición de las flechas no debe sugerir que el teléfono genera por sí mismo la calibración. En la figura 3 final aumentar etiquetas y ofrecer cotas reproducibles en el suplemento.

- **m6 (p. 6, IV-E, párrafo EUR 76.52):** El importe corresponde a una cesta anterior y se identifica correctamente como no representativo del coste actual. No usarlo en resumen, comparación económica o conclusión como coste unitario. [REQUIERE AL AUTOR] Actualizar piezas consumidas, fabricación, conectores, montaje y calibración, indicando qué equipos/teléfono se excluyen y por qué; si no se consigue, omitir una cifra de coste actual.

- **m7 (pp. 1–10; p. 9, afiliaciones y declaraciones):** El PDF tiene 10 páginas. La guía de IEEE Sensors Journal establece normalmente ocho para artículos regulares y cargos obligatorios por exceso [S1]. No es un límite absoluto de admisión, pero contradice la intención de evitar cargos si se mantiene esa extensión final. Reducir duplicaciones y trasladar detalles reproducibles al suplemento sin retirar resultados esenciales. [REQUIERE AL AUTOR] Confirmar autoría, afiliaciones, contribuciones, financiación, conflictos y declaración de asistencia de IA; ajustar las afiliaciones a la plantilla de envío.

- **m8 (pp. 3 y 9, III-C y VI):** Conservar la ciencia ciudadana como motivación y evaluación futura. Una app en inglés desconectada no demuestra accesibilidad, competencia de usuarios ni participación. Mantener consentimiento, gobernanza y posibles aprobaciones como requisitos de ese estudio posterior; no redactar retrospectivamente que ya se cumplieron. No convertir turbidez en diagnóstico de contaminantes o seguridad de pescado.

La actualización bibliográfica que afecte a la afirmación de novedad forma parte de M10. Resolver autoría/declaraciones y requisitos de envío es obligatorio antes de someter el artículo; los ajustes de estilo y disposición visual son no bloqueantes para su evaluación científica.

## Sugerencias literales de redacción

Aplica estos reemplazos solo si siguen siendo compatibles con los cambios científicos obligatorios. No introducen resultados ni cambian cifras. Si el pasaje cambia de contenido, registra que el reemplazo deja de aplicar.

### R1 · p. 1, título

Original: A Phone-Powered Open Turbidimeter

Propuesta: An Open Turbidimeter Powered by a Smartphone

Motivo: Naturalidad y especificidad. Aplicar solo si no entra en conflicto con la delimitación de borrador exigida en M1.

### R2 · p. 1, Abstract, segunda frase

Original: An Android phone supplies USB power and the user interface, while a separate optical head combines an 850-nm emitter, a 90-degree scattering photodiode, an emitter-reference photodiode, and dark-signal subtraction.

Propuesta: An Android phone provides USB power and the user interface. A separate optical head combines an 850-nm emitter, a photodiode for 90-degree scattering, an emitter-reference photodiode, and dark-signal subtraction.

Motivo: Claridad: divide la frase y evita que 90-degree parezca una propiedad del fotodiodo.

### R3 · p. 1, Abstract, ensayos separados

Original: Separate tests will hold one sensor fixed across three phones and apply its unchanged calibration to a second sensor.

Propuesta: Separate tests will compare one sensor across three phones and transfer its unchanged calibration to a second sensor.

Motivo: Claridad: hace explícitas las dos comparaciones sin modificar el plan.

### R4 · p. 1, I, primera parte

Original: A numerical turbidity result therefore depends on a documented method and calibration.

Propuesta: A numerical turbidity result therefore requires a documented measurement method and calibration.

Motivo: Precisión verbal: concreta el tipo de método.

### R5 · p. 2, II, primera frase

Original: The comparison in Table I is targeted rather than exhaustive.

Propuesta: Table I compares selected designs relevant to this study.

Motivo: Concisión: expresa directamente la selección y su propósito.

### R6 · p. 2, III-A, después de ecuación (1)

Original: The ratio is not itself an NTU reading.

Propuesta: The ratio R is an uncalibrated optical index, not an NTU reading.

Motivo: Claridad: identifica la variable y su estado actual; no introduce una prestación nueva.

### R7 · p. 3, III-B, primer párrafo

Original: The reserved RESULT frame is not emitted until a validated calibration exists.

Propuesta: The firmware withholds the reserved RESULT frame until a validated calibration is available.

Motivo: Naturalidad: usa un sujeto y verbo concretos.

### R8 · p. 4, IV, primera frase

Original: Fig. 5 specifies the paired measurement and batch separation needed to interpret the calibration and independent tests.

Propuesta: Fig. 5 shows the paired measurements and batch separation used in the proposed calibration and independent tests.

Motivo: Claridad y fluidez: conserva que se trata de pruebas propuestas.

### R9 · p. 4, IV-A, controles periódicos

Original: A single check level can detect change but cannot replace a multipoint recalibration.

Propuesta: A check at one level can detect a change, but it cannot replace multipoint recalibration.

Motivo: Naturalidad: simplifica la construcción nominal.

### R10 · p. 6, IV-E, registro

Original: The current app’s five-column CSV is a useful local history but is not this complete research record.

Propuesta: The current app’s five-column CSV provides a local measurement history but lacks the fields required for this research record.

Motivo: Claridad: explica de manera directa la insuficiencia ya declarada.

### R11 · p. 7, V-D, interpretación

Original: A small within-unit spread would indicate consistent readings but would not justify copying calibration.

Propuesta: Low variability within a unit would indicate consistent readings, but would not justify transferring its calibration.

Motivo: Precisión terminológica y naturalidad sin cambiar la inferencia condicional.

### R12 · p. 9, VI, gobernanza

Original: The scientific purpose would be to support questions residents themselves ask about water conditions, while giving contributors access to the records and their uncertainty.

Propuesta: The aim would be to address residents’ own questions about water conditions and give contributors access to the measurements and their uncertainty.

Motivo: Concisión: reduce nominalizaciones y mantiene el carácter futuro.

### R13 · p. 9, VII, última frase

Original: Community use requires subsequent evaluation.

Propuesta: Use by the community will require a separate evaluation.

Motivo: Claridad: explicita la separación de la evaluación futura.

## Fuentes de apoyo verificadas o localizadas

Los identificadores S1–S11 usados arriba se refieren a estas fuentes. La comprobación de metadatos no sustituye la lectura del texto que respalda cada afirmación. Las limitaciones de acceso se indican para que no se afirme una verificación inexistente.

- **S1:** IEEE Sensors Council · Guide for Authors y alcance de IEEE Sensors Journal. https://ieee-sensors.org/ieee-sensors-journal/for-authors/page/31/. Fuente oficial consultada: manuscritos completos, plantilla de dos columnas y extensión ordinaria de ocho páginas. Alcance: https://ieee-sensors.org/ieee-sensors-journal/.

- **S2:** Pokela (2021) · Design, construction and calibration of a turbidity sensor in compliance with ISO 7027-1:2016. https://www.theseus.fi/bitstream/handle/10024/510274/Pokela_Jouko.pdf?sequence=2. Repositorio institucional: búsqueda indexada confirma alimentación/control por teléfono USB y Android Serial USB Terminal. La descarga íntegra no fue accesible en esta sesión; no se certificó el cumplimiento ISO que afirma el título.

- **S3:** Kelley et al. (2014) · An Affordable Open-Source Turbidimeter. https://www.mdpi.com/1424-8220/14/4/7142. DOI 10.3390/s140407142. Texto del editor: comparación comercial y comprobación con materiales independientes; antecedente directo de transferencia de escala.

- **S4:** Droujko y Molnar (2022) · Open-source, low-cost, in-situ turbidity sensor for river network monitoring. https://www.nature.com/articles/s41598-022-14228-4. DOI 10.1038/s41598-022-14228-4. Editor: varios prototipos replicados y comparación comercial. No se extrapola su desempeño al dispositivo revisado.

- **S5:** EPA · Method 180.1, revision 2.0 (1993). https://www.epa.gov/sites/default/files/2015-08/documents/method_180-1_1993.pdf. Fuente oficial: condiciones ópticas, estándares y controles, interferencias por burbujas, sedimentación y color. La ficha ISO 7027-1:2016 se consultó en https://www.iso.org/standard/62801.html; no se tuvo acceso al texto completo de la norma de pago.

- **S6:** Bland y Altman (2007) · Agreement Between Methods of Measurement with Multiple Observations Per Individual. https://ora.ox.ac.uk/objects/uuid%3Aad6962cc-e146-404c-a424-84e7bb2afc95. DOI 10.1080/10543400701329422. Resumen institucional y versión de autores: https://eprints.whiterose.ac.uk/id/eprint/3411/1/Bland_2006_Agreement.pdf. Sustenta considerar observaciones agrupadas; el manuscrito ya lo cita.

- **S7:** JCGM · Publications and Guides in Metrology. https://www.bipm.org/en/committees/jc/jcgm/publications. Página oficial con GUM, propagación Monte Carlo y VIM. Referencia adicional pertinente para definir el presupuesto de incertidumbre; la página por sí sola no constituye un análisis del equipo.

- **S8:** Yallapragada et al. (2025) · ColorX: A Fitness Tracker-Based Device for Rapid, Optical Sensing of Water Quality Parameters. https://www.mdpi.com/1424-8220/25/16/4935. DOI 10.3390/s25164935; Sensors 25(16), 4935. Registro de autores: https://pure.mtu.ie/en/publications/colorx-a-fitness-tracker-based-device-for-rapid-optical-sensing-o/ y texto indexado en https://pmc.ncbi.nlm.nih.gov/articles/PMC12390361/. Fotodiodos, app, archivos abiertos, batería y Bluetooth; arquitectura diferente.

- **S9:** Smartphones as a platform for molecular analysis: concepts, methods, devices and future potential (2025). https://pubs.rsc.org/uk/content/articlehtml/2025/lc/d4lc00966e. DOI 10.1039/D4LC00966E. Revisión contextual localizada por búsqueda en RSC; su texto completo no pudo recuperarse. Sugerencia no bloqueante, no base de la recomendación.

- **S10:** FFEM Water · manual de turbidez y código; HydroColor · código. https://ffem.io/manuals/turbidity/. Manual consultado: cámara, soporte, caja de luz y calibración guiada. Repositorios consultados: https://github.com/foundation-for-environmental-monitoring/ffem-app y https://github.com/Thomas-Leeuw/HydroColor. Respaldan antecedentes de interfaz y apertura; no validan esta app.

- **S11:** Lee et al. (2026) · A Dual-Port, Smartphone-Linked, Pocket-Size Fluorimeter for Rapid Molecular Diagnostic Assays at Point of Care. https://pubmed.ncbi.nlm.nih.gov/42559496/. DOI 10.1109/JSEN.2026.3693175. Registro y texto indexado de autores: volumen 26(14), 20538–20555; confirma los datos de [30]. Es fluorescencia, no un antecedente directo de turbidez USB.

## Salida esperada

1. Texto revisado en inglés de los pasajes que puedan corregirse con la evidencia disponible, sin fabricar una sección de resultados. Si faltan los ensayos, entregar un borrador identificado como diseño/protocolo y pendiente de validación, nunca como artículo listo para aceptación.
2. Tabla de cambios con columnas: ID M/m/R, estado (resuelto/parcial/no resuelto), modificación, ubicación nueva y evidencia o motivo de pendiente.
3. Lista [REQUIERE AL AUTOR] con experimento/dato/confirmación, criterio de cierre y afirmaciones que permanecen suspendidas.
4. Si se suministran datos reales, separar entrenamiento/selección/hold-out por grupos; entregar análisis reproducible, datos de entrada y regeneración de figuras, sin seleccionar silenciosamente solo ensayos favorables.
5. Comprobación final de coherencia entre título, resumen, métodos, figuras y conclusión; identificación del nuevo PDF mediante SHA-256. No declarar que el artículo es perfecto ni garantizar aceptación.
