# Informe de cambios — HavanaBay V1

**Manuscrito:** *Water renewal in Havana Bay, Cuba: robust and fragile conclusions from public-data ensemble simulations* (Rivera-Rivera et al.)
**Revista objetivo:** Environmental Modelling & Software (Elsevier), artículo de investigación
**Recibido:** 14-nov-2026, paquete LaTeX completo (`main.tex`, `referencias.bib`, clase `ems-dc`, 19 figuras). Compila sin avisos.
**Fecha del informe:** 14-nov-2026

---

## 1. Resumen ejecutivo

El artículo es sólido y está escrito con una honestidad poco habitual: protocolos fijados antes de los resultados, control de azar espacial que anula su propia coincidencia con Sentinel-2 y límites declarados. Cuadré con las figuras todas las cifras que se pueden comprobar (Sobol, edades por zona, fracciones de agua de río, caudal de intercambio ≈ 50 m³ s⁻¹, T_f ≈ 1,8–2,0 d, 47 hm³ → 4,5 m³ s⁻¹, factor 60), y cuadran. El fallo principal estaba en el mensaje: el resumen y los *highlights* decían «una semana», mientras que la propia prueba de balance de calor da al menos 11 días, sin llegar al equilibrio, y la Discusión ya concluía «una a dos semanas». He alineado todo el texto con esa conclusión (decisión de Alex). Además he declarado como desviación del protocolo el caso T1 de los trazadores, he corregido dos atribuciones a fuentes (profundidad del canal y origen de los caudales de 2002), he añadido una frase para los revisores de análisis de sensibilidad, he completado los DOI y he adaptado la declaración de IA al modelo de Elsevier.

**Estimación honesta:** revisión mayor acotada; puede quedar en revisión menor si se resuelven A1 y A2. Lo que más pesa es que la configuración más realista (flujo de calor con OISST) cambia la edad más que cualquier entrada muestreada y no llega al equilibrio en 120 días, y que N = 64 es una muestra pequeña para una revista donde publican Saltelli, Pianosi y Razavi. Nada de eso es un error, pero los revisores lo pedirán.

## 2. Cambios aplicados (nivel 1 y nivel 2 aprobado)

### 2.1 Ciencia y encuadre

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| Resumen (150 palabras) | «The air–sea heat budget, not sampled in the ensemble, lengthens it to about 11 days.» | «…not sampled, raises the age to at least 11 days: the bay is renewed in one to two weeks, not months.» | «it» era ambiguo; 11,2 d sigue subiendo (+0,24 d/d), así que «at least»; titular alineado con la Discusión (nivel 2, aprobado) |
| Resumen | «The bay-mean age is 7.8 days… never above 14 days» | «Within the ensemble the bay-mean age is 7.8 days… never above 14 days» | Con el flujo de calor y el contorno a 28 °C llega a 16,8 d: el «nunca» vale solo dentro del ensamble |
| *Highlight* 3 | «…renews the bay in about a week.» | «…renews the bay in one to two weeks.» (80 caracteres) | Nivel 2, aprobado |
| *Highlight* 5 | «…lengthens the flushing by about 70%.» | «…raises the water age by at least 70%.» (76 caracteres) | La métrica es la edad, no el *flushing*; la serie no llega al equilibrio |
| Conclusión (1) | «…lengthens it by a factor of about 1.7» | «…by a factor of at least 1.7» | Igual |
| Conclusión (2) | termina en «remain open» | + «With the heat budget… at least 11 days, so the bay is renewed in one to two weeks, not months.» | Mismo mensaje en resumen, *highlights*, Discusión y Conclusiones |
| §5.3 | «…lengthens the age by a factor of about 1.7, not by an order of magnitude» | «…by a factor of 1.7 within 120 days (1.9 over the last 5 days); the age was still rising, but it remained about an order of magnitude short of four months» | Afirmación excesiva: sin equilibrio no se puede descartar un factor mayor; lo que sí se sostiene es la distancia a cuatro meses (120/12,7 ≈ 9) |
| §5.4 | — | + «This ranking is conditional on the ranges of Table 2: the discharge factor spans a factor of eight, whereas the tide and wind factors span ±10–20%. It shows which of the present uncertainties matter most, not which processes matter most.» | Es la primera objeción que pondría un revisor de análisis de sensibilidad (cf. Saltelli et al. 2019, ya citado) |
| §3.5 Trazadores | «Having seen these results, the first author decided to accept T1…; the threshold and the rule were not changed.» | «Keeping the tracer results is therefore a deviation from the protocol, which we declare here… and report only conclusions that hold with both tolerances.» | Nivel 2, aprobado: con la redacción anterior la regla parecía incumplida en silencio |
| Tabla 4 (pie) | — | + «Case T1 failed the tracer-budget check of the protocol; R1–R4 hold with both transport-solver tolerances (Section 3.5).» | Igual |
| Introducción | «It has been modelled only for… and no peer-reviewed study has quantified…» | «To our knowledge, it has been modelled only for…» | No se puede afirmar una novedad a partir de una búsqueda |
| Introducción, final | — | + párrafo: el procedimiento es parte de la contribución (solo datos públicos y código abierto, repetible en otras bahías) | EMS pide contribuciones generalizables; la idea ya estaba en §5.6, ahora se anuncia desde el principio |
| §4.2 | «The zones age in the same order in every member» | «The channel, the main basin, Guasabacoa and Atarés age in that order in every member» | Marimelena no mantiene su posición (C3 es frágil, 0,76) |

### 2.2 Fidelidad a las fuentes

| Ubicación | Antes | Después | Motivo |
|---|---|---|---|
| §2 | «entrance channel… is maintained at 12.8 m (Prácticos 2018)» | «…is 12.8 m deep according to the harbour pilots» | La ficha de prácticos da «Su profundidad es de 12.8 m» pero no dice que se mantenga ni que esté dragado |
| §2 | «come from a single survey in August 2002» | «are a single set of values dated August 2002 (CIMAB) and reported by JICA (2004)» | JICA (Tabla 1.1, p. R-3) da la fuente como «CIMAB, agosto del 2002», no como una campaña de aforos; los valores están en m³/d y la conversión cuadra |
| Tabla 1, Tabla 2, §5.4, §5.5 | «Survey of August 2002», «the 2002 survey», «one survey in 2002» | «Values of August 2002 (CIMAB), in JICA (2004)», «the 2002 values», «one set of 2002 values» | Coherencia con lo anterior |
| §5.4 | «…that left out sewage and drains» | «…that does not include sewage or drains» | «Left out» atribuye una omisión; la fuente solo no los cuantifica |
| §2 | «agree with neither source» | «agree with neither the charts nor the pilots' depths» | Ambigüedad |

Verificado en JICA (2004): 4 meses sin método (p. R-7), 47 millones de m³ y 9 m (p. 1 y R-1), 0,29 m de marea media (p. R-7), caudales de 114 860, 62 105 y 8004 m³/d, que equivalen a 1,33, 0,72 y 0,09 m³/s, y «no existen estaciones de medición permanentes» (p. R-3). En la ficha de prácticos: canal de 1530 m de largo y 220–330 m de ancho, y calados de 9,75–11,58 m.

### 2.3 Redacción y claridad

| Ubicación | Antes | Después |
|---|---|---|
| §3.2 | «the open boundary is held at 36 and 28 °C» | «held at a salinity of 36 and a temperature of 28 °C» |
| §4.1 | «in the channel, surface water is 6.5 days old and bottom water 1.9 days» | «over the last 30 days of the year the surface water in the channel is 6.5 days old and the bottom water 1.9 days» (la Tabla 5 da 6,6/1,8 para la ejecución de 120 d: con esto se distinguen) |
| §4.1 | «Dividing the bay volume by the mean age» | «Dividing the bay volume of the central member by its mean age» |
| §4.6 | «gives correlations up to 0.61 in 5% of the shifts» | «5% of the shifted satellite maps give correlations of 0.61 or more, and 16% beat the observed value» |
| Introducción | «a nineteenth-century nautical chart» | «two nineteenth-century editions of one nautical chart» |
| Resumen | reescrito para que quepa en 150 palabras con el nuevo mensaje | — |

El resto de la redacción es clara y natural; no he reescrito por estilo. Todos los cambios están en el diff.

### 2.4 Referencias (63 entradas, todas comprobadas)

- 58 entradas comprobadas en OpenAlex: 52 verificadas directamente; 5 confirmadas a mano (Deleersnijder 2001 por su DOI; GEBCO en CEDA/BODC; FES2022 y EOT20, donde solo difiere la forma del autor; Hansen 1965, del que OpenAlex devuelve la reimpresión de 2021); 1 dudosa (Ponce Portela). De las 5 sin DOI, JICA y la ficha de prácticos se leyeron; las dos cartas del USHO y OSM no se abrieron.
- **DOI añadidos (11):** Deleersnijder 2001, Monsen 2002, Zhang 2016, Hersbach 2020, Sobol' 2001, Saltelli 2010, Persson & Strang 2004, Umlauf & Burchard 2003, Saltelli 2002, Jansen 1999 y Fischer 1979.
- **GEBCO:** el DOI es correcto (CEDA/BODC); el autor pasa a «GEBCO Bathymetric Compilation Group 2026», que es la forma de cita oficial.
- **Contenido frente a frase:** comprobado en Doda 2022 (enfriamiento diferencial), Largier 1997 (inversión por evaporación), Sterckx 2011 (adyacencia), Ralston 2019 (dragado), Plant 2002 y Cea 2012 (error batimétrico correlacionado), Belmonte Rivas 2019 (sesgos de viento de ERA5), Alber 1999 y Sheldon 2002 (tiempo de lavado del agua dulce), y JICA y prácticos (arriba). Todas apoyan su frase.
- **A revisar (A6):** Ponce Portela & Córdova López, que OpenAlex fecha en 2012 (riha, artículo 346) frente a 2016, vol. 37(3); y Poirier 2020, al que le falta el volumen.

### 2.5 Formato de la revista

- Resumen: 150 palabras (límite 150). *Highlights*: 5, de 69 a 80 caracteres (límite 85). Palabras clave: 7.
- *Software availability*: añadidos *Software required*, *Hardware required* y *Availability and cost*, con datos que ya estaban en el manuscrito.
- Declaración de IA reescrita con el modelo de Elsevier («During the preparation of this work… take full responsibility…»).
- Compila sin avisos: 15 páginas con el suplemento (antes 14; la página 14 solo tiene 2 líneas de bibliografía y el suplemento va aparte al enviar).
- La guía de EMS no se pudo descargar (error del servidor). Me baso en tu comprobación del 17-oct anotada en la cabecera del `.tex`.

## 3. Decisiones de nivel 2

| Pregunta | Decisión de Alex | Qué se hizo |
|---|---|---|
| Mensaje principal: «una semana» o «una a dos semanas» | Una a dos semanas | Resumen, *highlight* 3, conclusión (2); 7,8 d se mantiene como resultado del ensamble |
| Caso T1 que falla el control prerregistrado | Declararlo como desviación | §3.5 y pie de la Tabla 4 |
| Nota de coprimeros autores | No | Sin cambios |

## 4. Pendientes de nivel 3 (para el autor)

Detalle e instrucciones en `Pendientes_autor_HavanaBay_V1.md`. En resumen:

- **A1 (prioritario):** alargar la ejecución con flujo de calor y OISST hasta el equilibrio (≥ 240–365 d, o 2016 completo como las de mecanismo). *Hecho* = tendencia ≤ 0,05 d/d en los últimos 10 días, con la edad final declarada.
- **A2:** convergencia de Sobol con N = 16, 32 y 64 sobre el diseño existente (sin ejecuciones nuevas). *Hecho* = el orden de S_T y la dominancia del caudal se mantienen.
- **A3:** Fig. 6d dice «Residence time» en el eje y el texto «renewal time»; además, aclarar si «6–11%» (R2) es relativo o en puntos.
- **A4:** justificar en una línea cada rango de la Tabla 2 (sobre todo el caudal, 0,25–2, y C_d), confirmar si los valores CIMAB de agosto de 2002 son un aforo en estación húmeda y explicar por qué 2016.
- **A5:** tabla suplementaria con las distribuciones triangulares del prisma de marea.
- **A6:** referencias de Ponce Portela (año) y Poirier (volumen).
- **A7:** hashes o etiqueta de los tres protocolos (o una instantánea en Zenodo) para que las fechas se puedan verificar; rellenar los enlaces en rojo.
- **A8:** el estudio de Sentinel-2 acompañante debe ser accesible para los revisores (preprint o material confidencial).
- **A9 (opcional):** explicar las velocidades de 6 m/s en el contorno abierto.
- **A10:** contrastar todas las cifras con `cifras.md` del repo del modelo (no pude acceder a esa carpeta).

## 5. Riesgos que aún puede señalar un revisor

1. El balance de calor, fuera del ensamble, cambia la edad más que el caudal (A1). Es el punto más débil y el texto ya lo admite.
2. N = 64 con d = 9: S₁ del caudal (0,86) mayor que S_T (0,67) llamará la atención aunque esté explicado (A2).
3. No hay ninguna observación local; la comparación con Sentinel-2 no se distingue del azar. Está bien declarado, pero algún revisor pedirá al menos una medida (perfiles de salinidad).
4. «Prerregistro» interno, en el propio repositorio y no en un registro público: «in the spirit of» es la formulación correcta, pero conviene dar los hashes (A7).
5. Todas las ejecuciones son de enero a abril de 2016, sin variabilidad interanual (ya está en Limitaciones).

## 6. Nota de coherencia (no forma parte del envío)

La autoría, las afiliaciones, el CRediT, la financiación y la declaración de IA siguen el modelo de FocalReview, como indica tu comentario. Si FocalReview mantiene la redacción antigua de la declaración de IA, conviene unificarla con la nueva. El estudio de Sentinel-2 citado como acompañante debería tener el mismo nombre en ambos envíos.

## 7. Herramientas y límites

Usé research-desk:paper-critique, el paquete reference-lookup (OpenAlex/Crossref) sobre las 63 entradas, búsqueda web para GEBCO, JICA y la ficha de prácticos, compilación con latexmk y diff por palabras del fuente (latexdiff no está instalado). **No pude verificar:** `cifras.md` ni los datos del repo del modelo (acceso denegado a esa carpeta), la guía de EMS en línea (error del servidor), el año de Ponce Portela ni el estudio de Sentinel-2 (sin publicar).
