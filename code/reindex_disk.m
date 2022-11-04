function [VV,TT,BL,perm]=reindex_disk(V,T,i0)
% REINDEX_DISK      Remove degeneracies and reindex vertices of a mesh 
%                   in order to set the boundary vertices to the last 
%                   positions.
%
% [VV, TT, BL, perm] = REINDEX_DISK(V, T, i0);
% 
% V:  vertex coordinates in an n-by-3 array of doubles.
% T:  triangle index tuples in an m-by-3 array of integers.
% i0: vector, i0(i) is the index of the central vertex of the i-th 
%     neighborhood BEFORE reindexing. 
% 
% VV: cell array, VV{i} contains the reindexed vertices of the i-th
%     k-neighborhood.
% TT: cell array, TT{i} contains the reindexed triangle indices of 
%     the i-th k-neighborhood.
% BL: number of boundary vertices, the last BL vertices of VV will be
%     mapped to the unit disk. 
% perm: permutation that rearranges the rows of V to obtain VV, i.e.
%       VV = V(perm,:)
% 
    n=size(V,1);
    A=adjacencies(T);
    D=A-A';
    [I,J]=find(D==1);
    BL=length(I);
    
    if(BL==0)
        error('The neighborhood is a closed surface. Please reduce the size of the neighborhood.');
    end
    L=zeros(BL,1);    
    
    L(1:2)=[I(1),J(1)]';    
    try
        for i=2:BL-1
            L(i+1)=J(I==L(i));
        end
    catch
        % Remove degeneracy
        R=find(sum(abs(D),2)>2);
        
        for j=1:length(R)
            [V,T]=remove_vertex(V,T,R(j));
            
            if i0>R(j)
                i0=i0-1;
            end
        end
        
        [VV,TT,BL,perm]=reindex_disk(V,T,i0);
        return
    end
    
    perm=[i0; setdiff((1:n)',[L;i0]); L];
    TT=T(:,:);
    for j=1:length(perm)
        TT(T==perm(j))=j;
    end
    VV=V(perm,:);
end