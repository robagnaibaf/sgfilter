function U=embedding(T,l)
% EMBEDDING       Tutte-embedding of a topological disk
% 
% EMBEDDING(T,l): straight-line embedding of a triangulation of the 
% topological disk to the plane. Embedding calculated by solving the 
% linear system derived from Tutte's embedding theorem. T is an n-by-3 
% matrix defining the triangulation. The first (n-l) nodes are 
% mapped inside the unit disk, the last l nodes are mapped to the boundary. 
% 

A=adjacencies(T);    
    D=diag(sum(A,2));
    
    Din=D(1:end-l,1:end-l);
    Ain=A(1:end-l,1:end-l);
    Aout=A(1:end-l,end-l+1:end);
    
    t=linspace(0,2*pi,l+1)';
    t(end)=[];    
    Uout=[cos(t),sin(t)];

    U=[(Din-Ain)\(Aout*Uout); Uout];    
end