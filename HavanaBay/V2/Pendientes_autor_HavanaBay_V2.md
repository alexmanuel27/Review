# Pendientes y peticiones al autor — HavanaBay V2 (16-nov-2026)

Me pediste que pidiera datos, figuras y experimentos nuevos para subir el nivel. Están ordenados por impacto en la revisión. Lo marcado «Imprescindible» es lo que un revisor de EMS pedirá casi seguro.

## B1. Figura central del flujo de calor — Imprescindible

Hoy la Fig. 7 es `fig_robustness.pdf` (120 días). Es útil, pero el resultado clave está en las dos pruebas posteriores, que no tienen figura.

**Especificación** (`figuras/fig_heatflux.pdf`, ancho de dos columnas, 3 paneles):
- **(a)** Edad media de la bahía, diaria, 1 ene–31 dic 2016: base (sin flujo de calor), flujo de calor + OISST y flujo de calor + 28 °C. Línea fina para los valores diarios y gruesa para la media móvil de 30 d. Sombrear la ventana de días 90–120 y marcar 7 y 14 d.
- **(b)** Subconjunto de 16 miembros: edad sin flujo de calor (eje x) frente a con flujo de calor (eje y), con línea 1:1 y color según el factor de caudal. El mensaje es «todos por encima de la diagonal».
- **(c)** Opcional pero muy valioso: en el mismo eje temporal que (a), flujo neto superficial ERA5 (W m⁻²) y diferencia de densidad superficie–fondo en el canal (σ_t).

**Pie propuesto:** «Effect of the air–sea heat flux. (a) Bay-mean water age in the central member through 2016 without heat flux and with the ERA5 heat flux and an open boundary at 28 °C or at the daily OISST temperature (thin, daily; thick, 30-day running mean). (b) Bay-mean age of the 16 members of block A without and with the heat flux and OISST temperature, coloured by the river discharge factor; the line is 1:1. (c) Net air–sea heat flux and surface–bottom density difference in the channel.»

**Hecho cuando:** la figura sustituye a la Fig. 7 actual y `fig_robustness` pasa al suplemento, o se queda como panel extra.

## B2. Mecanismo de la variabilidad con flujo de calor — Imprescindible

El texto dice «we did not identify the events that build up and reset the age». Un revisor lo pedirá.

- Compara la serie de edad con flujo de calor con el flujo neto ERA5, el esfuerzo del viento (sobre todo los nortes y frentes fríos de enero a marzo) y ΔT, ΔS y Δρ superficie–fondo en el canal.
- Hipótesis comprobable: el enfriamiento invierte o anula el contraste de densidad del agua de río, frena la circulación estuarina y la edad crece; un evento de viento o de calentamiento la restablece. Si Δρ en el canal cae cuando la edad sube, está demostrado.

**Hecho cuando:** hay una o dos frases en §4.5 con la causa (o la evidencia en contra) y el panel (c) de B1.

## B3. Cifras exactas — Imprescindible

- Media anual 2016 de la edad media de la bahía en la ejecución con flujo de calor + OISST, y media mensual mínima y máxima, con sus meses.
- Confirma lo que leí en la Fig. 7: «with OISST the age climbs to about 20 days by early March, falls to about 8 days within two weeks and rises again», y que las ejecuciones sin flujo de calor quedan entre ~5 y 10 d después del primer mes. Si no cuadra, corrígelo en §4.5.
- ¿Qué 16 miembros del bloque A? (¿las primeras 16 filas?). Escríbelo en §3.5.

## B4. Ensamble con flujo de calor — Muy recomendable (experimento)

Es la respuesta completa a la objeción «la configuración principal es la menos realista».

- **Opción mínima:** los 64 miembros del bloque A con flujo de calor + OISST (~4 900 horas-núcleo a 76 por miembro). Da la Tabla 4 con fracciones exactas, una distribución completa de la edad y separa el caudal de la amplitud de marea, que hoy aparecen colineales.
- **Opción completa:** un Saltelli con N = 16 (176 miembros, ~13 000 horas-núcleo), que da índices de Sobol bajo la estructura realista. La Fig. S6 muestra que el orden ya es estable con N = 16.
- **Protocolo:** fija por escrito, antes de lanzar, qué conclusiones se prueban (las mismas C1–C8 y P), con su *commit*.

**Hecho cuando:** columna nueva en las Tablas 3 y 4 y, si es Saltelli, un panel extra en la Fig. 5. El resumen podría entonces dar el rango con flujo de calor.

## B5. Datos de observación — Muy recomendable

- **Públicos (encaja con la filosofía del artículo):** temperatura superficial de Landsat 8/9 (banda térmica, 30 m remuestreada a 100 m) en escenas de enero a abril de 2016, comparada con la temperatura superficial del modelo con flujo de calor + OISST. Si cuadra, es la primera comprobación local del proceso que más pesa.
- **No públicos (como comparación opcional, según tu regla):** cualquier perfil CTD, registro de temperatura o salinidad en la bahía o el canal (CIMAB, GEOCUBA, ENPSES o campañas propias). Un solo perfil de salinidad en el canal pondría a prueba C7.

**Hecho cuando:** hay un párrafo en §3.6 y §4.6, o una figura suplementaria con la comparación.

## B6. Resumen gráfico — Imprescindible

El actual muestra «Bay, with heat budget (no equil.)» en 11 d y el titular «About one week within the ensemble».

- Panel central: medianas y P5–P95 por zona en el ensamble y, al lado, las medianas del subconjunto de 16 con flujo de calor (bahía: 13,8; 9,2–17,7).
- Titular: «About one week without the heat flux, about two weeks with it — never months».
- Panel derecho: mantener S_T y añadir una barra «Air–sea heat flux (structural)» con el desplazamiento de 6,4 d frente al rango de 4,8 d, en otro color y claramente separada de los índices.

## B7. Trazabilidad de las pruebas posteriores

Las dos pruebas con flujo de calor «each with its reading fixed before the runs» necesitan su *commit* y su fecha, como los otros protocolos, en Datos disponibles.

## B8. Referencia Ponce Portela

La bib dice 2016, vol. 37(3); OpenAlex dice 2012 (riha.cujae.edu.cu, artículo 346). Compruébalo en la web de la revista.

## B9. Enlaces y estudio de Sentinel-2

Rellenar `\ph{nombre_repositorio}`, `\ph{link_repositorio}` y `\ph{link_sentinel2}`, y hacer accesible el estudio de Sentinel-2 a los revisores (preprint o material confidencial).

## B10. cifras.md

Contrastar con `docs/articulo/cifras.md` todas las cifras nuevas de §4.5 (6.57, 15.4, +0.55, 10.4, 18.2, 16.7, 7.4, 13.8, 9.2–17.7, 14/16, ρ = −0.80, ρ parcial = −0.39 y 0.44) y las de la Fig. S6.

---

## Prompt para resolverlo con otra IA (autocontenido)

> Eres coautor técnico del artículo «Water renewal in Havana Bay, Cuba: robust and fragile conclusions from public-data ensemble simulations» (SCHISM, ensamble Sobol de 704 miembros, Environmental Modelling & Software). Tienes acceso al repositorio del modelo, a sus salidas y al LaTeX en `articulo/`. Haz, en este orden: (B3) calcula la media anual 2016 y las medias mensuales mínima y máxima de la edad media de la bahía en la ejecución con flujo de calor + OISST, comprueba las frases de §4.5 que describen la Fig. 7 e indica qué 16 miembros del bloque A se usaron; (B1) genera `figuras/fig_heatflux.pdf` según la especificación de `Pendientes_autor_HavanaBay_V2.md` y sustituye con ella la Fig. 7; (B2) relaciona la serie de edad con el flujo neto ERA5, el viento y Δρ superficie–fondo en el canal, y escribe en §4.5 una o dos frases con lo que muestran los datos, aunque sea negativo; (B6) actualiza el resumen gráfico; (B7–B10) completa los *commits*, la referencia y los enlaces, y contrasta todo con cifras.md. Restricciones: no inventes ni ajustes datos; cada cifra nueva debe salir de un cálculo reproducible con su *commit*; no cambies umbrales ni reglas de los protocolos a posteriori, y si algo contradice el texto, corrige el texto y dilo. Mantén el resumen ≤ 150 palabras y los *highlights* ≤ 85 caracteres. Entrega `main.tex` actualizado, las figuras, la lista de cifras cambiadas (antes → después, con el *commit*) y el PDF compilado.
