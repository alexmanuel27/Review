# Informe de cambios — HavanaBay V3 (modo «full»)

> **Versión única.** Esta V3 incluye ya la pasada de redacción y estructura (17-nov): el PDF, el zip y el diff corresponden a la versión final. Donde la sección 4.1 describe la estructura intermedia, vale la sección 9.


**Manuscrito:** *When model structure matters as much as the data: water renewal in Havana Bay, Cuba, from public-data ensembles* (antes: *Water renewal in Havana Bay, Cuba: robust and fragile conclusions from public-data ensemble simulations*)
**Revista objetivo:** Environmental Modelling & Software
**Recibido:** 17-nov-2026, `V2.zip`, que en realidad es tu V3: `main.tex`, la bib, las clases y un PDF compilado, sin la carpeta `figuras/`. SHA-256 `cd90f3f4…0f5a`.
**Modo:** «full»: reescribir para la mejor versión posible, con libertad para cambiar el enfoque y para proponer experimentos, datos y bibliografía.

---

## 1. Resumen ejecutivo

La V3 resolvió lo más difícil que pedí: los 64 miembros del bloque A con flujo de calor (B4), la serie anual con lectura estacional (B1, B3), el proxy del flujo neto de calor (B2) y Ponce Portela (B8). Con eso, el hallazgo central ya no es «el flujo de calor alarga la edad», sino algo más general y más publicable: **una decisión de estructura desplaza la respuesta tanto como las nueve entradas inciertas juntas** (5,4 d frente a 5,3 d en los mismos 64 miembros). Además, ese efecto es estacional y varía con el caudal de los ríos.

En modo «full» he hecho tres cosas:
1. **Llevar el título y el resumen a ese hallazgo.** Título nuevo (decisión tuya); el resumen ya dice que la estimación es de estación seca y da las cifras de los 64 miembros.
2. **Reordenar los Resultados para que la incertidumbre se lea seguida:** ensamble → Sobol → flujo de calor → estacionalidad → ríos → Sentinel-2.
3. **Añadir una interpretación física** como hipótesis declarada: el «freno térmico» de la circulación estuarina, con Largier 2010 y Monismith 2006. Junto a ella, la evidencia a favor y en contra, y la prueba decisiva que te pido.

**Estimación honesta:** revisión menor si confirmas las dos consultas (Q1, Q2) y rellenas los enlaces. Con X1–X3 (§5) el artículo pasaría de «buen estudio de caso con una lección metodológica» a «estudio de caso con un mecanismo demostrado», que es lo que distingue un artículo citado.

## 2. Estado de los pendientes de la V2

| V2 | Estado | Comentario |
|---|---|---|
| B1 figura central del flujo de calor | **Hecho** (`fig_heatflux.pdf`) | Ahora es la Fig. 6. No venía en el zip: la recorté en vectorial de tu PDF (comprueba que es la versión final) |
| B2 mecanismo | **Parcial**: correlaciones con el proxy; ρ parcial con viento 0,14 < 0,25 | Bien hecho y bien declarado. Falta la prueba decisiva (X1–X3) |
| B3 cifras exactas | **Hecho** (11,4 d anual; 21,0 d en nov.; 6,1 d en ago.; 88/365 días > 14 d) | — |
| B4 ensamble con flujo de calor | **Hecho** (64 miembros) | Excelente; cambia la Tabla 4 a fracciones reales |
| B5 datos T/S | Pendiente | Ahora tiene un uso concreto: probar la hipótesis térmica (X1, X3) |
| B6 resumen gráfico | Sin confirmar (no venía en el zip) | Sigue pendiente; especificación en Pendientes |
| B7 *commits* de las pruebas posteriores | **Hecho** (7c74c13, a553d4d, 58d3d54) | — |
| B8 Ponce Portela | **Hecho** (2012, vol. 33) | — |
| B9 enlaces y Sentinel-2 | Pendiente | 8 `\ph{}` en el texto |
| B10 cifras.md | Sin confirmar | — |

## 3. Diagnóstico con las *skills* (esta vez ejecutadas, no simuladas)

- **`claude-scientific-writer:peer-review`:** control de admisión validado con su script (`READY_FOR_LOCAL_REVIEW`; lector a petición del autor, solo procesamiento local). Matriz de 14 afirmaciones validada con `validate_claim_evidence.py`: 9 apoyadas, 5 en parte (CL04, CL06, CL07, CL10, CL14). Las cinco se han resuelto en el texto (tabla 4.4).
- **`copy-editing:proofread`:** comprobaciones calculadas con código: palabras repetidas, paréntesis, marcadores, frases duplicadas, variantes de términos y comparación de cifras con tu V3. Veredicto **Hold** solo por marcadores previstos (8 `\ph`, 1 `\prov`). 0 erratas, 0 palabras repetidas, 0 referencias sin resolver. En la comparación de cifras, todo lo que falta es eliminación intencionada (párrafo duplicado y una frase sustituida por la figura).
- **`research-desk:paper-critique`** (V1) y las comprobaciones de integridad: siguen vigentes; cada cifra nueva se contrastó con tu texto.
- **reference-lookup (OpenAlex):** 3 referencias nuevas verificadas (Largier 2010; Monismith 2006; Viero 2016, esta no usada).

## 3b. Diagnóstico estratégico (modo «full»)

Comparé tres enfoques con `research-desk:decision-matrix` (detalle en `Decision_enfoque_HavanaBay_V3.md`):
- **A**, estudio de caso con lección de estructura para EMS: **87 puntos**.
- **B**, artículo de procesos sobre el «freno térmico» para ECSS o JGR Oceans: **49**, eliminado hoy porque su afirmación central es una hipótesis sin probar.
- **C**, método o software reproducible para EMS: **54**.

Recomiendo **A** para este envío. Si E1–E3 confirman el freno térmico, **B se convierte en un segundo artículo**, no en sustituto de A. El primer paso reversible es E1, quizá sin ejecuciones nuevas. La decisión es tuya: el campo `chosen` queda vacío.

Los experimentos están diseñados con `hypothesis-generation`: 5 hipótesis candidatas (H1, H1b, H3, H4, H0) y 5 predicciones discriminantes validadas, con lo que cambia en el texto según cada resultado (`Plan_experimentos_HavanaBay_V3.md`). En el manuscrito hay marcadores rojos `[TODO: EXPERIMENTO E1/E2/E3 — resultado pendiente]`, como pide el protocolo para el modo full.

## 4. Cambios aplicados

### 4.1 Enfoque y estructura

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| Título | «…robust and fragile conclusions from public-data ensemble simulations» | «When model structure matters as much as the data: water renewal in Havana Bay, Cuba, from public-data ensembles» | Decisión de Alex: el título anuncia la lección general |
| Resultados, orden | Ríos (§4.4) entre Sobol y flujo de calor | §4.3 Sobol → §4.4 flujo de calor → **§4.5 nueva** «The effect of the heat flux is seasonal» → §4.6 ríos → §4.7 Sentinel-2 | El argumento de incertidumbre se lee seguido; figuras renumeradas (Fig. 6 = flujo de calor, Fig. 7 = ríos) |
| §4.4 | Mezclaba 120 d, año completo, 64 miembros y el proxy | Solo estructura y 64 miembros | Un mensaje por subsección |
| §4.5 (nueva) | — | Serie anual, medias mensuales, el contorno a 28 °C por debajo de la base en jul.–sep. y el proxy del flujo de calor | La estacionalidad es un resultado en sí |
| **§5.2 (nueva)** | — | «A thermal brake on the estuarine circulation?»: hipótesis, 4 resultados a favor, 1 en contra y la prueba decisiva | Decisión de Alex; convierte la anomalía en ciencia, marcada como hipótesis |
| Introducción, párr. 3 | — | + el flujo de calor como simplificación más importante: en bahías de poca descarga, calentamiento y enfriamiento pesan tanto como el agua dulce (Largier 2010) | Anuncia el hallazgo y lo sitúa en la literatura |
| §5.1 | «shifts the median by about as much as that whole range» | Comparación explícita en los mismos 64 miembros (5,3 frente a 5,4 d), más el coste de la prueba (3,5 × 10³ frente a 5,4 × 10⁴ horas-núcleo) | CL06; el coste es un argumento práctico para EMS: probar la estructura es barato |
| §5.5 | — | + Landsat 8/9 térmico (público) como primera prueba antes del trabajo de campo | Coherente con el enfoque de datos públicos |
| Conclusiones (2) y (4) | — | «In the dry season…»; estacionalidad; el mecanismo como hipótesis abierta | CL07, CL10 |
| Suplemento | Fig. S `fig_robustness` entre S3 y la Tabla S1 | Movida al final (Fig. S7), por orden de primera cita | Numeración |

### 4.2 Afirmaciones ajustadas a la evidencia (matriz de la *skill*)

| ID | Afirmación | Problema | Arreglo |
|---|---|---|---|
| CL04 | «increases from the channel to the inner coves in every member» (resumen) | 128/128 sin flujo de calor, pero 58/64 con él | Quitada del resumen; matizada en §4.4 («robust but only just») |
| CL06 | «matters as much as all nine inputs together» | Compara un desplazamiento pareado con una dispersión | «a shift as large as the whole spread caused by the nine inputs», con las dos cifras en el texto. **Q1:** 10,7 − 5,5 = 5,2, no 5,3; confírmalo con los valores sin redondear |
| CL07 | «raises the age to about two weeks» | 13,2 d es en ene.–abr.; la media anual es 11,4 d y en agosto 6,1 d | «In the dry season…» en resumen, §5.1 y conclusiones |
| CL10 | Mecanismo de enfriamiento | Párrafo duplicado; prueba parcial | Duplicado eliminado; mecanismo trasladado a §5.2 como hipótesis |
| CL14 | El procedimiento es transferible | No se probó otra bahía | «…belongs to a small-tide bay with a narrow channel in the dry season; the procedure… does not» |

### 4.3 Correcciones y nuevas afirmaciones descriptivas

| Ubicación | Texto | Base |
|---|---|---|
| §4.4 | «The shift is largest in the members with the least river water and smallest in those with the most (Fig. 6b)» | Se ve en tu Fig. 6b (los puntos oscuros quedan más lejos de la 1:1). **Pendiente X5:** dar el ρ de Spearman entre el factor de caudal y el desplazamiento |
| §4.5 | «In July–September the run with the 28 °C boundary renews the bay faster than the base run, the only configuration that does» | Se ve en tu Fig. 6a (la curva naranja oscura queda por debajo de la negra) |
| §5.2 | «\prov{when the sea is usually warmer than 28 °C}» | **Q2**, en azul en el PDF: confírmalo con OISST de jul.–sep. de 2016 o reformúlalo |
| §5.6 | «we know that its effect grows as discharge falls» | Igual que X5 |
| Duplicado | Párrafo «A plausible reason…» repetido | Eliminado |

### 4.4 Resumen, *highlights* y referencias

- **Resumen:** 149 palabras. Ahora da las cifras de estación seca de los 64 miembros y el titular «one to two weeks, not months».
- ***Highlights* (76–83 caracteres):** el 4 da el resultado de los 64 miembros; el 5 da la lección de estructura.
- **Referencias nuevas:** Largier 2010 (cap. 9 de *Contemporary Issues in Estuarine Physics*, CUP, pp. 247–272) y Monismith et al. 2006 (*JPO* 36:1332–1347).

## 5. Lo que pido en modo «full» (experimentos y datos)

Detalle y prompt en `Pendientes_autor_HavanaBay_V3.md`. Por orden de impacto:

1. **X1. Prueba decisiva de la hipótesis, quizá sin ejecuciones nuevas.** Medias mensuales del contraste bahía − contorno en temperatura (o densidad), frente a la anomalía de edad (con flujo de calor − base), en las ejecuciones de 28 °C y OISST: 24 puntos, una figura suplementaria. Si hay que repetir una ejecución anual guardando T y S, son ~130 horas-núcleo.
2. **X2. Factorial 2 × 2 de un año** (flujo de calor sí/no × viento real/viento climatológico): 2 ejecuciones nuevas, ~260 horas-núcleo. Separa el enfriamiento del viento, que hoy no se puede (ρ parcial 0,14).
3. **X3. Landsat 8/9 térmico (público):** ¿está la bahía más fría que el mar en invierno y más caliente en verano? Prueba observacional de la premisa, coherente con el espíritu del artículo.
4. **X4. Variabilidad interanual:** el miembro central con flujo de calor en ene.–abr. de 2017–2025 (9 × 76 ≈ 700 horas-núcleo). Responde a «¿es 2016 representativo?».
5. **X5.** ρ entre el factor de caudal y el desplazamiento pareado en los 64 miembros (sin ejecuciones).
6. **X6–X9:** confirmar Q1 (5,3 frente a 5,2) y Q2 (temperatura del mar en verano); resumen gráfico; enlaces `\ph` y estudio de Sentinel-2; cifras.md.

## 6. Riesgos que puede señalar un revisor

1. **Hipótesis térmica sin la prueba de densidad.** Está declarada como hipótesis, con un resultado en contra; X1 o X3 la cierran.
2. **Comparar un desplazamiento con una dispersión.** Está explicitado, pero un revisor de sensibilidad lo notará. Si quieres blindarlo, X5 añade la interacción con el caudal.
3. **Un único año (2016).** Está declarado; X4 lo resuelve.
4. **Extensión:** unas 10 700 palabras con pies y tablas, más que en la V2. Si EMS pide recortar: el párrafo exploratorio de §4.7, §5.3 (estimación de marea) y parte de §4.6 (ríos) pueden ir al suplemento.

## 7. Habilidades usadas (protocolo §4.7)

| Paso | Skill | ¿Invocada? | Qué encontró o cambió |
|---|---|---|---|
| 1 Lectura y revista | `claude-scientific-writer:venue-templates` | No | Guía de EMS ya comprobada en V1 y V2; no cambió nada de formato |
| 2 Diagnóstico | `claude-scientific-writer:peer-review` | **Sí** | Admisión validada; matriz de 14 afirmaciones (9 apoyadas, 5 en parte), las 5 resueltas |
| 2 Diagnóstico | `research-desk:paper-critique` | No en esta ronda (sí en V1) | — |
| 2 Diagnóstico | `claude-scientific-writer:scientific-critical-thinking` | No | Lo cubre la matriz de peer-review |
| 3 Integridad | `research-integrity:research-integrity` | No | Comprobación de cifras con un script propio (comparación con tu V3); hipótesis etiquetada como tal |
| 4 Referencias | `research-desk:citation-check` / `citation-management` | No | Las 2 referencias nuevas, verificadas con reference-lookup (OpenAlex) |
| 5 Estrategia (full) | `research-desk:decision-matrix` | **Sí** | A 87 / B 49 (eliminada) / C 54 → A, con B como segundo artículo |
| 5 Experimentos (full) | `claude-scientific-writer:hypothesis-generation` | **Sí** | 5 hipótesis rivales, 5 predicciones validadas, plan E1–E6 |
| Literatura (full) | `research-lookup` / `literature-review` / `related-work` | No | research-lookup necesita una clave de Parallel que no hay en esta sesión; búsqueda dirigida con OpenAlex en su lugar. **Búsqueda amplia pendiente** |
| 6 Hoja de estilo | `copy-editing:style-sheet` | No | Hoja actualizada a mano; sin términos nuevos salvo «thermal brake» |
| 6 Redacción | `copy-editing:redline-edit` + `scientific-writing` | No | Reescritura directa de las secciones nuevas; el resto ya se pulió en V2 |
| Figuras (full) | `scientific-schematics` | No | Necesita una API de imágenes externa; el resumen gráfico queda especificado para ti (X6) |
| 8 Prueba final | `copy-editing:proofread` | **Sí** | Hold solo por marcadores previstos (8 `\ph`, 1 `\prov`, 3 `\todo` de experimentos); 0 erratas |

Esta ronda invoqué 4 *skills* de verdad, con sus scripts cuando los tenían. Las que no invoqué figuran arriba con el motivo. La carencia más relevante para el modo full es la **búsqueda bibliográfica amplia**: el posicionamiento frente a estudios de edad del agua en bahías tropicales de baja descarga se apoya en tres referencias clave (Largier 2010, Monismith 2006, Doda 2022), no en una revisión sistemática.

## 8. Límites

Usé `claude-scientific-writer:peer-review` (admisión y matriz afirmación–evidencia validadas con sus scripts), `copy-editing:proofread` (comprobaciones calculadas), reference-lookup (OpenAlex), latexmk y un diff por palabras. **No verificado:** cifras.md y las salidas del modelo (carpeta no conectada); el valor exacto 5,3 d (Q1); la temperatura del mar en verano (Q2); el ρ de la interacción caudal–calor, que solo leí en la figura (X5). La Fig. 6 sale recortada de tu PDF del 17-nov.

## 9. Pasada de redacción y estructura (integrada en esta V3)

**Petición de Alex:** acortar, quitar repeticiones y epígrafes, eliminar la lista «We ask four questions» y humanizar el texto para que las ideas se conecten. Sin cambios de ciencia: no cambia ninguna cifra ni ninguna conclusión.

### Resultado en números

| | Antes (V3 full) | Ahora |
|---|---|---|
| Prosa del texto principal (sin figuras ni tablas) | ~6900 palabras | ~5800 (−16 %) |
| Epígrafes numerados (secciones + subsecciones) | 27 (6 + 21) | 19 (6 + 13) |
| Listas numeradas en el cuerpo | 2 (preguntas y conclusiones) | 0 |
| Subtítulos en cursiva dentro de párrafos | 5 | 0 |
| Páginas con suplemento | 21 | 19 |

### Cambios de estructura

| Antes | Ahora |
|---|---|
| Introducción con 4 preguntas en lista y un párrafo de «contribución» aparte | Un último párrafo narrativo que recorre las tres preguntas (mecanismo → ensamble → estructura) y termina en la contribución |
| Métodos: 7 subsecciones (Batimetría · Modelo y forzamiento · Edad y métricas · Ensamble · Ejecuciones fuera del ensamble · Comprobaciones · Cómputo) | 4: Batimetría · **Modelo, forzamiento y edad del agua** · Ensamble y conclusiones fijadas · **Ejecuciones adicionales y comprobaciones independientes** |
| Resultados: 7 subsecciones (Sobol y el ensamble separados; flujo de calor y estacionalidad separados) | 5: Marea · **Una semana en el ensamble, fijada sobre todo por los ríos** · **Flujo de calor (con su estacionalidad)** · Ríos · Sentinel-2 |
| Discusión: 7 subsecciones | 4: **Lo que el ensamble no ve** (incluye la transferibilidad) · Freno térmico · **Por qué fallaban las estimaciones previas** (prisma + cuatro meses) · **Qué medir primero y qué no puede decir este estudio** (incluye las limitaciones) |
| Conclusiones: lista de 5 puntos | Dos párrafos: lo que sabemos con datos públicos, y lo que cambia la estructura. Cierra con la lección general |

### Qué se ha ido al suplemento (sin perder ningún dato)

- **Texto S1 (nuevo):** el detalle del control de balance de los trazadores (los porcentajes por caso y la prueba de tolerancia).
- **Texto S2 (nuevo):** la selección de píxeles de Sentinel-2, el *bootstrap* y el patrón exploratorio de Atarés.
- **Texto S3 (antes Texto S1):** cómputo y comportamiento numérico.
- **Pie de la Fig. S6:** las cifras de convergencia de Sobol por N y la estimación con datos dados (incluida la fricción de fondo).

### Cómo se ha humanizado

- Frases que enlazan las ideas al empezar cada párrafo: «Where the two surveys overlap, they tell us how good they are», «All of this holds within the structure that the ensemble shares», «What builds the age up and what resets it is harder to pin down», «That contrast is the main lesson of the study».
- Fuera las enumeraciones mecánicas y los subtítulos en cursiva («*Mechanism.*», «*Model structure.*», «*River tracers.*», «*Tidal prism.*», «*Sentinel-2.*»).
- Fuera las repeticiones: la Discusión ya no vuelve a listar los resultados; 7,8 d, 13,2 d y «weeks, not months» aparecen solo en el resumen, los Resultados, una vez en la Discusión y en las Conclusiones; la ρ parcial solo queda en el pie de la Tabla 4.
- La justificación de los rangos ya no repite la columna «Basis» de la Tabla 2: solo se explican el *datum* y el caudal.
- Las conclusiones terminan con la idea que se lleva el lector: *a sensitivity analysis says which of the chosen inputs matter; only tests of the model structure say whether the right ones were chosen.*

### Comprobaciones

- **Cifras:** comparación automática de todas las cifras entre la V3 anterior y esta (cuerpo + suplemento). Las que faltan en el cuerpo son repeticiones o se movieron a S1–S3 y al pie de la Fig. S6; lo comprobé una a una (p. ej. 2,2 %, «other 11», «68 members», «76 core-hours»).
- **Marcadores que siguen a propósito:** 3 `\todo` de experimentos (E1–E3), 1 `\prov` (Q2) y 8 `\ph` (tus enlaces).
- Compila sin referencias rotas; 0 palabras duplicadas; resumen de 149 palabras y *highlights* sin cambios.

### Habilidades usadas

| Paso | Skill | ¿Invocada? | Qué hizo |
|---|---|---|---|
| Reescritura | `claude-scientific-writer:scientific-writing` | **Sí** | Marco de la reescritura: no añadir hechos, mantener métodos y resultados coherentes y declarar incertidumbre y desviaciones. Sus scripts de manifiesto no se usaron porque trabajan sobre Markdown con IDs; la coherencia de cifras se comprobó con el script de comparación |
| Prueba final | `copy-editing:proofread` (cargada en la ronda anterior) | Reaplicada | Comprobaciones calculadas: palabras duplicadas, marcadores, cifras y referencias |
| Corte | `copy-editing:cut-to-length` | No | No había un número objetivo; corte por repetición y traslado al suplemento |
| Corrección de estilo | `copy-editing:redline-edit` | No | La *skill* es para correcciones con registro frase a frase, no para reescribir; el diff hace ese papel |

### Lo que no cambia

Los pendientes Q1, Q2 y E1–E6 siguen igual (`Pendientes_autor_HavanaBay_V3.md` y `Plan_experimentos_HavanaBay_V3.md`).
