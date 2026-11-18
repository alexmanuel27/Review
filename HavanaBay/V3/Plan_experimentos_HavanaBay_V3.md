# Plan de experimentos — HavanaBay V3 (modo «full»)

Diseñado con `claude-scientific-writer:hypothesis-generation`. La matriz de predicciones (`Matriz_predicciones_HavanaBay_V3.csv`) está validada con su script (`VALID_FOR_HUMAN_REVIEW`, 5 predicciones). Todas las hipótesis son **candidatas**: ninguna es un resultado.

## Observación congelada (antes de interpretar)

Proceden de las ejecuciones SCHISM del miembro central (2016) y de los 64 miembros del bloque A (ene.–abr.):
- Con el flujo de calor, la edad media de la bahía es alta en noviembre (21,0 d) y de febrero a abril (11,4–13,9 d), y casi igual a la base en agosto (6,1 frente a 6,3 d).
- Con el contorno a 28 °C la edad queda por debajo de la base en jul.–sep. En invierno, el contraste superficie–fondo del canal casi desaparece (14,2/10,6 d frente a 6,6/1,8 d).
- El desplazamiento con flujo de calor parece mayor en los miembros con menos caudal (Fig. 6b). Es **exploratorio**: se vio antes de este plan.
- El proxy de flujo neto se correlaciona con el crecimiento de la edad (ρ = +0,32 en bloques de 5 d; +0,75 mensual), pero la correlación parcial con el viento es +0,14, por debajo del 0,25 fijado de antemano.
- No se guardaron T ni Δρ en el canal.

## Hipótesis candidatas

| ID | Hipótesis | Tipo |
|---|---|---|
| H1 | **Freno térmico horizontal.** El enfriamiento invernal deja la bahía, somera, más densa que el mar. Eso impulsa un intercambio contrario al de la flotabilidad del río, la circulación estuarina se debilita y la edad crece (Largier 2010; Monismith 2006). | Mecanística |
| H1b | **Mezcla convectiva vertical.** El enfriamiento superficial mezcla la columna y destruye la estratificación del agua de río, sin invertir el contraste horizontal. | Mecanística (rival de H1) |
| H3 | **Viento.** El efecto invernal se debe a la variabilidad del viento (frentes fríos), que coincide con el enfriamiento. El flujo de calor solo añade una covariación. | Rival |
| H4 | **Artefacto del contorno.** El efecto sigue al error de temperatura impuesto en el contorno, no al contraste físico entre bahía y mar. | Rival (artefacto) |
| H0 | No hay contraste térmico estacional entre bahía y mar (premisa de H1 falsa). | Nula para E3 |

## Experimentos

| E | Qué | Coste | Discrimina | Prioridad |
|---|---|---|---|---|
| **E1** (X1) | Medias mensuales de T_bahía − T_contorno (o de la densidad) frente a la anomalía de edad (con flujo de calor − base), en las ejecuciones anuales de 28 °C y OISST | 0 si T se guardó; si no, ~130 horas-núcleo (repetir OISST guardando T y S) | H1 frente a H1b y H4 (P1) | **1** |
| **E2** (X2) | Factorial de un año: flujo de calor sí/no × viento real/climatológico (2 ejecuciones nuevas) | ~260 horas-núcleo | H1 frente a H3 (P2) | **2** |
| **E3** (X3) | Landsat 8/9 C2 L2: temperatura bahía − mar por estación, escenas despejadas de 2016–2025 | Horas de análisis, sin cálculo | Premisa de H1 frente a H0 (P3); con datos **públicos** | **2** |
| **E4** | Repetir la ejecución OISST guardando T, S y Δρ superficie–fondo en el canal cada 4 h (se puede hacer junto con E1) | ~130 horas-núcleo | H1 frente a H1b (P4) | 3 |
| **E5** (X5) | ρ entre el factor de caudal y el desplazamiento pareado en los 64 miembros, con IC por *bootstrap* | 0 | Interacción con el río (P5). Exploratorio; confirmatorio solo con miembros nuevos (bloque B con flujo de calor, 64 × 76 ≈ 4900 horas-núcleo) | 1 (descriptivo) |
| **E6** (X4) | Interanual: miembro central con flujo de calor, ene.–abr. de 2017–2025 | ~700 horas-núcleo | Generalidad de «dos semanas»; no discrimina mecanismos | 3 |

**Control negativo común:** la ejecución base sin flujo de calor (NC-BASE); en E2, la base con viento climatológico. En E3 se usa un par de polígonos en mar abierto a distinta distancia de la costa, para separar la adyacencia de un contraste real.

**Antes de cada experimento:** fijar la lectura en un *commit* (como hiciste con 7c74c13 y a553d4d): predicción, umbral y qué se publica según el resultado.

## Qué cambia en el texto según el resultado

| Resultado | Qué escribir |
|---|---|
| **E1 a favor de H1** (anomalía positiva cuando la bahía está más fría; nula o negativa cuando está más caliente, en ambas ejecuciones) | §5.2 pasa de «hypothesis» a «evidence from the model»: título «Winter cooling brakes the estuarine circulation». Añadir la Fig. S8. Resumen: «…mainly through winter cooling of the shallow bay». Highlight 4 o 5 nuevo con el mecanismo. |
| **E1 a favor de H1b** (la anomalía sigue al enfriamiento sin depender del contraste horizontal) | §5.2 «Convective mixing, not a reversed exchange»: cambiar Largier por la literatura de mezcla convectiva; mantener el resto. |
| **E1 a favor de H4** (la anomalía sigue al error del contorno) | Retirar §5.2. Declarar en §4.4 que parte del efecto depende de la temperatura de contorno impuesta, y presentar el flujo de calor como incertidumbre de forzamiento además de estructura. **Cambia el titular**: hay que reevaluar «one to two weeks». |
| **E2: el efecto persiste con viento climatológico** | Una frase en §4.5: «cooling, not wind variability, sets most of the winter effect». Quitar «cannot be separated». |
| **E2: el efecto se colapsa** | §5.2 se reformula hacia H3, el viento. La lección de estructura sigue en pie, porque el flujo de calor sigue cambiando la respuesta. |
| **E3: bahía más fría en invierno y más caliente en verano** | Primera observación local que apoya la estructura del modelo. Párrafo en §4.7 (junto a Sentinel-2) y figura suplementaria; frase en el resumen si sobra espacio. |
| **E3: sin contraste estacional** | Declararlo en §5.2 como evidencia en contra; la hipótesis queda débil. |
| **E5: ρ claramente negativo** | Sustituir la descripción cualitativa de §4.4 por la cifra. |
| **E5: ρ ≈ 0** | Quitar de §4.4, §5.2 y §5.6 la frase sobre el caudal. |
| **E6** | Una frase en §5.6 (Limitaciones) con el rango interanual; si la mediana interanual pasa de 14 d, revisar «about two weeks». |

## Marcadores en el manuscrito

Según el protocolo, el texto lleva marcadores rojos `\todo{EXPERIMENTO En — resultado pendiente}` donde entrarán los resultados: al final de §4.5 (E2) y de §5.2 (E1, E3). No hay cifras inventadas: todo lo que hay en el texto procede de tu V3.
