
% Adj= Adjacency matrix from HPRD
% gene_onco= list of genes in commmon w/ HPRD and OncoKB
% RNA= mRNA expression
% methyl= DNA methylation
% CNA= DNA copy number alteration
% Node_weights=invariants (rows) for l samples (columns)



clear all

tic

load('./Data/omics_data')




invt = invariant_3(Adj, gene_onco, RNA, methyl, CNA);

Node_weights=invt;


distanceM = EMD_cvxOpt(Adj,Node_weights);



toc

%save('./Data/distance_matrix', 'distanceM')



