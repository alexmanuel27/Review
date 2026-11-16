# Informe de cambios — HavanaBay V2

**Manuscrito:** *Water renewal in Havana Bay, Cuba: robust and fragile conclusions from public-data ensemble simulations*
**Revista objetivo:** Environmental Modelling & Software (EMS)
**Recibido:** 16-nov-2026. Paquete LaTeX completo, construido sobre mi V1 corregida, con nuevas ejecuciones, la figura de convergencia de Sobol, la Fig. 6 rehecha y cambios de autoría.
**Mandato de Alex:** libertad total para reescribir, reordenar figuras y tablas, mover material al suplemento y pedir datos, figuras y experimentos nuevos.

---

## 1. Resumen ejecutivo

La V2 resolvió casi todos los pendientes de la V1: convergencia de Sobol, base de cada rango, tabla del prisma, hashes de los protocolos, eje de la Fig. 6d y volumen de Poirier. También añadió dos pruebas nuevas con flujo de calor (año completo y 16 miembros). Esas pruebas cambian lo que el artículo es. El flujo de calor ya no es un matiz: desplaza la mediana 6,4 días (de 7,4 a 13,8), más que todo el rango del 90 % del ensamble (4,8 días). La V2 lo contaba, pero escondido en §4.5 y con un mensaje aún dividido (*highlight* 3 decía «una semana»).

**He reconstruido el artículo alrededor de esa idea: incertidumbre de entradas frente a incertidumbre de estructura.** Es el mensaje generalizable que EMS busca, porque un Sobol solo ordena las incertidumbres que el modelador puso en el diseño. Con esta lectura, el resultado incómodo pasa a ser la contribución metodológica, sin ocultar nada. He añadido una cuarta pregunta en la introducción, una subsección de Discusión con literatura verificada (Walker 2003, Refsgaard 2006, Gupta 2012), la columna «With heat flux» en la Tabla 4 y dos figuras al texto principal (estructura y Sentinel-2). Tres figuras más y el texto numérico van al suplemento.

**Estimación honesta:** revisión menor a mayor acotada. El artículo está bien construido y es transparente. La objeción que queda es previsible: «si el flujo de calor es lo más realista y duplica la edad, ¿por qué el ensamble no lo incluye?». El texto lo reconoce y lo explica, pero un revisor exigente pedirá B1–B2 y quizá B4. Con B1 y B2 resueltos lo veo como revisión menor.

## 2. Estado de los pendientes de la V1

| V1 | Estado en la V2 recibida | Comentario |
|---|---|---|
| A1 flujo de calor hasta el equilibrio | **Hecho y superado**: año completo + 16 miembros | No se estabiliza: oscila entre 5 y 21 d. Reencuadrado (ver §3.1); faltan el mecanismo y la figura anual (B1–B3) |
| A2 convergencia de Sobol | **Hecho** (Fig. S6 + estimación con datos dados) | Bien resuelto |
| A3 eje de la Fig. 6d y «6–11 %» | **Hecho** | — |
| A4 base de los rangos y elección de 2016 | **Hecho** | Pasado además a una columna «Basis» en la Tabla 2 |
| A5 distribuciones del prisma | **Hecho** (Tabla S1) | Añadida la figura del prisma (Fig. S4) |
| A6 Ponce Portela y Poirier | Poirier hecho; **Ponce Portela sigue** (OpenAlex: 2012) | B8 |
| A7 hashes de los protocolos | **Hecho** para los 4 protocolos | Faltan las 2 pruebas posteriores con flujo de calor (B7) y los enlaces `\ph` |
| A8 estudio de Sentinel-2 accesible | Pendiente | B9 |
| A9 velocidades de 6 m/s en el contorno | **Parcial**: no aparecen en una reejecución de 10 d; causa sin aislar | Aceptable; movido al Texto S1 |
| A10 contrastar con cifras.md | Sin confirmar | B10 |

## 3. Cambios aplicados

### 3.1 Encuadre científico (lo más importante)

| Ubicación | Antes (V2 recibida) | Después | Motivo |
|---|---|---|---|
| Introducción, párr. 2–3 | Sobol presentado como la solución completa | Sobol resuelve «parte del problema»; la estructura del modelo es otra fuente de incertidumbre que el muestreo de entradas no revela (Walker 2003; Refsgaard 2006; Gupta 2012). Nuevo párrafo: los dos tipos se tratan por separado | El resultado del flujo de calor necesita ese marco para leerse como hallazgo y no como fallo |
| Introducción, preguntas | 3 preguntas | + (4) «whether the answers change when a process left out of the ensemble is added» | La sección §4.5 responde a una pregunta que no se había hecho |
| Introducción, contribución | — | + «how far the spread of a parametric ensemble can understate the uncertainty when one structural choice dominates» | Contribución generalizable para EMS |
| §4.5 (título) | «The heat budget is the weak point» | «The air–sea heat flux outweighs every sampled input» | El título dice el resultado |
| §4.5 | Texto sin figura | + descripción de la dinámica (sube a ~20 d a principios de marzo, cae a ~8 d en dos semanas, vuelve a subir) con la Fig. 7 | El lector debe ver que no es una deriva lenta, sino episodios. Valores leídos en la figura: confírmalos con los datos (B3) |
| §4.5 | — | + «The shift of the median, 6.4 days, is larger than the whole 90% range of the main ensemble (4.8 days)» | Es la cifra que sostiene el artículo; 13,8 − 7,4 = 6,4 y 10,4 − 5,6 = 4,8 |
| §4.5 | Las conclusiones que cambian aparecían mezcladas | Párrafo propio: qué sobrevive (orden de zonas, C7, < 1 mes, caudal) y qué cambia (C3, > 1 semana, > 2 semanas); T3 para R1–R4 | Estructura más clara |
| Tabla 4 | 4 columnas | + columna «With heat flux» (subconjunto de 16 para C/P, caso T3 para R) | Las dos verdades del artículo, lado a lado. Solo se usan clases que ya daba el texto («the others do not change») |
| §3.3 | — | + el criterio de equilibrio supone un forzamiento estable; con flujo de calor se dan medias de 30 d y su rango | Con forzamiento variable no tiene sentido pedir un estado estacionario |
| §5.1 (título y contenido) | «What public data can and cannot say» | «Parametric and structural uncertainty»: (i) qué sobrevive al ensamble; (ii) el desplazamiento por el flujo de calor frente al rango; (iii) qué conclusiones defendemos sin datos y cuáles requieren medir | Discusión con la lección general |
| §5.4 | Caudal primero; temperatura y salinidad al final | «Two measurements stand out, one for each kind of uncertainty» | Coherente con el nuevo marco |
| §5.6 | — | + «test the conclusions again under the main structural simplifications» como paso del procedimiento | Lo transferible incluye ahora las pruebas de estructura |
| Conclusiones | 5 puntos, el flujo de calor mezclado en (1) y (2) | Un punto por pregunta: mecanismo, ensamble, Sobol, estructura y comprobaciones externas | Simetría con las preguntas |
| Terminología | «heat budget», «heat balance» y «heat flux» mezclados | «air–sea heat flux» en todo el texto | Coherencia |

### 3.2 Resumen, *highlights* y palabras clave

- **Resumen (150 palabras):** ahora termina con «One process left out of the ensemble matters more than all nine inputs: the air–sea heat flux roughly doubles the age, to about two weeks, and keeps it from settling. The bay is renewed in weeks, not months.»
- ***Highlights* (76–83 caracteres):** se corrigió el *highlight* 3, que seguía en «about a week» y contradecía el resumen; el 4 cuantifica el efecto del flujo de calor y el 5 es nuevo: «The ensemble spread understates the uncertainty when one process is missing.»
- **Palabras clave:** sale «SCHISM» (ya está en el resumen) y entra «structural uncertainty»; «sensitivity analysis» pasa a «global sensitivity analysis».

### 3.3 Figuras y tablas (nuevo orden)

| Texto principal | Contenido | Cambio |
|---|---|---|
| Fig. 1–6 | Mapa, batimetría, mecanismo, ensamble, Sobol, ríos | Sin cambios |
| **Fig. 7 (nueva en el texto)** | `fig_robustness.pdf`: edad en 120 d con los 5 cambios de estructura | Estaba en `figuras/` sin usar; ahora sostiene §4.5 (provisional hasta B1) |
| **Fig. 8 (nueva en el texto)** | `fig_sentinel2.pdf`: mapa satelital, mapa del modelo y distribución nula | §4.6 no tenía figura; el panel (c) muestra el resultado clave (p = 0,16) |
| Tablas 1–5 | — | Tabla 2 con columna «Basis»; Tabla 4 con columna de flujo de calor |

| Suplemento | Contenido |
|---|---|
| Fig. S1 | Sondas (sin cambios) |
| **Fig. S2 (nueva)** | Malla (`fig03_mesh.png`) |
| **Fig. S3 (nueva)** | Comparación EOT20–FES2022 (`fig_tide.pdf`) |
| Tabla S1 | Entradas del prisma |
| **Fig. S4 (nueva)** | Prisma Monte Carlo y excursión frente a longitud del canal (`fig_prisma.pdf`) |
| **Texto S1 (nuevo)** | Comportamiento numérico (velocidades espurias), sacado de §3.7 |
| Fig. S5–S6 | Velocidades espurias y convergencia de Sobol |

§3.7 pasa a llamarse «Computation» y queda en un párrafo. El detalle numérico, que interrumpía la lectura de Métodos, va al Texto S1.

### 3.4 Correcciones puntuales

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| §3.2 | «FES2022 differs from it by less than 0.4 cm in every constituent» | «by at most 0.4 cm» | M2: 12,2 frente a 12,6 cm, diferencia exactamente 0,4 (y la Fig. S3 lo muestra) |
| Afiliaciones | 7 afiliaciones declaradas | 4 | Las 5–7 quedaron sin autor tras tu cambio de autoría y la clase las imprime |
| §4.6 | «Discharges missing… from the 2002 survey» | «from the 2002 values» | Coherente con la V1 |
| Tabla 1 | «Robustness test» / «Ensemble dimension» | «Structural tests» / «Ensemble input» | Terminología |
| §3.6 | «in the run with rivers» | «in the mechanism run with rivers» | Precisión: hay muchas «runs with rivers» |
| Discusión §5.3 | «heat budget, which the ensemble does not sample» | Reescrito como «The heat flux, the largest effect we found, raises the bay-mean age only to about two weeks…» | Más directo; mismas cifras |

### 3.5 Referencias

Tres nuevas, verificadas en OpenAlex con DOI, autores, revista y año: Walker et al. 2003 (*Integrated Assessment* 4:5–17), Refsgaard et al. 2006 (*Adv. Water Resour.* 29:1586–1597) y Gupta et al. 2012 (*WRR* 48, W08301). Se citan solo para la distinción entre incertidumbre de entradas y de estructura, que es su tema central. La frase no afirma que la estructural sea «normalmente mayor», porque eso no lo comprobé en sus textos.

### 3.6 Comprobaciones

- Comparé todas las cifras de la V2 recibida con las de la corregida. Las únicas cifras que faltan son repeticiones eliminadas (p. ej. el 44 % de §5.1, ya en la Tabla 4 como 0,44) y los códigos postales de las afiliaciones eliminadas. Las únicas cifras nuevas son derivadas: 6,4 y 4,8 d.
- Compila sin avisos, en 19 páginas: unas 13 de texto principal (~9800 palabras con pies y tablas) más el suplemento. Resumen de 150 palabras; *highlights* ≤ 85 caracteres.

## 4. Pendientes y peticiones al autor (nivel 3)

Detalle, especificaciones de figura y prompt en `Pendientes_autor_HavanaBay_V2.md`. En resumen, por orden de impacto:

1. **B1. Figura anual del flujo de calor:** convertir la Fig. 7 en la figura central, con la serie de 2016 y el par de 16 miembros.
2. **B2. Mecanismo:** explicar qué acumula y qué «resetea» la edad en las ejecuciones con flujo de calor (flujo neto ERA5, viento, frentes fríos, ΔT y ΔS en el canal).
3. **B3. Cifras exactas:** media anual y mínimo/máximo mensual de la edad con flujo de calor, y confirmar las cifras de la Fig. 7 que describí.
4. **B4. Experimento recomendado:** ensamble con flujo de calor (64 miembros del bloque A, o un Saltelli con N = 16), unas 5 000–13 000 horas-núcleo.
5. **B5. Datos:** cualquier perfil T/S o registro de temperatura en la bahía, aunque no sea público (como comparación opcional), y la temperatura superficial de Landsat 8/9 (pública) frente a la del modelo con flujo de calor.
6. **B6. Resumen gráfico:** sigue mostrando «11 d, sin equilibrio»; hay que actualizarlo al mensaje en dos niveles.
7. **B7–B10:** qué 16 miembros y con qué *commit*; Ponce Portela; enlaces `\ph` y estudio de Sentinel-2; contrastar con cifras.md.

## 5. Riesgos que puede señalar un revisor

1. «¿Por qué la configuración principal es la menos realista?» Está respondido en §5.1, pero B4 es la respuesta completa.
2. Con flujo de calor no hay estado estacionario, así que una «edad media» de 30 d depende de la ventana. B1 y B3 lo resuelven mostrando la serie anual.
3. Sin observaciones locales. Si hay algún perfil (B5), aunque sea uno, cambia mucho la recepción.
4. La desviación del protocolo en T1 sigue declarada; está bien, pero se notará.
5. Extensión: ~9800 palabras con pies. Si EMS pidiera recortar, lo primero sería §4.6 (párrafo exploratorio) y §5.2.

## 6. Nota de coherencia (no forma parte del envío)

La autoría cambió respecto a la V1: salen Quitin y Terwagne, y Campo y Nicolis comparten la afiliación 4. Si FocalReview mantiene la misma lista de autores, conviene revisar que la nota «as in the FocalReview manuscript» siga siendo cierta.

## 7. Herramientas y límites

Usé lectura completa del `.tex` y de las 20 figuras del paquete, el paquete reference-lookup (OpenAlex) para las 3 referencias nuevas, compilación con latexmk, comparación de cifras entre versiones y diff por palabras. **No verificado:** cifras.md y los datos de las ejecuciones nuevas (carpeta del modelo no conectada); las fechas que leí de la Fig. 7, que salen de la figura y no de los datos; y la guía de EMS en línea.
