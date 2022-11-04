function [VS,TS,BL,VI]=neighborhoods(V,T,k)  
% NEIGHBORHOODS     Generate k-neighborhoods for vertices of a mesh
%
% [VS,TS,BL,VI]=neighborhoods(V,T,k)
%
% V: vertex coordinates in an n-by-3 array of doubles.
% T: triangle index tuples in an m-by-3 array of integers.
% k: size of the neighborhood.
%
% VS: cell array, VS{i} contains the reindexed vertices of the i-th
%     k-neighborhood.
% TS: cell array, TS{i} contains the reindexed triangle indices of 
%     the i-th k-neighborhood.
% BL: integer vector, BL(i) is the number of boundary vertices of the 
%     i-th neighborhood. 
% VI: cell array, VI{i} contains the original vertex indices.
%    
n=size(V,1);

N=triangle_neighbors(V,T,k);
[VS,TS,i0,VI]=detach_neighborhoods(V,T,N);

BL=zeros(n,1);
for i=1:length(BL)
    [VS{i},TS{i},BL(i),perm]=reindex_disk(VS{i},TS{i},i0(i));
    VI{i}=VI{i}(perm);
end        

end

