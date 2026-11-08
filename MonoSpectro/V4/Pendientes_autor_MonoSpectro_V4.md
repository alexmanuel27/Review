# Pendientes para el autor — MonoSpectro V4 (3 nov 2026)

Manuscrito: «Portable Spectrophotometry Using a Monochrome Camera» (SpecToGo), IEEE Sensors Letters, 4 páginas como máximo con referencias.
Primero pega el texto de `MonoSpectro_V4_texto_corregido.md` en el `.tex` y compila (A8).

| # | Qué hacer | Hecho cuando |
|---|---|---|
| A1 | Confirmar si las pruebas de la Tabla I (Hg, deriva y repetibilidad) se hicieron con la salida procesada de 8 bits o con RAW de 10 bits y *dark*. Si fue RAW, decirlo en la frase de la Sec. II («made in a later session with the instrument realigned…») y quitar «8-bit» de la fila Detector o separarlo. | La Tabla I describe la sesión real. |
| A2 | Nombrar la métrica de las tres preparaciones independientes (1,3, 2,7 y 6,6 %): RSD o rango. | La métrica aparece en el texto. |
| A3 | Dar la incertidumbre de g₀, g₁ y h (bootstrap remuestreando las 9 muestras de calibración) y su correlación. Añadir una frase sobre por qué g(780 nm) = 0,96 < 1 (probable compensación entre g₁ y h). | Coeficientes con ± y una frase. |
| A4 | Leer el resumen de Bouveresse, Massart y Dardenne 1995 (doi:10.1021/ac00104a013). Si modifica el algoritmo de Shenk (pendiente y sesgo por longitud de onda), no apoya «slope-and-bias … far fewer degrees of freedom» ni la fila «Gain + offset [9]»: sustituirla por una referencia de corrección *slope/bias* global o citar la revisión [7] (Workman 2018). | Cita verificada. |
| A5 | Completar la nota de la Tabla II: forma de «Linear gain + offset» (4 coeficientes) y de «Degree 2/3» (qué variables y qué grado). | Todas las filas definidas. |
| A6 | Subir al repositorio los espectros de ambos instrumentos y el código de análisis antes del envío. Opcional: DOI de Zenodo y licencia CC BY 4.0 para los datos. | El enlace contiene lo que dice el texto. |
| A7 | Confirmar cómo se calibró λ para los datos de calibración y validación (V2: máximos de soluciones; V3–V4: lámpara fluorescente). | Anotado y coherente. |
| A8 | Compilar con IEEEtran y comprobar las 4 páginas (el texto nuevo suma ~55 palabras). Si se pasa, recortar la frase geométrica de la Sec. II (sin θ₁…). | 4 páginas. |
| A9 | (Opcional, muy recomendable) Con el instrumento realineado: recalibrar λ con Hg, medir 2–3 soluciones de calibración y un colorante nuevo, y aplicar los coeficientes **existentes** de la Ec. (2) sin reajustar. Dar el RMSE. | Una frase en la Sec. V con el resultado. |
| A10 | Nombrar la marca o fabricante de los colorantes alimentarios. | Marca en la Sec. IV. |

**Riesgo abierto (decisión de Alex):** no se declaran la exclusión del azul de bromotimol ni que el LOO no prefería el término cuadrático. Si cambias de idea, basta con una frase al final de la Sec. III:
«A fourth validation dye, bromothymol blue, was measured but excluded after scoring because its band lies mostly below 450 nm, where the halogen lamp emits little light; leave-one-out cross-validation within the calibration set does not distinguish Eq. (2) from its linear term alone.»
(Comprueba que ambas afirmaciones siguen siendo ciertas con los datos actuales.)

---

## Prompt para resolverlo con otra IA

```
Eres coautor técnico del manuscrito «Portable Spectrophotometry Using a Monochrome Camera»
(SpecToGo, IEEE Sensors Letters, máximo 4 páginas con referencias). Tienes el .tex, el .bib,
los datos de calibración/validación y los scripts de análisis.

Restricciones de integridad: no inventes ni alteres datos; no combines datos con la
referencia; cualquier cifra nueva debe salir de un script que guardes junto al resultado;
si algo no se puede calcular con los datos disponibles, dilo y no lo rellenes.
No cambies las cifras ya publicadas salvo que el recálculo demuestre un error, y en ese
caso informa del valor antiguo y del nuevo.

Tareas:
1. Tabla I: determina, a partir de los archivos de la sesión de caracterización (Hg, deriva,
   repetibilidad), si se usó la salida procesada de 8 bits o RAW de 10 bits con dark.
   Ajusta la fila Detector y la frase de la Sec. II en consecuencia.
2. Indica si 1.3, 2.7 y 6.6 % (preparaciones independientes) son RSD o rango, y recalcúlalo.
3. Bootstrap (≥1000 remuestreos de las 9 muestras de calibración) de g0, g1 y h de la Ec. (2):
   da media ± DE y la matriz de correlación. Redacta una frase sobre g(780 nm) = g0 + g1 < 1.
4. Escribe la nota de la Tabla II definiendo «Linear gain + offset», «Degree 2» y «Degree 3»
   según el código que las calcula.
5. Lee el resumen de Bouveresse et al. 1995 (doi:10.1021/ac00104a013). Si no es una
   corrección slope/bias global, propone una referencia verificada (con DOI) que sí lo sea.
6. Compila y verifica que el PDF tiene 4 páginas. Si se pasa, recorta sin quitar cifras.
Entrega: .tex modificado, script(s) usados, y una lista de cambios con antes/después.
```
