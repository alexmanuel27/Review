*Comment*

# Comment on Blanco-Jáquez et al. Portable Multispectral Fluorometer with Embedded Machine Learning for Chlorophyll-a Estimation in Acetone-Extracted Samples. *Sensors* 2026, *26*, 4086

Daniela Martinez-Ortiz 1,2, Alex M. Rivera-Rivera 2,3 and Ernesto Altshuler 1,*

1 Center for Complex Systems, Physics Faculty, University of Havana, 10400 Havana, Cuba
2 Faculté des Sciences, Université Libre de Bruxelles (ULB), 1050 Brussels, Belgium
3 Innovation Laboratory, Technological University of Havana José Antonio Echeverría (CUJAE), 19390 Havana, Cuba
\* Correspondence: [REQUIERE AL AUTOR: e-mail of the corresponding author]

## Abstract

Blanco-Jáquez et al. described a portable fluorometer that estimates chlorophyll-a (Chl-a) in 90% acetone extracts from the 24 channels of two multispectral sensors, using a Random Forest model that runs on an ESP32-S3 microcontroller. This Comment raises two points that affect how the reported performance can be interpreted. First, all models in the benchmark used the same 24 channels, so the study compares regression algorithms but not input sets. Besides the channels in the Chl-a emission region, the inputs include channels at or next to the excitation band, broadband and auxiliary outputs, and near-infrared channels. With 76 development samples, the contribution of each group of channels bears directly on the overfitting and hardware-transfer limitations that the authors themselves report. Second, the channel-level data are available only on request. We suggest analyses that require no new measurements, namely reporting the coefficients of the Lasso model already benchmarked and comparing the full input set with reduced, physically motivated channel sets, and we ask that the sample-level data be deposited in a public repository.

**Keywords:** chlorophyll-a; fluorescence; multispectral sensor; machine learning; feature selection; data availability

## 1. Introduction

Blanco-Jáquez et al. [1] combined fluorescence excitation at a nominal 420–425 nm, two multispectral sensors (AS7341 and AS7343), on-device Random Forest inference and a smartphone interface in a portable instrument for Chl-a in acetone extracts. On 15 independent samples, the model reached R² = 0.979 and RMSE = 35.41 µg/L, and its predictions agreed closely with those of the original Python model (R² = 0.997). Integrating optical acquisition and embedded inference in a single portable device is a useful contribution to portable analytical instrumentation.

This Comment addresses two related questions: how much of this performance depends on the full set of 24 spectral inputs, and which data readers need to answer that question. Both can be addressed with data that the authors already hold.

## 2. What the Benchmark Compares

In Section 2.6 of [1], the 24 spectral features were used as predictors for all five regression models, and the final embedded model retained all 24 channels "rather than introducing an additional custom feature-screening step". Table 3 of [1] therefore compares algorithms under a fixed input set. It does not show whether all 24 inputs are needed, or which of them the model relies on.

This matters because the inputs measure different things (Table 1 of [1]). Four channels, with nominal centers between 630 and 690 nm, lie in or next to the red region in which Chl-a fluoresces. Three channels have nominal centers between 405 and 425 nm, at or next to the nominal excitation band, where scattered excitation light can still reach the detectors in a 90° geometry. Three outputs are broadband or auxiliary (Clear, VIS and the flicker-detection channel FD), two are near-infrared channels at 855 and 910 nm, and several visible bands overlap (515 nm on both sensors; 550–555 nm on three channels). The authors note that the development set has a sample-to-feature ratio of about 3.2 (Section 4.5 of [1]). With so few samples per input, a flexible model can draw predictive information from any of these channels, including those whose response depends on excitation intensity or scattering rather than on Chl-a emission.

The same question bears on hardware transfer. The model-development data were acquired with an earlier prototype. The authors attribute the positive validation bias of 22.00 µg/L partly to changes in the control of the excitation LEDs in the final hardware, and they propose normalization or excitation-intensity correction as future work (Sections 3.3, 4.3 and 4.5 of [1]). Knowing whether the model relies mainly on emission-region channels or on channels that follow the excitation light would show which kind of correction is needed.

## 3. Analyses That Use the Existing Data

Two analyses would clarify the contribution of the inputs without new measurements. First, the authors already benchmarked a Lasso model, which gave the best internal performance in Table 3 of [1] (R² = 0.994; RMSE = 32.99 µg/L). Because the L1 penalty sets some coefficients exactly to zero [2], reporting the non-zero coefficients would show which channels carry the predictive information; with correlated channels the selected set is not unique, so its stability across cross-validation folds should also be reported. Permutation importance for the final Random Forest would give the corresponding information for the deployed model.

Second, the 24-channel models could be compared with models restricted to physically motivated subsets: (i) the emission-region channels; (ii) a single channel near 680 nm, analogous to the single emission band of standard extractive fluorometry, which uses an emission filter at 680 nm [3]; and (iii) the 24 channels without the excitation-band, broadband and auxiliary outputs. An emission channel divided by an excitation-band channel would also test the internal normalization that the authors propose.

All configurations should be evaluated under the same data partitions, with any channel selection and tuning nested within the cross-validation of the 76 development samples, and with the 15 validation samples used only once, for the final comparison. With 15 validation samples, RMSE differences of a few micrograms per liter may lie within sampling variability, so bootstrap confidence intervals for RMSE, MAE and bias should accompany the point estimates.

We do not presuppose the outcome. If the reduced sets perform as well as the full set, the instrument and its calibration could be simplified; if the full set performs better, the comparison would quantify the advantage of the dual-sensor design. Either result would strengthen the interpretation of [1].

## 4. Access to Sample-Level Data

The Data Availability Statement of [1] states that the data are available on request from the corresponding author. Because the device stores the 24 spectral features of every measurement (Section 2.4 of [1]), these data already exist. Depositing them in a public repository, as MDPI's research data policy encourages, would allow readers to examine the channel responses and to repeat the analyses proposed above. For each sample, the most useful items are the raw and blank-corrected channel values and the replicate readings; the hardware version used (earlier prototype or final device); the reference concentration together with the filtered volume, extract volume and dilution factor used in Equation (2) of [1]; and the Python and ESP32 predictions.

The quantities in Equation (2) are needed for a further reason. The fluorometer measures the extract, whereas the model is trained to predict the Chl-a concentration in the original water sample. The factor that links the two is constant only if the filtered volume and the dilution were the same for all samples; otherwise it varies between samples and cannot be inferred from the spectra. A short statement on how this was handled would help readers interpret the reported errors.

## 5. Concluding Remarks

Blanco-Jáquez et al. [1] showed that multispectral fluorescence acquisition and embedded inference can be combined in a portable instrument for Chl-a in acetone extracts. Three steps would show how much of the reported performance comes from the multispectral design: reporting which channels the model relies on, comparing the full input set with physically motivated subsets, and depositing the sample-level data. The same steps would guide the recalibration and normalization that the authors plan.

**Author Contributions:** [REQUIERE AL AUTOR: CRediT roles of D.M.-O., A.M.R.-R. and E.A.]

**Funding:** [REQUIERE AL AUTOR: funding sources, or "This research received no external funding."]

**Data Availability Statement:** No new data were created or analyzed in this study. [REQUIERE AL AUTOR: replace if the Figure from Version 1 is kept; its data would then need to be deposited.]

**Conflicts of Interest:** [REQUIERE AL AUTOR: declare that the authors develop a separate multispectral prototype (if applicable) and any financial interest; otherwise "The authors declare no conflicts of interest."]

[REQUIERE AL AUTOR: if generative AI tools were used beyond superficial language editing, add the disclosure that MDPI requires in the Acknowledgments.]

## References

1. Blanco-Jáquez, A.D.; Alarcón-Herrera, M.T.; Valenzuela-García, L.I.; Marín-Celestino, A.E.; Villarreal-Rodríguez, S.; Ayala-García, V.M.; Barbosa-Moreno, F.; Martínez-Cruz, D.A. Portable Multispectral Fluorometer with Embedded Machine Learning for Chlorophyll-a Estimation in Acetone-Extracted Samples. *Sensors* **2026**, *26*, 4086. https://doi.org/10.3390/s26134086
2. Tibshirani, R. Regression Shrinkage and Selection via the Lasso. *J. R. Stat. Soc. Ser. B Methodol.* **1996**, *58*, 267–288. https://doi.org/10.1111/j.2517-6161.1996.tb02080.x
3. Welschmeyer, N.A. Fluorometric Analysis of Chlorophyll a in the Presence of Chlorophyll b and Pheopigments. *Limnol. Oceanogr.* **1994**, *39*, 1985–1992. https://doi.org/10.4319/lo.1994.39.8.1985
