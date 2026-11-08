# MonoSpectro V4 — texto corregido para pegar en el .tex (3 nov 2026)

Citas como [n] = numeración del PDF V4. Ecuaciones, Tabla I y Fig. 1–2: sin cambios salvo lo indicado. Reconstruido desde el PDF (sin fuente LaTeX).

## Abstract

We present SpecToGo, an open-source, portable absorbance spectrophotometer for the visible range, built from a monochrome global-shutter camera with a 1000 lines/mm diffraction grating mounted directly on its lens. The components, including a single-board computer, cost about €166. Uncorrected, its readings reproduce the positions and shapes of the bands recorded by a commercial laboratory spectrophotometer, but on a strongly compressed absorbance scale. A correction with three coefficients, a gain that varies linearly with wavelength and a term quadratic in absorbance, fitted to nine food-dye solutions, maps the readings onto the reference scale. On three synthetic organic dyes not used in the fit, it lowers the root-mean-square error against the reference from 0.32 to 0.07 absorbance units over 420 nm to 780 nm and raises the pooled coefficient of determination ($R^2$) from 0.17 to 0.96; above an absorbance of 0.5, the corrected readings remain about 10 % low. A low-cost camera-based instrument can thus be brought close to a laboratory reference with a simple correction, which makes SpecToGo a promising basis for field measurements. Hardware designs, firmware, data and analysis code are openly available.

## I. Introduction

Absorbance spectrophotometry is a routine measurement in chemistry, biology and environmental monitoring, but laboratory instruments are costly, bulky and mains-powered, which rules them out for field work and for unattended deployments such as FerryBoxes and moored buoys [1]. Many low-cost and open-source photometers have been built in response, from open-source spectrophotometers [2] and 3D-printed smartphone spectrophotometers [3] to portable colorimetric sensors tested on spiked food samples [4].

Less often shown is that the readings of such an instrument agree quantitatively with those of a commercial one on samples not used to calibrate it. Many validations fit and evaluate on the same solutions [3], [5], which shows how well a model reproduces its calibration data but not whether it holds for new chemistry, and the latter is what matters when readings from different instruments and sites are pooled [6]. In analytical chemistry, making the readings of different instruments comparable is known as calibration transfer, a problem studied for decades in spectroscopy [7]. Direct and piecewise standardization map the spectra of one instrument onto those of another [8], and slope-and-bias corrections do so with far fewer degrees of freedom [9], but all are normally fitted on tens of transfer standards.

Here we describe SpecToGo, a low-cost, portable, camera-based absorbance spectrophotometer, and compare it with a commercial reference instrument. Its readings differ from the reference mainly through a compression of the absorbance scale, which three coefficients largely correct. Unlike a slope-and-bias correction [9], or the expansions with dozens of coefficients used for the camera-based platforms in [10], the form of this correction is motivated by how the camera records light (Section III), and it is tested on dyes that were not used to fit it.

## II. The Instrument

SpecToGo is built to be cheap, compact and easy to reproduce: every part is off the shelf or 3D printed (Table I). Light from a 10 W halogen lamp (Osram Halostar 64415 S) passes through a 10 mm plastic cuvette and a 0.5 mm entrance slit. The slit sits 60 mm from the lens with no collimator, which keeps the optical path short, and the light is dispersed by a 1000 lines/mm transmission diffraction grating (Edmund Optics #40-267) bonded to the front of the camera’s stock wide-angle M12 lens (Fig. 1). The detector is an Arducam OV9281 camera with a 1-Mpixel monochrome global-shutter sensor. It has no Bayer filter, so every pixel is an unfiltered intensity reading with no color interpolation, and no infrared-cut filter. The camera is tilted by 36°, the dispersion angle specified by the grating manufacturer: the first-order direction for 589 nm at normal incidence ($\sin\theta_1 = \lambda/d$, with $d$ the grating period), which centers the visible band on the sensor. A Raspberry Pi 4 single-board computer controls acquisition, and the whole instrument sits in an opaque 3D-printed enclosure (Fig. 2).

The sensor is read at 1280 × 720 through the processed 8-bit output of the camera pipeline, with exposure and analog gain fixed manually (automatic exposure and gain disabled) and no dark-frame subtraction. The exposure is set so that the brightest part of the blank approaches saturation without reaching it. Each column of a user-defined region of interest is averaged vertically, giving one intensity value per pixel column, about 1.4 nm apart. Pixel position is mapped to wavelength by a quadratic polynomial fitted to the emission peaks of a fluorescent lamp [11], and absorbance is computed against a stored blank as

$$A = \log_{10}(I_0/I), \quad (1)$$

where $I_0$ is the blank intensity and $I$ the sample intensity at the same wavelength. All reference measurements were made on a K LAB Optizen Alpha double-beam UV-Vis spectrophotometer (K LAB, Daejeon, Republic of Korea; wavelength range 190 nm to 1100 nm).

In the field, the Raspberry Pi runs its own Wi-Fi access point and web interface, so blank and sample can be acquired, and spectra viewed, from a phone or laptop without a cable. Three tests, made in a later session with the instrument realigned, characterize the instrument itself (Table I): the emission lines of a mercury lamp between 405 and 578 nm, for the wavelength axis and resolution; a 30 min water blank, for lamp drift; and, for repeatability, five readings of one preparation of each of three food colorings (lime, red and grape), with the cuvette reinserted between readings and absorbance taken as the mean within 5 nm of the band maximum (one reading, saved under the wrong label, was excluded). Most of the drift occurs within 10 min of switching on, so a warm-up longer than the 5 min used for the calibration and validation measurements is advisable. Water measured against a water blank after reinserting the cuvette reads 0.000 ± 0.002. Three independent preparations give 1.3 and 2.7 % for two colorings and 6.6 % for the third, where the size of a single drop dominates. These figures describe the realigned instrument; the coefficients of Eq. (2) were fitted before realignment.

## III. Correction to the Reference Scale

Because Eq. (1) is the ratio of two intensities recorded by the same pixel, the spectral response of the sensor and the transmission of the optics cancel and leave the absorbance scale unchanged. What changes it is anything that makes the recorded signal depart from proportionality to intensity. A power-law tone curve in the processed camera output divides every absorbance by the same factor [12]. Stray light and the finite bandwidth compress high absorbances further and vary with wavelength [13], [14], as does a dark signal that is not subtracted. SpecToGo therefore reads lower absorbances than the reference. We correct its readings with

$$A_\mathrm{ref}(\lambda) = g(\lambda)\,A_\mathrm{dev}(\lambda) + h\,A_\mathrm{dev}^2(\lambda),\qquad g(\lambda) = g_0 + g_1\,\frac{\lambda - 600\ \mathrm{nm}}{180\ \mathrm{nm}} \quad (2)$$

Eq. (2) represents these effects with three coefficients. The first term multiplies SpecToGo’s reading by a gain $g(\lambda)$ that changes linearly with wavelength: $g_0$ is the gain at 600 nm, the center of the working range, and $g_1$ is its change from there to either end of the range, 420 or 780 nm. The second term, $h A_\mathrm{dev}^2$, raises the gain as absorbance grows. The three coefficients are fitted by least squares over every wavelength of the nine calibration samples at once, giving $g_0 = 2.32$, $g_1 = -1.36$ and $h = 1.94$. Fig. 3a compares $g(\lambda)$ with the gain of the per-wavelength fit in Table II, which is noisy and swings from about 8 in the blue to slightly below zero above 700 nm; the straight line keeps only its trend.

Fig. 3b shows the fit; each point is one calibration sample at one wavelength. If SpecToGo agreed with the reference, the points would fall on the dotted diagonal. They lie well above it, increasingly so as absorbance grows: the reference reads 2.1 times SpecToGo’s value for reference absorbances below 0.5 and 4.9 times above 2. No single gain can follow this growth, hence the quadratic term. The curves show Eq. (2) at each wavelength.

The model has no offset. Away from the bands, SpecToGo reads slightly negative before any correction, by 0.06 to 0.09 above 650 nm for two of the validation dyes (Section IV), rhodamine B and Congo red, by an amount that changes from sample to sample and that neither lamp drift nor cuvette repositioning explains (Section II). A plausible cause, not tested here, is fluorescence: the sample is illuminated with white light and the light is dispersed only after the cuvette, so any emission from the sample adds to $I$; rhodamine B is strongly fluorescent and Congo red weakly so. We set negative outputs to zero, which removes only the visible part of this artifact. The wavelength range, the window of a second-order Savitzky–Golay filter [15] applied to SpecToGo’s spectra only, and the use of clipping were chosen by leave-one-out cross-validation within the calibration set, which selected 420 nm to 780 nm, a 25 nm window and clipping for every model.

The quadratic term was added after the validation dyes had been scored with the linear term alone, although Fig. 3b motivates it on the calibration data. For comparison, Table II also lists simpler and more flexible corrections: a scalar gain, the slope-and-bias correction [9], Eq. (2) without its quadratic term, low-degree cases of the expansions in [10], and an independent gain and offset at each of the 361 wavelengths, as in direct standardization [8].

## IV. Experimental Protocol

The calibration set comprised nine aqueous solutions, each made by diluting one drop of a concentrated liquid food coloring in 10 mL of distilled water. The colorings came from a commercial twelve-color set (6 mL bottles; Amazon ASIN B08X6FMHKP). Together they spread absorbance across the visible band, and dye solutions of this kind are commonly used to characterize low-cost photometers [5]. The manufacturer discloses neither the identity nor the concentration of the colorants, so we refer to them by their commercial color names and publish their reference spectra with the data.

The validation set comprised three synthetic organic dyes, Congo red, methylene blue and rhodamine B, each dissolved in distilled water in a 100 mL volumetric flask and measured with the same optical configuration and procedure as the calibration set. Because both instruments measure the same solution, the comparison does not depend on its nominal concentration.

Each reported spectrum is the mean of ten consecutive readings of a single preparation, taken in a laboratory at 27 °C and 22 % relative humidity after a 5 min warm-up of the light source on both instruments. Plastic cuvettes were used on both, and each solution was measured on the reference within 10 s of its measurement on SpecToGo. The reference instrument is double-beam and tracks its blank continuously, whereas on SpecToGo the same distilled-water blank, in the same cuvette, was remeasured between samples. Agreement is quantified on the three validation dyes by the root-mean-square error (RMSE) against the unsmoothed reference spectrum, on a common 1 nm grid over 420 nm to 780 nm and averaged over the dyes, and by the coefficient of determination $R^2$ pooled over all their points.

## V. Results and Discussion

Table II and Fig. 4 summarize the validation. Without correction, SpecToGo already reproduces the positions and shapes of the bands: their maxima lie −6, −2 and −13 nm from the reference for methylene blue, rhodamine B and Congo red, respectively, and −5, 0 and −9 nm after correction. What differs is the height. Uncorrected, the maxima read 0.24, 0.44 and 0.31, against 0.51, 1.58 and 1.15 on the reference, and the median ratio $A_\mathrm{ref}/A_\mathrm{dev}$ is 2.3 for reference absorbances below 0.5 and 3.9 from 0.5 to 1.6, so the compression grows with absorbance. Eq. (2) reduces the mean RMSE from 0.315 to 0.072 and raises the pooled $R^2$ from 0.17 to 0.96.

On the validation dyes, Eq. (2) gives the lowest error and the highest $R^2$ of all corrections; every correction with more coefficients does worse, and the per-wavelength fit does worst of all (RMSE 0.182, $R^2$ 0.76).

The quadratic term follows only part of the growth of the compression. The median relative error of the corrected readings is 4 % for reference absorbances below 0.5, and 12 % and 9 % low from 0.5 to 1 and from 1 to 1.6, so the bands of rhodamine B and Congo red remain 6 to 9 % low at their maxima. The compression at low absorbance is consistent with the tone curve, and its growth with stray light, against which the enclosure has neither baffles nor an order-sorting filter [13]. The shifts of the band maxima combine errors of the wavelength axis with the band distortion caused by the finite bandwidth. Aligning the corrected maxima with the reference lowers the mean RMSE only from 0.072 to 0.065, so most of the remaining error lies in the band amplitudes rather than in their positions. Without an order-sorting filter, second-order light from 380–390 nm also reaches the first order near 760–780 nm, and above 700 nm the grating operates outside its specified range. The most direct improvements are therefore to read the raw 10-bit sensor output with dark-frame subtraction, to add baffles and an order-sorting filter, and to use a source with more blue output.

## VI. Conclusion

SpecToGo reproduces the band positions and shapes recorded by a commercial benchtop spectrophotometer at a fraction of its cost. A three-coefficient correction, fitted on nine calibration samples, brings its absorbance readings onto the reference scale: on three dyes not used in the fit, the mean RMSE falls to 0.07 and the pooled $R^2$ reaches 0.96. Its main limitations are the processed 8-bit acquisition and stray light. Its low cost, simplicity and portability make SpecToGo a promising basis for field instruments.

## Data and Code Availability

The 3D enclosure designs, the instrument firmware, the spectra recorded on both instruments and the analysis code of this letter are available at https://gitlab.com/fablab-ulb/projects/cuban-water-lab/monospectro. Designs, firmware and code are released under the MIT License.

## Fig. 3 caption

(a) Gain $g(\lambda)$ of Eq. (2) fitted to the calibration set (solid) and gain of the per-wavelength fit of Table II (dashed). (b) Reference against SpecToGo absorbance for the nine calibration samples at four wavelengths, with Eq. (2) at each wavelength (curves) and the identity line (dotted).

## Fig. 4 caption

The three validation dyes as measured by SpecToGo, uncorrected (orange solid line) and corrected with Eq. (2) (blue solid line), and as recorded by the reference instrument (gray dashed line). Each panel gives the RMSE before and after correction. Bottom right, the three solutions, from left to right methylene blue, rhodamine B and Congo red.

## Table II note

$N_c$, number of fitted coefficients. Linear term only: Eq. (2) with $h = 0$.

## References [1] and [6]

[1] S. Pärt, H. Kankaanpää, J.-V. Björkqvist, and R. Uiboupin, “Oil spill detection using fluorometric sensors: Laboratory validation and implementation to a FerryBox and a moored SmartBuoy,” Frontiers in Marine Science, vol. 8, Art. no. 778136, 2021.

[6] R. R. Downs, H. K. Ramapriyan, G. Peng, and Y. Wei, “Perspectives on citizen science data quality,” Frontiers in Climate, vol. 3, Art. no. 615032, 2021.
