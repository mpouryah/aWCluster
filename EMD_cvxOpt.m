%% First install CVX: http://cvxr.com/cvx/doc/install.html


function distanceM = EMD_cvxOpt(Adj,Node_weights)
% Input:
% Adj= Adjacency matrix 
% Node_weights=invariants (rows) for k samples (columns), 

Node_Prob=ComputeGProb(Adj,Node_weights);  % Normalized probability measure in each connected component

l=size(Node_weights,2);

n=length(Adj);
m=sum(sum(Adj))/2;
D=zeros(n,m); %D=Divergence matrix
count=1;
for i=1:n-1
    for j=i+1:n
        if Adj(i,j)
            D(i,count)=1;
            D(j,count)=-1;
            count=count+1;
        end
    end
end

%%




Distance_Matrix=zeros(l,l);


% myCluster=parcluster('local'); 
% N=myCluster.NumWorkers; 
% parpool(myCluster,N)

%count2=0;

parfor i=1:l-1
    i
%     fprintf( '# iter %d ', i )
    
% count2=count2+1;
% if mod(counts,10)==0
%        X= 100*(count2/l);
%        fprintf('%d percent of job done.\n', X); 
%     end

Distance_matrix_row= zeros(1,l);

    for j=i+1:l
    rho0=Node_Prob(:,i);
    rho1=Node_Prob(:,j);
    drho=rho0-rho1;
    drho=drho-mean(drho);
    
    %N=m;
    
%     cvx_begin
% variable up(N)
% variable un(N)
% minimize sum(up+un)
% up>=0;
% un>=0;
% u=up-un;
% drho-D*u==zeros(N,1);
% cvx_end
%  
% 
% distanceM(i,j)=sum(up+un);
%  distanceM(j,i)=distanceM(i,j);
  
Distance_matrix_row(j)=dist_cvx(drho,D,m);


   % distanceM(j,i)=distanceM(i,j);
    
     
    end
     Distance_Matrix(i,:)= Distance_matrix_row;
end
distanceM=Distance_Matrix+Distance_Matrix';

end


