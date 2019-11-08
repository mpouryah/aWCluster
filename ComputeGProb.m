
function Node_Prob = ComputeGProb(Adj,Node_weights)

l=size(Node_weights,2);
[n,~] = size(Adj);

I=ones(l,1);

S=sum(Node_weights);
%S_copy=I*S;
S_copy=repmat(S,n,1);


Node_Prob = Node_weights./S_copy;



