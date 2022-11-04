function [VS,TS,i0,VI]=detach_neighborhoods(V,T,N)
% DETACH_NEIGHBORHOODS    Detach k-neighborhoods of vertices of a (V,T)
%     mesh into independent meshes. 
%
% V:  vertex coordinates in an n-by-3 array of doubles.
% T:  triangle index tuples in an m-by-3 array of integers.
% N:  cell array, N{i} contains the triangle indices of the k-neighborhood
%     of the i-th vertex. 
% 
% VS: cell array, VS{i} contains the reindexed vertices of the i-th
%     k-neighborhood.
% TS: cell array, TS{i} contains the reindexed triangle indices of 
%     the i-th k-neighborhood.
% i0: vector, i0(i) is the index of the central vertex of the i-th 
%     neighborhood BEFORE reindexing. 
% VI: cell array, VI{i} contains the original vertex indices.
%
n=size(V,1);

VS=cell(n,1);
TS=cell(n,1);
i0=zeros(n,1);
VI=cell(n,1);

for i=1:n
    tris=T(N{i},:);       
    verts=sort(unique(tris(:)));
    i0(i)=find(verts==i);
    for j=1:length(verts)
        tris(tris==verts(j))=j;
    end    
    TS{i}=tris;
    VS{i}=V(verts,:);
    VI{i}=verts;
end

end