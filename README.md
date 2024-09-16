# Doctoral Thesis Martin Kuric in Biomedicine

[![License: CC BY 4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This work was conducted at the Department of Musculoskeletal Tissue
Regeneration (Bernhard-Heine-Centre for Locomotive Research), University
of Würzburg from 08.10.2018 to 16.09.2024 under the supervision of
Prof. Dr. rer. nat. Regina Ebert.

## Title

**Development and Semi-Automated Analysis of an *in vitro* Dissemination Model**


## Downloads

[***Dissertation***](https://github.com/markur4/Dissertation/blob/main/THESIS/thesis.pdf) (Licensed under CC BY 4.0)

[***Latex Source Code***](https://github.com/markur4/Dissertation/blob/main/THESIS) (Licensed under GPL 3.0)




## Summary

This thesis integrates biomedical research and data science, focusing on an *in
 vitro* model for studying myeloma cell dissemination and a Python-based tool,
`plotastic`, for semi-automated analysis of multidimensional datasets. Two major
challenges are approached: (1) understanding the steps of myeloma dissemination
and (2) improving data analysis eﬀiciency to address the complexity- and
reproducibility bottlenecks currently present in biomedical research.

In the experimental component, primary human mesenchymal stromal cells (hMSCs)
are co-cultured with INA-6 myeloma cells to study their cell proliferation,
attachment, and detachment. Time-lapse microscopy reveal that predominantly
myeloma daughter cells detach from hMSCs after cell division. Novel separation
techniques were developed to isolate myeloma subpopulations for further
characterization by RNAseq, cell viability, and apoptosis assays. Adhesion and
retention genes are upregulated by MSC adhering INA-6 cells, which correlates
with patient survival. Overall, this work provides insights into myeloma
dissemination mechanisms and identifies genes that potentially counteract
dissemination through adhesion, which could be relevant for the design of new
therapeutics.

To manage the complex data resulting from the *in vitro* model, a Python-based
software named `plotastic` was developed that streamlines analysis and
visualization of multidimensional datasets. `plotastic` is built on the idea
that statistical analyses are performed based on how the data is visualized.
This approach simplifies data analysis and semi-automates it in a standardized
statistical protocol. The thesis becomes a case study as it reflects on the
application of `plotastic` to the *in vitro* model, demonstrating how the
software facilitates rapid adjustments and refinements in data analysis and
presentation. Such eﬀiciency could be crucial for handling semi- big datasets
transparently, which —despite being managable— are complex enough to complicate
analysis and reproducibility.

Together, this thesis illustrates the synergy between experimental methodologies
and new data analysis tools. The *in vitro* model provides a robust platform for
studying myeloma dissemination, while `plotastic` addresses the need for
eﬀicient data analysis. Combined, they provide an approach for handling complex
cell biological experiments and could advance both cancer biology and other
research practices by supporting the exploratory investigation of challenging
phenomena while communicating results transparently.



## Publications

#### Chapter 1: 
[Kuric et al. (2024); *plotastic: Bridging Plotting and Statistics in Python*; **Journal of Open Source Software**](https://joss.theoj.org/papers/10.21105/joss.06304)

#### Chapter 2: 
[Kuric et al. (2024); *Modeling Myeloma Dissemination In Vitro with hMSC-interacting Subpopulations of INA-6 Cells and Their Aggregation/Detachment Dynamics*; **Cancer Research Communications**](https://aacrjournals.org/cancerrescommun/article/4/4/1150/745028/Modeling-Myeloma-Dissemination-In-Vitro-with-hMSC)


## Citation:

You are allowed to use the latex code of this thesis for your own work (GPL
3.0). Please use the citation option on this GitHub page or see
[*CITATION.cff*](https://github.com/markur4/Dissertation/blob/main/CITATION.cff).


