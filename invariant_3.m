function  invt3  = invariant_3( Adj, gene_s, RNA_s, methyl_s, CNA_s )


methyl_F=1-methyl_s;


n=size(RNA_s,2);
m=length(gene_s);
invt3=zeros(size(RNA_s));
Adj2=Adj+eye(m,m);
for i=1:n
    R_sum=zeros(m,1);
    R=repmat(RNA_s(:,i),1,m);
    R_sum=sum(R.*Adj)';
    
   
    
    C_sum=zeros(m,1);
    C=repmat(CNA_s(:,i),1,m);
    C_sum=sum(C.*Adj)';
   
    
    
    M_sum=zeros(m,1);
    M=repmat(methyl_F(:,i),1,m);
    M_sum=sum(M.*Adj)';

    
    M_C=M.*C;
    M_C_sum=sum(M_C.*Adj2)';
    n_Adj2=sum(Adj2)';
    eps=M_C_sum./n_Adj2;
    
    W_ge=RNA_s(:,i).*R_sum;
    W_me=methyl_F(:,i).* M_sum;
    W_cn= CNA_s(:,i).* C_sum;
 
    invt3(:,i)=eps.*W_ge.*(W_me + W_cn);
    
end



end

