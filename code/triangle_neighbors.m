function N=triangle_neighbors(V,T,k)
% TRIANGLE_NEIGHBORS    Determine the triangles of the k-neighborhood 
%                       for all vertices of a mesh. 
%
% V:  vertex coordinates in an n-by-3 array of doubles.
% T:  triangle index tuples in an m-by-3 array of integers.    
% k:  size of the neighborhood. 
% 
% N:  cell array, N{i} contains the indices of the triangles in the
%     k-neighborhood of the i-th vertex. This neighborhood is not
%     necessarily disk-like. To remove degeneracies, see <a href="matlab:help reindex_disk">reindex_disk</a>.
%

    if ~exist('k','var')
        k=1;
    end    
    n=size(V,1);
    N=cell(n,1);
    for i=1:size(V,1)
        N{i}=one_ring(T,i);
        for l=1:k-1
            verts=T(N{i},:);
            verts=unique(verts(:));
            tris=[];
            for j=1:length(verts)
                tris=[tris; one_ring(T,verts(j))];
            end
            N{i}=unique(tris(:));
        end
    end
end
