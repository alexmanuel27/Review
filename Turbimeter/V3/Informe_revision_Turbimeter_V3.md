# Cierre de la revisión documental del turbidímetro V3

An Open Turbidimeter Powered by a Smartphone: Design and Validation Protocol

16 de octubre de 2026

An Open Turbidimeter Powered by a Smartphone: Design and Validation Protocol

Resultado: E1–E6 y S01–S10 están resueltos. No encontré defectos documentales relevantes pendientes dentro del alcance de esta tercera ronda.

El trabajo describe un cabezal óptico alimentado por teléfono y un protocolo de calibración y validación. Su contribución experimental sigue por demostrar: la evidencia disponible establece diseño y comunicación con la controladora, sin validación óptica del conjunto. El cierre documental permite terminar esta fase editorial; no cierra los requisitos del autor.

Alcance: lectura y revisión visual de las nueve páginas EN y nueve ES, de ambos anexos de cinco páginas y del resumen gráfico. Comparación con el informe V2 y sus criterios de cierre. Se verificaron los cinco hashes frente a SHA256.json. No se modificó ningún original.

SHA-256 del PDF inglés revisado

196792085d581e042641547ebce2b8f38483d163660dfe07d2d077179c9a6e52

## 1 Cierre de las correcciones documentales

| Punto | Estado | Ubicación V3 | Comprobación |
|---|---|---|---|
| E1 | Resuelto | EN/ES pp. 2 y 4 | Fig. 1 separa señal analógica, energía USB y datos. Fig. 3 presenta las cotas de diseño legibles en el pie y las distingue del montaje real. |
| E2 | Resuelto | EN p. 5; ES p. 6 | Fig. 5 separa stocks/eventos independientes y muestra selección interna, congelación completa y evaluación reservada. |
| E3 | Resuelto | EN/ES p. 5 | Ec. (2) define sesgo, MAE y RMSE con igual peso por lote; RMSE usa errores cuadrados. Explicita lotes sin resultados, fallos y conjuntos vacíos. |
| E4 | Resuelto | EN/ES pp. 3–7 | Tabla II española separa las columnas con la etiqueta Datos y energía. No quedan las colisiones ni los cortes especialmente abruptos señalados en V2. |
| E5 | Resuelto | Anexos EN/ES pp. 1 y 3 | Título y aviso preceden las figuras. La leyenda de P2(b) está dentro de su panel y ya no invade el título de P2(d). |
| E6 | Resuelto | EN/ES pp. 1, 3–4 y 7 | El resumen ES dice presentación de errores de medición. El almacenamiento en modo no demostración se describe como función de software sin atribuirle validación óptica. |

## 2 Cierre de las sugerencias de redacción

Se comprobaron los diez reemplazos propuestos en V2. No añado nuevas sugerencias de estilo ni reabro los puntos R1–R13 ya cerrados. La agrupación de la tabla conserva el estado individual de todos los identificadores.

| Punto | Estado | Ubicación V3 | Comprobación |
|---|---|---|---|
| S01–S03 | Resueltos | EN p. 1 | Voz activa, comunicación como única prueba y alcance limitado a los dispositivos ensayados. |
| S04 | Resuelto | EN p. 2, II | Diferencia entre acceso al artículo y acceso a diseños o código. |
| S05–S06 | Resueltos | EN pp. 2–3, III A | Ajustes y umbrales descritos sin atribuirles verificación física. |
| S07 | Resuelto | EN p. 5, IV B | Tolerancias y fracción mínima siguen pendientes de justificación. |
| S08 | Resuelto | EN p. 6, IV D | Una pareja donante–receptor no establece intercambiabilidad de fabricación. |
| S09–S10 | Resueltos | EN p. 7, IV E y V | Un commit no constituye una liberación reproducible; las maquetas no justifican resultados, límites ni tamaños. |

## 3 Referencias y separación del material sintético

Las versiones EN y ES mantienen 47 referencias y el mismo conjunto de 47 enlaces externos de V2. No observé marcadores de cita sin resolver. Se cotejaron las referencias críticas con las comprobaciones de V2 y se repitió una búsqueda real en fuentes primarias para ColorX y JCGM 100/101. Su identificación y uso siguen siendo pertinentes; no se identificó bibliografía imprescindible nueva para cerrar E1–E6. Esta comprobación no certifica el texto completo de las 47 fuentes.

[ColorX 2025  ·  fuente primaria del editor](https://www.mdpi.com/1424-8220/25/16/4935)

[BIPM  ·  catálogo oficial de documentos JCGM](https://www.bipm.org/en/web/guest/publications/guides)

[BIPM  ·  JCGM 101 2008 y su DOI](https://www.bipm.org/en/doi/10.59161/jcgm101-2008)

El principal contiene cinco figuras documentales o conceptuales y dos tablas. No reintroduce las maquetas cuantitativas P1–P4 ni la fotografía de IA. Ambos anexos se identifican desde la primera página como material interno, sintético y ajeno al suplemento de envío. El resumen gráfico advierte que la validación óptica está pendiente. No encontré solapamientos relevantes en las páginas inspeccionadas.

Los principales conservan nueve páginas. El objetivo previo de ocho páginas sigue siendo una preferencia económica de preparación, no un defecto documental pendiente ni un criterio científico de aceptación. Se reevaluará la extensión con los resultados reales, si se incorporan.

## 4 Pendientes que requieren al autor

Estos puntos permanecen abiertos sin exigir que se ejecuten durante la edición documental. M1 sigue no resuelto; M2–M10 conservan el estado parcial de V2. Las declaraciones también siguen pendientes. Las mejoras de texto no sustituyen la evidencia indicada.

### A1  Construcción y evidencia experimental

M1, M2 y M10. EN pp. 2–4, III A; pp. 7–8, V y VII. [REQUIERE AL AUTOR] Fabricar e identificar la revisión ensayada, documentar el montaje real y obtener validación óptica independiente. Cierre: datos reales y análisis reproducible que permitan valorar la contribución, sus límites y posibles resultados negativos.

### A2  Decisiones y análisis de validación

M3–M5. EN pp. 5–6, IV A y IV B. [REQUIERE AL AUTOR] Confirmar comparador y controles, preparación y estabilidad, rango, tolerancias, conformidad, confianza, equivalencia y tamaños justificados; fechar las particiones y reglas antes de la evaluación final. Cierre: plan operativo aprobado y, después, predicciones independientes y componentes medidos de incertidumbre.

### A3  Registro y prestaciones del instrumento

M6–M9. EN p. 3, III A y III B; pp. 6–7, IV C a IV E. [REQUIERE AL AUTOR] Implementar y probar registros completos por intento, incluidos fallos y señales con signo; medir rango bajo, normalización, robustez, estabilidad, energía y las comparaciones propuestas. Liberar el paquete licenciado coincidente con la revisión probada. Cierre: mediciones, trazabilidad y reconstrucción verificable de los resultados. Solo reclamar coste si existe un desglose vigente.

### A4  Declaraciones y aplicación futura

EN p. 8, Declarations for Submission; p. 7, VI. [REQUIERE AL AUTOR] Aprobar autoría, afiliaciones, CRediT, financiación, conflictos, agradecimientos y asistencia de IA; confirmar las aprobaciones que correspondan al estudio efectivamente realizado. El estudio ciudadano permanece futuro y separado: no se exige para cerrar un artículo técnico limitado al instrumento.

## 5 Recomendación y comentario al editor

Cerrar la revisión documental de V3. No hay nuevas correcciones documentales obligatorias. Se mantiene el rechazo como artículo de investigación experimental en su estado actual, porque faltan las mediciones indispensables. No se recomienda el envío con la evidencia disponible. El manuscrito puede conservarse como protocolo de trabajo hasta completar los puntos del autor; no es necesario añadir un estudio ciudadano para evaluar una futura contribución limitada al instrumento.

## 6 Prompt de continuación

El archivo Prompt_correccion_Turbimeter_V3.md acompaña este informe. Confirma el cierre de E1–E6 y S01–S10, no prescribe reescrituras nuevas y enumera los requisitos A1–A4 con ubicación y criterio de cierre. Exige texto revisado y tabla de cambios solo cuando exista evidencia nueva suficiente; entretanto conserva los pendientes sin inventarlos como completados.

Expediente conservado en /Users/alex/Nube /repos/Review/Turbimeter/V3, con copias exactas de los cinco PDFs y del manifiesto recibido. V1 y V2 permanecen intactas.