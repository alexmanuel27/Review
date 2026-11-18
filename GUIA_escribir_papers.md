# Guía para escribir y mejorar un paper científico (para cualquier chat de Claude)

Esta guía es para un chat **fuera** del proyecto «revision por pares». Resume qué habilidades (skills) usar y cómo escribir un artículo para que una revista de primer nivel lo acepte con el menor número de rondas. Autor de los artículos: Alex Manuel Rivera-Rivera. Idioma de trabajo con Alex: español; el artículo, en el idioma de la revista.

Última actualización: 2026-11-18. La versión completa y viva del método está en el proyecto Claude «revision por pares», doc `claude/protocolo-revision.md`. Si estás en ese proyecto, manda ese protocolo, no esta guía.

---

## 1. Reglas que no se negocian

1. **No inventar nada:** ni datos, ni cifras, ni resultados, ni citas, ni detalles de métodos. Lo que falte se marca `[REQUIERE AL AUTOR: …]` o `[EXPERIMENTO E1 — resultado pendiente]`.
2. **Cada afirmación dentro de su evidencia.** Si los datos no lo sostienen, se rebaja o se quita.
3. **Presentación estratégica, sí; falsear, no.**
   - SÍ: dar más espacio a los resultados sólidos; ordenar y titular para destacar la contribución; limitaciones breves y constructivas; resultados secundarios o débiles al suplemento; elegir qué figuras van al texto principal; conclusiones en positivo dentro de lo que los datos sostienen.
   - CONDICIÓN: un resultado desfavorable que afecta a una conclusión no desaparece; se menciona en una frase o va al suplemento. Métricas, muestras y exclusiones siempre declaradas.
   - NO: alterar datos, ocultar lo que contradice la conclusión, excluir muestras tras ver el resultado sin declararlo, afirmar más de lo que muestran los datos.
4. **Aplicar, no proponer.** Si un cambio es de redacción o de presentación, se hace directamente y se informa. Solo se pregunta (en UNA tanda, con recomendación) lo que cambia conclusiones, título, cifras del resumen o afecta a coautores y preprints.
5. **Redacción sin tope.** Si para que suene natural y sea aceptable hay que reescribir el paper entero, se reescribe.

## 2. Habilidades: cuáles y en qué orden

**Úsalas de verdad:** invoca cada una con la herramienta `Skill` y sigue sus instrucciones. Leer esta guía y «aplicarlas de cabeza» no cuenta. Crea una lista de tareas con un paso por skill. Si una no está disponible, dilo al principio y haz el paso a mano.

| Paso | Qué se hace | Skill(s) |
|---|---|---|
| 1. Lectura y revista | Leer todo (figuras incluidas), datos y scripts si los hay; guía de autores: límites, formato, política de IA y preprints | `claude-scientific-writer:venue-templates` + búsqueda web |
| 2. Diagnóstico científico | Afirmaciones frente a evidencia, controles y comparaciones que faltan, estadística, validez | `claude-scientific-writer:peer-review` + `research-desk:paper-critique` (contrastar las dos) + `claude-scientific-writer:scientific-critical-thinking` |
| 3. Integridad | Etiquetar cada afirmación por su respaldo; recalcular toda cifra comprobable | `research-integrity:research-integrity` |
| 4. Referencias | Que existan, que el DOI resuelva y que **cada cita apoye su frase** | `research-desk:citation-check` (toda la bibliografía) + `claude-scientific-writer:citation-management` |
| 5. Literatura nueva (si hace falta) | Estado del arte reciente, trabajos rivales, posicionamiento | `claude-scientific-writer:research-lookup` / `literature-review`, `research-desk:related-work`, `research-desk:paper-compare` |
| 6. Decisiones de enfoque | Elegir entre 2–3 enfoques, títulos o revistas | `research-desk:decision-matrix` o `research-desk:llm-council` |
| 7. Experimentos nuevos | Diseño concreto: objetivo, montaje, n, controles, análisis, coste, prioridad | `claude-scientific-writer:hypothesis-generation` |
| 8. Escritura | Coherencia de términos y cifras; reescritura completa | `copy-editing:style-sheet`, luego `copy-editing:redline-edit` (nivel alto) + `claude-scientific-writer:scientific-writing` |
| 9. Extensión | Ajustar a palabras o páginas sin perder hechos | `copy-editing:cut-to-length` |
| 10. Figuras y esquemas | Esquemas del montaje o del método; gráficas con datos | `claude-scientific-writer:scientific-schematics`, `dataviz` |
| 11. Formatos | PDF, Word, LaTeX, pósters, diapositivas | `pdf`, `docx`, `claude-scientific-writer:latex-posters`, `scientific-slides` |
| 12. Prueba final | Erratas, recuentos, fechas, marcadores sobrantes → Ship / Hold | `copy-editing:proofread` |
| 13. Autorevisión | Releer como árbitro de esa revista y estimar qué objeciones quedan | `claude-scientific-writer:peer-review` / `research-desk:llm-council` |

Al final, una tabla **Paso | Skill | Invocada (sí/no) | Qué encontró o cambió**, y lo que no se pudo verificar.

## 3. Cómo escribir cada parte

**Título.** Dice el resultado o la contribución, no el tema. Concreto, sin siglas sin definir, sin «novel», «first» ni «rarely» si no se puede probar.

**Resumen (*abstract*).** Contexto (1 frase) → problema o hueco (1) → qué se hizo (1–2) → resultados principales **con cifras** (2–3) → qué significa (1). Ninguna cifra o afirmación que no esté en el cuerpo. Respetar el límite de palabras de la revista. Sin introducción larga.

**Highlights / puntos clave** (si la revista los pide). Cada uno, una afirmación respaldada en Resultados; deben decir lo mismo que el resumen y las conclusiones, no más.

**Introducción.** Embudo: problema general → qué se sabe (con citas recientes y rivales) → qué falta exactamente → qué hace este trabajo y por qué importa. Termina con la contribución en 2–3 puntos claros. No repasar literatura que no sirva para justificar el hueco.

**Métodos.** Reproducibles: equipo con fabricante y modelo, versiones de software, muestras y n, condiciones, preprocesado, criterios de exclusión **declarados antes de ver el resultado**, cómo se eligieron modelos e hiperparámetros (sin usar los datos de validación), métricas definidas, estadística e incertidumbre. Código y datos con enlace o DOI.

**Resultados.** En el orden de la historia, no en el orden en que se hicieron. Cada párrafo empieza por el hallazgo, no por «Figure 3 shows». Cifras con incertidumbre y n. Separar lo observado de la interpretación.

**Discusión.** Qué significan los resultados, comparación cuantitativa con trabajos previos, mecanismo (como hipótesis si no está probado), limitaciones breves y concretas, y qué haría falta para superarlas.

**Conclusiones.** Solo lo que los datos sostienen. Sin cifras nuevas. Coherentes con resumen y highlights.

**Figuras y tablas.** Cada figura demuestra una afirmación del texto. Pies autosuficientes (qué se muestra, n, qué son las barras o bandas, unidades). Ejes con magnitud y unidad. Paletas legibles en gris y para daltónicos. Las cifras de una tabla deben cuadrar con lo que se ve en la figura.

**Declaraciones.** Disponibilidad de datos y código, conflictos de interés, financiación, contribuciones (CRediT) y **uso de IA** según la política de la revista.

## 4. Estilo de redacción

- Frases con sujeto y verbo; una idea por frase; párrafos con frase temática.
- Voz activa cuando el agente importa («We measured…»); pasiva solo si el agente no importa.
- Palabras precisas: «increased by 12 %» mejor que «significantly improved» (usar *significant* solo en sentido estadístico).
- Un término por concepto en todo el texto (la hoja de estilo lo fija); siglas definidas la primera vez en resumen y cuerpo.
- Sin relleno («It is worth noting that», «In order to»), sin listas de matices encadenadas, sin estilo de notas telegráficas.
- Que suene humano y natural: variar la longitud de las frases y evitar las muletillas típicas de IA («delve», «crucial», «pivotal», «landscape», «furthermore» en cada párrafo).
- Ortografía y convenciones de la revista (US/UK, coma serial, formato de unidades y números, estilo de citas).
- Tiempos verbales: pasado para lo que se hizo y se observó; presente para lo establecido y lo que muestran las figuras.

## 5. Comprobaciones antes de entregar (lecciones aprendidas)

- [ ] Toda cifra repetida (resumen, texto, tablas, figuras, conclusiones) es idéntica.
- [ ] Las tablas de recuentos suman su n; el número de referencias declarado cuadra con las citadas.
- [ ] Ninguna cifra de una tabla contradice su figura (bandas de error, escalas).
- [ ] El resumen y los highlights no afirman más que la Discusión ni que las pruebas de robustez.
- [ ] Si una prueba de robustez mueve el resultado más que todo el rango de incertidumbre, se convierte en eje del artículo, no en un matiz escondido.
- [ ] Cada cita apoya su frase (contenido leído, no solo que la referencia exista); las fuentes grises dicen lo que se les atribuye.
- [ ] Al recortar el texto, cada cifra que se queda conserva su método y sus datos (en el texto o en el suplemento).
- [ ] Los modelos e hiperparámetros no se eligieron mirando los datos de validación, o se declara.
- [ ] Si hay datos o scripts del autor, las cifras principales se recalcularon con ellos.
- [ ] Revisar figuras del autor no usadas y patrones de las figuras que el texto no describe: pueden ser la prueba que falta.
- [ ] El paquete LaTeX está completo (todos los `\input`, el .bst, las figuras) y compila; extensión dentro del límite.
- [ ] Declaraciones obligatorias presentes; prueba final en Ship.

## 6. Entregables recomendados

1. Manuscrito corregido (fuente LaTeX/Word + PDF compilado) y diff con los cambios.
2. Informe de cambios en español: resumen ejecutivo con estimación honesta (aceptar / revisión menor / mayor), cambios hechos (Ubicación | Antes | Después | Motivo), decisiones de Alex, pendientes del autor con criterio de «hecho», riesgos y tabla de habilidades.
3. Hoja de estilo del paper.
4. Si hay experimentos o medidas pendientes: lista para el autor con diseño concreto.

Guardar en `/Users/alex/Nube /repos/Review/<NombreCorto>/Vn/` (una carpeta por paper; V1, V2… por versión).
