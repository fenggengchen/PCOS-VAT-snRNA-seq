# PCOS-VAT-snRNA-seq

Analysis code and key software parameters for the single-nucleus RNA-seq study of human visceral adipose tissue in polyendocrine metabolic ovarian syndrome (PMOS), formerly known as PCOS.

## Contents

`PCOS_VAT_software_and_parameters.R` contains:
- Seurat v4 code for ASPC and adipocyte subclustering.
- Software versions and key parameters for the analyses described in the manuscript.

## Input

The subclustering code starts from the global Seurat object named `data`, after doublet removal and quality-control filtering.

The object must contain RNA UMI counts and the following metadata:
- `celltype`: major cell-type annotations, including `ASPC` and `Adipocyte`.
- `orig.ident`: donor/sample identifiers.
- `S.Score` and `G2M.Score`: cell-cycle scores.
- `percent.mt` and `percent.ribo`: mitochondrial and ribosomal transcript percentages.

The code assumes that these scores and percentages have already been calculated.

## Running the subclustering code

1. Load your global Seurat object into R as `data`.
2. Open `PCOS_VAT_software_and_parameters.R`.
3. Run the code at the beginning of the file using Seurat v4.4.0 and Harmony v1.2.3.

ASPCs and adipocytes are analyzed separately using SCTransform, PCA, Harmony, graph-based clustering and UMAP.

| Parameter | ASPCs | Adipocytes |
|---|---|---|
| Variable features | 3,000 | 2,000 |
| PCA components | 50 | 50 |
| Harmony grouping variable | orig.ident | orig.ident |
| Harmony dimensions for neighbors and UMAP | 1–20 | 1–20 |
| Louvain clustering resolution | 0.2 | 0.13 |

Both analyses regress out S.Score, G2M.Score, percent.mt and percent.ribo during SCTransform.

## Output

The code produces the `ASPC` and `Adipocyte` Seurat objects with updated clustering results and UMAP embeddings, and displays the corresponding UMAP plots.

Cluster numbers require annotation based on marker-gene expression; they are not automatically assigned biological subpopulation names.

## Data availability

Quality-controlled snRNA-seq data:
https://ngdc.cncb.ac.cn/omix/release/OMIX020890

Sequencing data:
https://ngdc.cncb.ac.cn/gsa-human/browse/HRA016722

If using a counts-only public object, check that the required metadata are present before running the code.

## Scope

The executable code covers ASPC and adipocyte subclustering. The remaining sections of the R file summarize software versions and analytical parameters rather than providing executable workflows for every analysis.
