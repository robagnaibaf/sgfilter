function A=adjacencies(T)
% ADJACENCIES    Calculating adjacency matrix
%
% A=ADJACENCIES(T) calculates the adjacency matrix of the triangulation
%   of a mesh. A(i,j)>0 if i and j are adjacent vertices of the mesh along
%   the directed edge (i,j). If there are multiple directed edges between 
%   i and j then A(i,j)>1. 
%

n=max(T(:));
A=zeros(n);    
for i=1:size(T,1)
    for j=1:3
        i1=T(i,j);
        i2=T(i,mod(j,3)+1);
        A(i1,i2)=A(i1,i2)+1;
    end
end
end