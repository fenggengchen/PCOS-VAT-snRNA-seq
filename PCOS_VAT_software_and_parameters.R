# Python and R packages and key parameters used in the PCOS VAT snRNA-seq study
#
# This file contains only package versions and key parameters reported in the
# revised manuscript. It is a parameter reference rather than an executable

# =============================================================================
# Quality control and global analysis
# =============================================================================

# Scrublet v0.2.3 (Python)
# expected_doublet_rate = 0.06
# min_counts = 2
# min_cells = 3
# min_gene_variability_pctl = 85
# n_prin_comps = 30
# Doublet-detection threshold = automatic

# Seurat v4.4.0 (R)
# Nucleus-level QC:
#   nFeature_RNA > 200
#   nFeature_RNA < 5,000
#   nCount_RNA < 15,000
#   percent.mt < 20
# SCTransform regressors:
#   S.Score, G2M.Score, mitochondrial transcript percentage and
#   ribosomal transcript percentage
# Reference-based SCT integration:
#   SelectIntegrationFeatures nfeatures = 3,000
#   FindIntegrationAnchors normalization.method = "SCT"
#   reference = three normal-weight control samples
# PCA and major-cell clustering:
#   PCA features = 5,000
#   npcs = 50
#   dimensions used for SNN and UMAP = 1:40 Harmony dimensions
#   clustering algorithm = Louvain
#   FindClusters resolution = 0.1
# Marker identification with FindAllMarkers:
#   test.use = "wilcox"
#   only.pos = TRUE
#   min.pct = 0.1
#   logfc.threshold = 0.25

# Harmony v1.2.3 (R)
# reduction.use = "pca"
# group.by.vars = "orig.ident"
# Global analysis:
#   input PCA components = 1:50
#   Harmony dimensions used for SNN and UMAP = 1:40
# ASPC and adipocyte subclustering:
#   input PCA components = 1:50
#   Harmony dimensions used for SNN and UMAP = 1:20
# Unlisted arguments = package defaults

# LISI v1.0 (R)
# Input = Harmony dimensions 1:40
# perplexity = 30
# iLISI label = orig.ident (19 donor/sample identities)
# cLISI label = ten major cell-type annotations

# =============================================================================
# ASPC and adipocyte subclustering
# =============================================================================

# Seurat v4.4.0 and Harmony v1.2.3 (R)
# ASPCs:
#   SCTransform variable.features.n = 3,000
#   vars.to.regress = S.Score, G2M.Score, mitochondrial transcript percentage,
#                     ribosomal transcript percentage
#   RunPCA npcs = 50
#   Harmony group.by.vars = "orig.ident"
#   dimensions used for FindNeighbors and RunUMAP = 1:20 Harmony dimensions
#   FindClusters algorithm = Louvain
#   FindClusters resolution = 0.2
# Adipocytes:
#   SCTransform variable.features.n = 2,000
#   vars.to.regress = S.Score, G2M.Score, mitochondrial transcript percentage,
#                     ribosomal transcript percentage
#   RunPCA npcs = 50
#   Harmony group.by.vars = "orig.ident"
#   dimensions used for FindNeighbors and RunUMAP = 1:20 Harmony dimensions
#   FindClusters algorithm = Louvain
#   FindClusters resolution = 0.13

# =============================================================================
# Gene co-expression network analysis
# =============================================================================

# hdWGCNA v0.4.01 and WGCNA v1.73 (R)
# Gene selection = genes detected in at least 5% of ASPCs
# Metacell grouping = cell type and donor
# Metacell reduction = PCA
# k = 25
# max_shared = 10
# expression input = normalized RNA expression
# networkType = "signed"
# soft_power = 7
# hub-gene ranking = module-specific kME
# genes used for ASPC-M6 PPI visualization = top 20 by kME
# genes labelled in the module-network visualization = top five by kME
# Module-preservation donor split = 10 reference donors and 9 query donors
# Module-preservation permutations = 500
# Unlisted arguments = package defaults

# =============================================================================
# Enrichment and gene-set scoring
# =============================================================================

# clusterProfiler v4.12.6 (R)
# Multiple-testing method = Benjamini-Hochberg
# Correction scope = terms or pathways tested within each enrichment analysis

# AUCell v1.26.0 (R)
# AUCell_buildRankings input = normalized RNA expression
# AUCell_calcAUC input = predefined gene sets and within-cell gene rankings
# Unlisted arguments = package defaults

# =============================================================================
# GWAS integration
# =============================================================================

# scDRS v1.0.2 (Python)
# Disease-score gene set size = 1,000 genes
# Cell-level association P values = empirical P values calculated from matched
# control gene sets and cells
# Unlisted arguments = package defaults

# =============================================================================
# Trajectory inference and perturbation analysis
# =============================================================================

# Monocle3 v1.2.7 (R)
# Input = normalized Seurat RNA-assay expression
# preprocess_cds num_dim = 50
# preprocess_cds norm_method = "none"
# Reduced coordinates = UMAP transferred from the corresponding Seurat object
# cluster_cells reduction_method = "UMAP"
# clustering algorithm = Louvain
# learn_graph arguments = package defaults
# order_cells root = principal-graph node containing the greatest number of ASCs

# CellOracle v0.20.0 (Python)
# Input = raw-count data, ASPC annotations and corresponding UMAP coordinates
# prior GRN = CellOracle human promoter base GRN
# PCA explained-variance change threshold = 0.002
# maximum PCA components = 20
# KNN k = 2.5% of analyzed cells
# balanced = True
# b_sight = 8 * k
# b_maxl = 4 * k
# n_jobs = 8
# GRN unit = annotated cell state
# ridge-regression alpha = 10
# predictive-model refitting alpha = 10
# n_propagation = 3
# transition-probability neighbors = 200
# knn_random = True
# sampled_fraction = 1
# sigma_corr = 0.05
# vector-field grid = 40 x 40
# vector-field smooth = 0.8
# vector-field neighbors = 200
# vector-field minimum mass threshold = 7.4
# pseudotime-gradient fit = third-order polynomial

# Slingshot v2.12.0 (R)
# Input = annotated cell-state labels and UMAP coordinates
# Lineage inference = minimum spanning tree and simultaneous principal curves
# Unlisted arguments = package defaults

# CytoTRACE v0.3.3 (R)
# Parameters = package defaults

# =============================================================================
# Correlation and transcription-factor analyses
# =============================================================================

# psych v2.4.12 (R)
# corr.test method = "spearman"
# corr.test adjust = "BH"

# pheatmap v1.0.12 (R)
# Used to visualize the correlation matrices

# DoRothEA v1.16.3 and VIPER v1.38.0 (R)
# Parameters = package defaults

# ScRegclust v0.1.9 (R)
# Parameters = package defaults

# biomaRt v2.62.1 (R)
# Used for mouse-to-human orthologue mapping

# =============================================================================
# Cell-cell communication analysis
# =============================================================================

# CellChat v1.6.1 (R)
# Input = normalized RNA-assay expression and cell-state annotations
# database = CellChatDB.human
# PPI reference = PPI.human
# identifyOverExpressedGenes arguments = package defaults
# identifyOverExpressedInteractions arguments = package defaults
# projectData PPI = PPI.human
# computeCommunProb:
#   type = "trimean"
#   nboot = 100
#   seed.use = 1
#   raw.use = FALSE
#   population.size = FALSE
# filterCommunication min.cells = 10
# Pathway-level analysis = computeCommunProbPathway
# Network aggregation = aggregateNet
