# Pendientes para los autores — FocalReview V1

Lo que no se puede resolver sin vuestros registros, datos o scripts. Por orden de prioridad para Applied Spectroscopy.

## A1. Flujo del cribado y lista EQUATOR (alta)
**Problema.** El método da 789 + 1325 registros y 111 estudios incluidos, pero no el paso intermedio. La Fig. 1 solo describe la composición de la bibliografía. Sage exige seguir la guía EQUATOR correspondiente y subir su lista; para una revisión con búsqueda estructurada, lo más defendible es PRISMA-ScR.
**Qué hacer.** Con los registros de cribado: (1) registros únicos tras unir las dos rutas y deduplicar; (2) excluidos por título o resumen; (3) textos completos evaluados; (4) excluidos tras leer el texto completo, con motivos (p. ej., solo fluorescencia, preprint, sin dispositivo propio); (5) 111 incluidos. Añadirlo como panel superior de la Fig. 1, o en una frase en §Literature search, y rellenar la lista PRISMA-ScR.
**Hecho cuando** cualquiera pueda seguir el paso de 2114 registros a 111 estudios.

## A2. Sensibilidad a las absorbancias de referencia > 2,5 (media)
**Problema.** Limón (2,85) y rosa (2,68) superan el rango de exactitud especificado del Genesys 30 y entraron en el ajuste (ahora declarado en el texto).
**Qué hacer.** Repetir la calibración de A, B y C excluyendo los puntos con A_ref > 2,5 (o esos dos colorantes, si el mínimo de 3 pares lo permite) y recalcular las RMSD de la Tabla III.
**Hecho cuando** haya una frase del tipo «Excluding reference values above 2.5 changed the RMSD by less than X», o los valores nuevos si cambian.

## A3. Efecto del ancho de banda en el sistema A (media-baja)
**Qué hacer.** Convolucionar los espectros de referencia con una gaussiana de 20 nm FWHM centrada en cada canal nominal del AS7265x y recalcular la RMSD de A frente a esa referencia. Así se separa el ancho de banda del acoplamiento óptico, que el texto dice no haber podido separar.
**Hecho cuando** el texto o el suplemento dé esa RMSD (o se mantenga la frase actual si decidís no hacerlo).

## A4. Datos de métodos que faltan (baja, rápida)
- Modelo exacto de la cámara de B (Raspberry Pi Camera v1.3, v2, v3 o HQ) y del sensor del webcam de C.
- Versiones de PySpectrometer2 y de Theremino Spectrometer.
- Ajustes del Genesys 30: paso de barrido y número de barridos promediados.
- Número de lecturas por colorante de calibración (las de validación sí constan: 100).
- Fabricante o vendedor del Little Garden spectrometer, entre paréntesis (estilo de la revista).
**Hecho cuando** la fila «Optical design» de la Tabla IV pueda decir «Yes».

## A5. Retoques de figuras (baja; requiere los scripts)
- Fig. 7: quitar el hueco entre el eje x y la leyenda; la etiqueta «Other designs» se corta en el borde derecho.
- Fig. 5: cambiar el rótulo del panel (a) de «Commercial (Genesys 30)» a «Reference (Genesys 30)», como dice el pie.

## A6. Extensión del artículo (decisión editorial)
La guía indica que los *Focal Point Reviews* suelen tener 15 000–20 000 palabras y al menos 100 referencias. El manuscrito tiene unas 9300 palabras de cuerpo y 138 referencias. Si la revisión fue invitada, confirmad con el editor la extensión acordada y mencionadlo en la carta. No recomiendo alargarlo con relleno.

## A7. Antes de enviar
- Compilar con newtx (aquí se compiló con mathptmx).
- Revisar y aprobar el borrador del resumen gráfico. Si lo usáis, añadid «and drafting the graphical abstract» a la declaración de IA.
- La revista prefiere .docx; LaTeX se acepta acompañado del PDF.
- Subir las figuras en TIFF (`figuras_envio/`), no en PDF.

---

## Prompt autocontenido (para resolver A1–A5 con otra IA o con un ayudante)

> Actúa como asistente de los autores de una revisión para *Applied Spectroscopy* (Focal Point Review) sobre espectrofotómetros de bajo coste. Tienes el fuente LaTeX corregido (`FocalReview.tex` y `sections_en/`), los registros de búsqueda y cribado, la tabla de codificación de los 111 estudios y los espectros brutos de los sistemas A (AS7265x), B (Raspberry Pi + espectroscopio de bolsillo) y C (webcam), con la referencia del Genesys 30. **No inventes ni alteres datos; no cambies ninguna cifra publicada salvo las que recalcules aquí, y documenta cada cambio.**
> 1. Con los registros de cribado, cuenta los registros únicos tras deduplicar las dos rutas (789 de OpenAlex + 1325 de citas y consultas dirigidas), los excluidos por título o resumen, los textos completos evaluados y los excluidos con su motivo, hasta llegar a 111. Añade un panel de flujo encima de la Fig. 1 actual (138 = 111 + 27) y rellena la lista PRISMA-ScR.
> 2. Recalibra A, B y C con el mismo modelo (Eq. 1: A_ref = a1(λ)·s + a0(λ); A canal a canal; B y C con base polinómica ortogonal de grado 18 y 8, seleccionado con validación cruzada dejando un colorante fuera, sin usar los colorantes de validación azul, verde y rojo) excluyendo los puntos con A_ref > 2,5. Recalcula RMSD, r², SD y CV sobre 400–700 nm como en la Tabla III y escribe una frase con el resultado.
> 3. Convoluciona la referencia con gaussianas de 20 nm FWHM en los 11 canales nominales de A (410–680 nm) y recalcula la RMSD de A.
> 4. Completa en §Systems A, B, and C los modelos de cámara, las versiones de software, los ajustes del Genesys 30, el número de lecturas de calibración y el fabricante del Little Garden, en estilo ACS (fabricante entre paréntesis, coma serial).
> 5. Regenera la Fig. 7 sin el hueco sobre la leyenda y sin recortar «Other designs», y la Fig. 5 con el panel (a) rotulado «Reference (Genesys 30)».
> Devuelve el LaTeX modificado, las figuras nuevas (TIFF ≥ 600 ppi para dibujo lineal) y una lista de cambios con «antes / después / motivo».
