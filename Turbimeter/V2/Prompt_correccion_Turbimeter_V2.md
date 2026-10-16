# Prompt adicional de corrección editorial V2

Revisa una copia del manuscrito en inglés «An Open Turbidimeter Powered by a Smartphone: Design and Validation Protocol», diseño/protocolo destinado a desarrollar un futuro artículo experimental para IEEE Sensors Journal. La versión de entrada es el PDF inglés de nueve páginas, fechado 16 de octubre de 2026, con SHA-256 `495624e27da1092f85a1be6a862b1e9efef61aff3b6e7cea8555680be1e5b98c`. Existen traducción española y anexo interno separado. Este prompt solo autoriza correcciones documentales posibles sin datos nuevos. No promete aceptación ni cierre de la validación.

## Restricciones obligatorias

- Trabaja en una copia. No alteres datos, hardware o software del instrumento como parte de esta edición del manuscrito.
- No inventes resultados, figuras de mediciones, coeficientes, presupuestos numéricos de incertidumbre, citas ni aprobaciones. No conviertas un protocolo en un estudio ejecutado mediante cambios de tiempo verbal.
- Mantén las cifras y figuras sintéticas y la fotografía de IA fuera del PDF principal. Conserva sus avisos en el anexo interno; no lo presentes como suplemento experimental.
- Mantén [REQUIERE AL AUTOR] para equipo ensamblado, datos reales, comparador y controles, tolerancias/rangos/márgenes/tamaños, análisis dependientes de datos, autoría/declaraciones y cualquier estudio ciudadano. No elijas valores a, b, confianza, equivalencia ni tamaños. No atribuyas al autor una decisión no confirmada.
- La ciencia ciudadana en La Habana es futura y separada. No exijas un estudio ciudadano para publicar un futuro artículo limitado al instrumento, ni inventes que ya se reclutaron usuarios o aprobaron consentimientos.
- Conserva el significado, la estructura y las advertencias de V2; actualiza EN y ES de forma consistente cuando corresponda. No reabras R1–R13 de V1, que ya están resueltos en el alcance indicado.

## Correcciones documentales necesarias

### E1 Etiquetas legibles en los diagramas

**Ubicación:** EN/ES p. 2, figura 1; p. 4, figura 3.

**Problema:** En figura 1, Digital R, USB power, Assigned value y Frozen f quedan muy juntos a los bordes y flechas; ocurre también en la versión española. Las anotaciones de figura 3 son minúsculas.

**Acción:** Separar rutas y rótulos, aumentar espacio o simplificar el gráfico manteniendo contenido. Aclarar que la flecha desde fotodiodos hacia MCP6002/ADS1115 representa señal analógica: ADC es el convertidor, no el nombre de esa señal. Presentar cotas existentes a tamaño legible; no inventar medidas ni fotos del montaje.

**Criterio de hecho:** A tamaño de columna se leen todas las etiquetas sin colisión, y cada dirección de energía/datos/señal analógica queda inequívoca.

### E2 Alinear figura 5 con la separación por stock o evento

**Ubicación:** EN/ES p. 5, figura 5(b), título y cajas.

**Problema:** El pie y IV-B exigen separar stocks/eventos completos, pero el dibujo conserva Separation by independently prepared batch, calibration batches y new batches. Esa simplificación permite leer erróneamente que bastaría separar alícuotas/lotes del mismo stock.

**Acción:** Actualizar título y cajas a training/internal-selection groups y independent hold-out stock/event groups; mostrar congelación de coeficientes, preprocesamiento, rango y reglas. Mantener la asignación pareada del comparador y la transferencia A→B sin reajuste. Aplicar los mismos cambios en ES.

**Criterio de hecho:** Diagrama, pie y IV-B usan la misma unidad de separación y no sugieren reutilizar el hold-out para seleccionar el modelo.

### E3 Explicitar las métricas con igual peso por lote

**Ubicación:** EN p. 5, IV-B, párrafo que comienza We propose to test; ES p. 5.

**Problema:** Same batch weighting no define completamente la operación de RMSE ni el tratamiento de un lote sin resultados reportables. La media de RMSE por lote difiere de la raíz de la media de los errores cuadráticos por lote.

**Acción:** Formalizar las métricas ya declaradas: para el conjunto de lotes con al menos una lectura reportable, sesgo = media de medias de e por lote; MAE = media de medias de |e| por lote; RMSE = raíz de la media de medias de e² por lote. Indicar que lotes sin valores reportables se contabilizan en disponibilidad/conformidad y se enumeran aparte de las métricas condicionales. Mantener todos los fallos en el denominador de conformidad cuando el comparador sea válido. No asignar a, b, confianza ni tamaños.

**Criterio de hecho:** Las ecuaciones distinguen RMSE de la media de RMSE, definen denominadores y no ocultan lotes completamente fallidos. Si el autor pretende otro estimando, marcarlo [REQUIERE AL AUTOR] en lugar de cambiarlo silenciosamente.

### E4 Corregir colisión en la tabla española y fragmentación

**Ubicación:** ES p. 7, tabla II; EN pp. 3–6; ES pp. 3–5.

**Problema:** Energía/datos/publicación se pega a Energía medida en la última fila de la tabla II española. Varias continuaciones empiezan una columna/página con fragmentos como or enclosure sealing o can be calculated..., y las figuras interrumpen párrafos.

**Acción:** Repartir anchuras o abreviar la primera etiqueta de tabla II; mantener separación entre columnas. Ajustar colocación de flotantes y párrafos para conservar bloques comprensibles. Reducir repeticiones si se persigue ocho páginas, conservando datos de fuente, límites y pendientes; no reducir letra ni forzar una afirmación de que el PDF final tendrá ocho páginas.

**Criterio de hecho:** No hay texto de columnas pegado, cortes especialmente abruptos ni pérdida de contenido. Registrar el número final de páginas sin prometer que la edición cubrirá futuras figuras de resultados.

### E5 Corregir la leyenda del anexo interno

**Ubicación:** Planning_Annex_EN.pdf p. 2, figura P2(b/d); comprobar anexo ES equivalente.

**Problema:** La leyenda Scatter only / Ratio de la deriva ya no tapa la curva, pero está sobre el título de Reinsertion repeatability. El título Internal Planning Annex aparece después de la primera figura, aunque esta ya lleva aviso sintético.

**Acción:** Mover la leyenda a una zona sin curvas ni títulos o ampliar espacio entre filas. Situar el título y aviso de uso interno antes de P1 si la reordenación no introduce problemas. Conservar avisos sintéticos/IA, cifras ficticias y separación del principal; no transformar el anexo en evidencia ni en suplemento de envío.

**Criterio de hecho:** Leyenda y paneles no se superponen; el lector identifica uso interno antes de ver las maquetas. La prohibición de usar cifras sintéticas como evidencia queda visible.

### E6 Pulir el registro y la traducción sin cerrar pendientes

**Ubicación:** EN pp. 1, 3 y 7; ES p. 1; notas [REQUIERE AL AUTOR].

**Problema:** El resumen español traduce error reporting como comunicación de errores, que puede confundirse con mensajes de fallo en lugar de métricas. La expresión real ratios en III-B también puede confundirse con mediciones ópticas ya demostradas.

**Acción:** Usar en ES presentación de errores de medición y distinguirla de códigos de fallo. En EN/ES describir almacenamiento de valores recibidos en modo no demostración como función de software, manteniendo que la única prueba documentada es de comunicación. Aplicar las sugerencias de estilo S01–S10 solo si no alteran hechos ni pendientes.

**Criterio de hecho:** Resumen e implementación no sugieren que se obtuvieron datos ópticos reales. Se conservan el alcance de protocolo, los avisos [REQUIERE AL AUTOR] y la ciencia ciudadana futura.

## Recomendaciones no bloqueantes

- Si se pretende evitar cargos por exceso de páginas, intentar reducir las nueve páginas actuales mediante eliminación de repeticiones y mejor colocación de figuras. No quitar controles esenciales, fuentes, límites o pendientes, ni reducir la legibilidad. Informar el número final real; futuras figuras experimentales exigirán una nueva evaluación de extensión.
- Separar visualmente la lista interna de pendientes del texto científico, conservando en el cuerpo las limitaciones. No borrar pendientes para simular un artículo listo para envío.
- Mantener referencias [29], [36] y [37] verificadas y no añadir bibliografía decorativa. No modificar años/DOI o fechas de acceso salvo error respaldado por fuente.

## Sugerencias literales de redacción

Aplicar solo si son compatibles con E1–E6; no cambian resultados ni cifras.

### S01 · p. 1, resumen, primera frase

Original: This design and validation protocol describes an open turbidimeter intended to operate without its own display or battery.

Propuesta: We describe the design and validation protocol for an open turbidimeter intended to operate without its own display or battery.

Motivo: Naturalidad: introduce una voz activa sin afirmar validación realizada.

### S02 · p. 1, resumen, evidencia

Original: The available bench test establishes controller communication only; no assembled optical measurement or quantitative turbidity result has been validated.

Propuesta: The available bench test establishes only controller communication. Neither optical measurements from the assembled system nor quantitative turbidity results have been validated.

Motivo: Claridad: separa qué se probó de lo que falta.

### S03 · p. 1, resumen, alcance

Original: Their exploratory scope is limited to the tested devices.

Propuesta: These exploratory tests will support conclusions only about the devices tested.

Motivo: Fluidez: da un antecedente concreto y mantiene el futuro.

### S04 · p. 2, II, apertura

Original: An accessible paper does not imply reusable design files or licensed code.

Propuesta: Access to a paper does not imply access to reusable design files or licensed code.

Motivo: Precisión: distingue acceso a publicación y acceso a recursos.

### S05 · p. 2, III-A, parámetros

Original: These are configured settings, not verified settling or bandwidth.

Propuesta: These settings do not establish the system’s settling time or bandwidth.

Motivo: Naturalidad y claridad del límite de la documentación de fuente.

### S06 · p. 3, III-A, umbrales

Original: These are provisional bench thresholds, not validated quality limits.

Propuesta: These provisional bench thresholds have not been validated as quality limits.

Motivo: Fluidez: conserva el estado provisional.

### S07 · p. 5, IV-B, decisiones

Original: No numerical tolerances or minimum conformity fraction are justified yet.

Propuesta: Numerical tolerances and the minimum conformity fraction remain to be justified.

Motivo: Naturalidad: expresa de forma directa el trabajo pendiente.

### S08 · p. 6, IV-D, transferencia

Original: A single donor–recipient pair supports only an exploratory case, not manufacturing interchangeability.

Propuesta: A study with a single donor–recipient pair can provide exploratory evidence but cannot establish interchangeability across manufactured units.

Motivo: Precisión de la inferencia condicional prevista; no afirma que el ensayo ya se hizo.

### S09 · p. 6, IV-E, apertura

Original: A development commit alone is insufficient.

Propuesta: A development commit alone does not constitute a reproducible release.

Motivo: Claridad: especifica para qué resulta insuficiente.

### S10 · p. 7, V, estado de evidencia

Original: They are not results, acceptance limits, or a study-size justification.

Propuesta: These synthetic examples provide neither experimental results nor a basis for acceptance limits or sample-size justification.

Motivo: Precisión y antecedente explícito sin cambiar el significado.

## Fuera de la edición automática

Los puntos M1–M10 permanecen total o parcialmente pendientes. Mantener un inventario [REQUIERE AL AUTOR] de: construcción y caracterización del conjunto; calibración/validación independiente; comparador/materiales/controles; decisiones de tolerancias y diseño; mediciones de incertidumbre, estabilidad, normalización y energía; registro por intento y verificación de integridad; liberación/licencias; aprobaciones de autoría y declaraciones. El estudio ciudadano solo será necesario para las afirmaciones de ese estudio posterior. No ejecutar ni redactar esos trabajos como completados.

## Salida esperada

1. Texto revisado de los pasajes afectados y diagramas/tablas corregidos en una copia EN/ES, conservando el carácter de protocolo.
2. Tabla E1–E6 y S01–S10: estado, qué cambió, ubicación nueva y criterio comprobado. Marcar cualquier decisión no inferible como [REQUIERE AL AUTOR].
3. Lista separada de pendientes científicos y declaraciones que la edición no resuelve.
4. Informe de maquetación de todas las páginas EN/ES y de los anexos modificados: etiquetas, solapamientos, cortes, referencias, número final de páginas y separación del material sintético.
5. SHA-256 de cada PDF generado y declaración explícita de que mejorar el protocolo no constituye validación del instrumento ni garantiza aceptación.
