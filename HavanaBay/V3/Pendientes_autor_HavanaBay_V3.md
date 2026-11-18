# Pendientes y peticiones — HavanaBay V3 (modo «full», 17-nov-2026)

## Consultas (respuesta corta)

- **Q1.** §4.4 y §5.1 dicen que el rango P5–P95 de los 64 miembros sin flujo de calor abarca 5,3 d. Con los valores redondeados (5,5–10,7) sale 5,2. ¿Es 5,3 con los valores sin redondear? Si es 5,2, cámbialo en los dos sitios (la conclusión no cambia: 5,4 frente a 5,2).
- **Q2.** §5.2 tiene en azul (`\prov`) «when the sea is usually warmer than 28 °C». Confírmalo con OISST de julio–septiembre de 2016 frente a la bahía; si se confirma, sustitúyelo por la cifra (p. ej. «when OISST off the bay was X–Y °C»). Si no, quita la frase y el cuarto argumento a favor.

## Experimentos y análisis (por impacto)

### X1. Prueba decisiva del freno térmico
**Qué:** para las ejecuciones anuales de 28 °C y de OISST, calcula las medias mensuales de (a) la temperatura media de la bahía menos la del contorno abierto (o la densidad) y (b) la anomalía de edad (con flujo de calor − base). Representa (b) frente a (a): son 24 puntos, con un color por ejecución.
**Predicción de la hipótesis:** anomalía positiva cuando la bahía está más fría que el mar y negativa (o nula) cuando está más caliente; la de 28 °C en jul.–sep. debería caer en el cuadrante «bahía más caliente, anomalía negativa».
**Si T no se guardó:** repite la ejecución anual de OISST guardando T y S cada 4 h (~130 horas-núcleo), y aprovecha para guardar también Δρ superficie–fondo en el canal.
**Hecho cuando:** Fig. S8 y 2–3 frases en §4.5; §5.2 pasa de «hypothesis» a «evidence» o se reformula si no se cumple.

### X2. Separar enfriamiento y viento (factorial 2 × 2 de un año)
**Qué:** dos ejecuciones anuales nuevas del miembro central: (i) flujo de calor + OISST con viento climatológico (media mensual de ERA5, o sin esfuerzo de viento), y (ii) sin flujo de calor con ese mismo viento. Junto con las dos existentes forman un factorial 2 × 2.
**Coste:** ~260 horas-núcleo.
**Hecho cuando:** una tabla 2 × 2 de edades medias por estación y una frase que diga cuánto del efecto invernal es enfriamiento y cuánto viento. Fija la lectura antes de lanzar, con su *commit*.

### X3. Landsat 8/9 térmico (público)
**Qué:** temperatura superficial (banda 10, Collection 2 Level 2) de la bahía frente al mar adyacente, en escenas despejadas de 2016–2025, separando dic.–mar. y jun.–sep.
**Por qué:** es una prueba observacional de la premisa (bahía más fría en invierno, más caliente en verano) con datos públicos, coherente con el artículo.
**Hecho cuando:** un párrafo en §4.7 o §5.2 y una figura suplementaria, con la diferencia bahía − mar por estación y su incertidumbre.

### X4. Variabilidad interanual en la estación seca
**Qué:** el miembro central con flujo de calor + OISST, de enero a abril de cada año entre 2017 y 2025 (9 ejecuciones × ~76 horas-núcleo).
**Hecho cuando:** una frase en §4.5 o §5.6 («across 2016–2025 the dry-season bay-mean age with the heat flux ranged from X to Y days») y retirar o matizar la limitación de un único año.

### X5. Interacción caudal × flujo de calor (sin ejecuciones)
**Qué:** ρ de Spearman entre el factor de caudal y el desplazamiento pareado (con − sin flujo de calor) en los 64 miembros.
**Hecho cuando:** sustituir en §4.4 «The shift is largest in the members with the least river water…» por la misma frase con ρ, y quitar en §5.6 la generalización si ρ no es claro.

## Otros pendientes

- **X6. Resumen gráfico:** actualizarlo al nuevo título. Panel central: medianas por zona sin y con flujo de calor (64 miembros). Panel derecho: S_T de las 9 entradas y una barra separada «air–sea heat flux (structural)» con el desplazamiento de 5,4 d frente a la dispersión de 5,3 d. Titular: «One structural choice weighs as much as nine uncertain inputs».
- **X7. Enlaces:** rellenar los 8 `\ph{}` y hacer accesible el estudio de Sentinel-2.
- **X8.** Contrastar con cifras.md las cifras nuevas de §4.4–4.5 (7.6, 5.5–10.7, 13.2, 8.3–18.4, 5.4, 5.3, 24.4, 1/64, 59/64, 58/64, 49→64, 42→63, 0→27, −0.79, −0.91, −0.13, 11.4, 88/365, 5.1–21.1, 21.0, 11.4–13.9, 6.1, 6.3, ρ +0.32/+0.51/−0.01, +0.75/+0.66, +0.14) y los costes (3.5 × 10³, 3.1 × 10³, 380).
- **X9.** `figuras/fig_heatflux.pdf` va recortada de tu PDF compilado. Sustitúyela por tu archivo original para el envío.
- **Opcional:** evaporación − precipitación en la ejecución anual con flujo de calor (1 ejecución) para cerrar la otra simplificación de la estructura.

---

## Prompt para resolverlo con otra IA (autocontenido)

> Eres coautor técnico del artículo «When model structure matters as much as the data: water renewal in Havana Bay, Cuba, from public-data ensembles» (SCHISM, Environmental Modelling & Software). Tienes el repositorio del modelo, sus salidas y el LaTeX. En orden: (Q1) recalcula con los valores sin redondear el rango P5–P95 de la edad media de la bahía en los 64 miembros del bloque A sin flujo de calor y corrige «5.3» en §4.4 y §5.1 si hace falta; (Q2) extrae de OISST la temperatura frente a la bahía en jul.–sep. de 2016 y sustituye el texto `\prov{...}` de §5.2 por la cifra, o elimina la frase si no supera 28 °C; (X5) calcula la ρ de Spearman entre el factor de caudal y el desplazamiento pareado y ponla en §4.4; (X1) calcula las medias mensuales de T_bahía − T_contorno y de la anomalía de edad en las ejecuciones anuales de 28 °C y OISST, haz la figura suplementaria y reescribe §5.2 según el resultado; (X2–X4) solo si se lanzan las ejecuciones, con la lectura fijada antes en un *commit*. Restricciones: no inventes ni ajustes datos; cada cifra debe salir de un cálculo reproducible con su *commit*; si un resultado contradice la hipótesis de §5.2, dilo en el texto y retira la hipótesis; no cambies umbrales a posteriori. Mantén el resumen ≤ 150 palabras y los *highlights* ≤ 85 caracteres. Entrega `main.tex`, las figuras, la lista de cifras cambiadas (antes → después, con el *commit*) y el PDF.
