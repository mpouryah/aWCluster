
function Node_Prob = ComputeGProb(Adj,Node_weights)

l=size(Node_weights,2);
[n,~] = size(Adj);

I=ones(l,1);

S=sum(Node_weights);
%S_copy=I*S;
S_copy=repmat(S,n,1);


Node_Prob = Node_weights./S_copy;



% Node_Prob = zeros(size(Node_weights));
% 
% 
% for k= 1:l
% for i = 1:n
%     indj = find(Adj(i,:) ~= 0);
%     d_x = sum(Node_weights(indj));
%     
%     if d_x > 0    
%         Node_Prob(i,k) = Node_weights(i,k)/d_x;
%     end
% end
% end