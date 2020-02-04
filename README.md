# aWCluster
aWCluster is a novel network-based integration method of multiomics data as well as a clustering technique founded on the Wasserstein (Earth Mover's) distance from the theory of optimal mass transport as presented in https://www.biorxiv.org/content/10.1101/558700v2.



aWCluster integrates mRNA expression, DNA copy number alteration, and DNA methylation as well as the interaction network connectivity of the gene products. A sample of these data for 100 breast cancer (tcga) patients and 290 genes (intersection of HPRD and OncoKB ) is given in the file "Data".

In this repository:

1. EMD_All_Three finds the pairwise Wasserstein distances between samples. It calls

  invarinat_3: to create the integative measure of (mRNA, CNA and Methylation) for a given sample
  
  EMD_cvxOpt: the main function for calculating the Wasserstein distance (First install CVX: http://cvxr.com/cvx/doc/install.html prior to running this function.)
  
 2.  Hier_clustering build a hierachical clustering of the samples using the Wasserstein distances created in "1" (above).
  
