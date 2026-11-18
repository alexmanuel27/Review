---
type: decision
status: proposed
options: [A estudio de caso + lección de estructura (EMS), B artículo de procesos «freno térmico» (ECSS / JGR Oceans), C método/software reproducible (EMS)]
chosen:
---

# Decisión de enfoque — HavanaBay V3 (modo «full»)

**Marco.** Qué artículo escribir con los resultados actuales para el primer envío. *No* se decide aquí si habrá un segundo artículo, ni qué experimentos se ejecutan; eso depende de X1–X3.

**Opciones**
- **A.** Estudio de caso con lección metodológica: una decisión de estructura (el flujo de calor) pesa tanto como las nueve entradas inciertas juntas. Revista: EMS. Es lo escrito en la V3.
- **B.** Artículo de procesos: el enfriamiento invernal frena la circulación estuarina de una bahía tropical de baja descarga; el ensamble queda como apoyo. Revista: ECSS o JGR Oceans.
- **C.** Artículo de método o software: un flujo reproducible con datos públicos para bahías sin datos, con La Habana como demostración. Revista: EMS (tipo *software/method*).

**Condición eliminatoria:** la contribución central no puede descansar en una hipótesis sin probar. B la cumple hoy: ρ parcial con viento = 0,14 < 0,25 fijado de antemano, y Δρ no guardado.

## Matriz (pesos de 1 a 5; puntuaciones de 1 a 5)

| Criterio (peso) | A | B | C |
|---|---|---|---|
| La evidencia actual sostiene la afirmación central (5) | 5: todas las cifras están en los 704 + 64 miembros | 2: hipótesis sin prueba decisiva | 3: el procedimiento se aplica a una sola bahía |
| Novedad e interés para la revista (4) | 4: incertidumbre estructural cuantificada, tema central de EMS | 4: mecanismo físico atractivo | 3: EMS exige generalidad, documentación y pruebas del software |
| Trabajo extra antes de enviar (3; más alto = menos trabajo) | 5: listo salvo Q1–Q2 y enlaces | 2: X1–X3 y quizá ejecuciones nuevas | 2: empaquetar el código, documentarlo y probar una segunda bahía |
| Encaje con los datos y protocolos existentes (3) | 5: las lecturas están fijadas en *commits* | 3: los protocolos no se diseñaron para el mecanismo | 3 |
| Riesgo de revisión mayor o rechazo (4; más alto = menos riesgo) | 4 | 2 | 3 |
| **Total ponderado** | **87** | **49** (eliminada hoy) | **54** |

Cálculo de A: 5·5 + 4·4 + 3·5 + 3·5 + 4·4 = 25 + 16 + 15 + 15 + 16 = 87.

**Procedencia:** las puntuaciones de evidencia y encaje salen del manuscrito y de los *commits*. Las de novedad y riesgo son mi juicio de árbitro: tómalas como estimaciones.

**Sensibilidad.** Si X1 o X3 confirman la hipótesis (evidencia de B = 5, trabajo = 4, riesgo = 4), B sube a 78 y, con novedad 5 en una revista de procesos, a 82. Sigue por debajo de A (87). Ningún cambio de un solo peso hace ganar a B mientras su evidencia sea 2. C solo ganaría si un segundo caso de estudio subiera su evidencia a 5 y el trabajo pendiente fuera pequeño.

**Recomendación.** **A** para este envío. Si X1–X3 confirman el freno térmico, B no debe sustituir a A, sino ser un **segundo artículo** en una revista de procesos, apoyado en el primero.

**Primer paso reversible:** X1, quizá sin ejecuciones nuevas. Su resultado decide si B existe.

La decisión es tuya; el campo `chosen` queda vacío hasta que confirmes.
