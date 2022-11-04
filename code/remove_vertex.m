function [V,T]=remove_vertex(V,T,ind)
% REMOVE_VERTEX     Remove a vertex of a mesh.
%
% [V,T] = REMOVE_VERTEX(V, T, ind) removes the ind-th vertex of the 
%   (V,T) mesh together with the triangles it is adjacent to. 
%

    R=one_ring(T,ind);
    V=V([1:ind-1,ind+1:end],:);
    I=setdiff(1:size(T,1),R);
    T=T(I,:);
    T(T>ind)=T(T>ind)-1;
end