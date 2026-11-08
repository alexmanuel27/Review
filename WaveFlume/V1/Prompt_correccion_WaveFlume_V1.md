# Prompt de corrección — WaveFlume V1

> Copia este prompt en una IA junto con el manuscrito (fuente LaTeX), los datos η(x,t) de los 31 ensayos y los scripts de análisis.

---

Eres coautor técnico del manuscrito *Determination of the stationary state in an experimental small-scale 2D wave flume using image processing*. Un árbitro ha pedido una revisión mayor. Corrige el artículo con estas reglas de integridad: no inventes datos ni resultados; toda cifra nueva debe salir de un cálculo reproducible con los datos disponibles; si algo exige nuevas medidas, márcalo como `[REQUIERE MEDIDA: …]` y no lo rellenes; declara cualquier exclusión o cambio de criterio.

**1. Estado estacionario (núcleo del artículo).**
- Explica en el texto que η_rms espacial ∝ a_I√(1+R²), y que por eso es casi insensible a la reflexión (≤3 % con R ≤ 0,25).
- Calcula, con los datos, a_I(t), a_R(t) y R(t) por separación (Ec. 22) en ventanas deslizantes de 2–5 periodos. Define el inicio del estado estacionario también con R(t) y con CV_σ(t). Compáralo con t_s.
- Calcula el tiempo de ida y vuelta 2·2,30 m / c_g para cada ensayo y discútelo frente a t_s − t_a. En 27/31 ensayos t_s − t_a es menor.
- Haz el espectro de η_rms suavizado después de t = 42 s para identificar las modulaciones lentas. Compara con el seiche longitudinal (~3,6 s), con batidos de armónicos libres y con la variabilidad del periodo de la pala.
- Presenta L = 0,34 H̄ como lo esperado para una sinusoide (1/(2√2) = 0,354), no como hallazgo general.

**2. Pala.** Reconstruye el desplazamiento real de la pala desde el programa de pasos (rampas truncadas + tiempo muerto de 21,7 ms). Si existe, usa el registro del encoder. Calcula la amplitud de su primer armónico, S₁, y su contenido en armónicos. Rehaz H_lin con S₁. Presenta la desviación de f₁ como diagnóstico del firmware y propone la corrección del control.

**3. Comparación con la teoría lineal.** Rehaz la Fig. 12a comparando 2a_I (onda incidente, primer armónico) con F(κh)·S₁, y mantén H̄ solo como información secundaria. Corrige el resumen, la §5 y las conclusiones según el resultado. Elimina la afirmación de que las ondas reflejadas solo alteran H̄ a segundo orden si 2a_I/H̄ = 0,69–0,90 la contradice.

**4. Medida óptica.** Añade al presupuesto GUM, o declara como limitación cuantificada, los siguientes sistemáticos: banda del menisco de 2–3,5 mm, distorsión del objetivo, plano del patrón frente a la cara interior del acrílico (desplazamiento aparente ≈ 3,3 mm) y paralaje. Rebaja la conclusión sobre el exceso de η_c/H̄ frente a Stokes mientras el menisco no esté acotado. Da la distancia y la altura de la cámara, y di si la exposición y el enfoque estaban bloqueados. `[REQUIERE MEDIDA: validación con cambio de nivel estático + limnímetro de punta o sonda; calibración de distorsión con el tablero de ajedrez]`.

**5. Réplicas.** `[REQUIERE MEDIDA: 3 repeticiones de 4–6 combinaciones (T, S)]`. Mientras no existan, sustituye «no significant dependence» por formulaciones descriptivas.

**6. Rotura y fugas.** Resuelve la contradicción entre la §2 (las carreras mayores rompían) y la §5 (no se registró dónde se rompe). Indica las holguras de la pala o márcalas `[REQUIERE MEDIDA]`, y presenta el papel de las fugas como hipótesis si no se cuantifican.

**7. Otros.**
- Publica 2π/κ_f y compáralo con λ̄.
- Da CV_σ ≈ R/√2 para el modelo de dos ondas.
- Usa una regresión con T como factor en lugar de las correlaciones sueltas.
- Da una incertidumbre de f₁ que incluya la deriva y reduce las cifras de la Tabla 2.
- Añade una tabla suplementaria por ensayo (t_a, t_s, t_e, L, a_I, R, E_res, H_lin, λ_lin, λ_S3, κ_f, η_c/H̄).
- Añade la disponibilidad de código y datos, las afiliaciones, palabras clave y declaraciones.
- Usa «stroke S» de forma coherente.
- Corrige «does not change between S = 40 and 45 mm».
- Pasa la Fig. 7 al suplemento.
- Suaviza la frase de novedad.

Entrega: el manuscrito corregido, un diff y una tabla «comentario del árbitro → cambio → ubicación».
