clear all
%close all
load('./Data/omics_data')
load('./Data/distance_matrix')
% invt = invariant_3(Adj, gene_onco, RNA_onco, methyl_onco, CNA_onco );
% invt_Prob=ComputeGProb(Adj,invt);


Cases=Cases';

D= linkage(distanceM, 'ward');


%cutoff = median([D(end-2,3) D(end-1,3)])-25;


NumCluster=5;

C = cluster(D,'Maxclust',NumCluster);

 
 figure(1)

leafOrder = optimalleaforder(D, distanceM);
cases_s=Cases(leafOrder);

%C=C(leafOrder);
 S_C=C(leafOrder);

color = D(end-NumCluster+2,3)-eps;
H = dendrogram(D, 0,'ReOrder', leafOrder,'ColorThreshold', color);
set(H,'LineWidth',1.5)
h = gca();




%// Changing the colours
lineColours = cell2mat(get(H,'Color'));
colourList = unique(lineColours, 'rows');

myColours = [0,0,255;
             247,53,99;
             129,43,146;
             253,154,82;
            255,0,255]/255;
     
%// Replace each colour (colour by colour). Start from 2 because the first colour are the "unclustered" black lines             
for colour = 2:size(colourList,1)
    %// Find which lines match this colour
    idx = ismember(lineColours, colourList(colour,:), 'rows');
    %// Replace the colour for those lines
    lineColours(idx, :) = repmat(myColours(colour-1,:),sum(idx),1);
end
%// Apply the new colours to the chart's line objects (line by line)
for line = 1:size(H,1)
    set(H(line), 'Color', lineColours(line,:));
end
 

% M=distanceM(leafOrder, leafOrder);
% imagesc(M)
% colormap('jet')
% colorbar;
% C(C==10)=5;


save('./Data/cluster_onco', 'C', 'cases_s', 'leafOrder')
