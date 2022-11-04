function r=one_ring(T,ind)
% ONE_RING      Get the 1-neighbors of a vertex of a mesh
% 
% r = ONE_RING(T,ind) determines the indices of the vertices directly
% adjacent to ind-th vertex in a mesh defined by T. 
%

    r=find(T(:,1)==ind | T(:,2)==ind | T(:,3) == ind);
end