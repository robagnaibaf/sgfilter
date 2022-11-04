function U=embeddings(TS,BL)
% EMBEDDINGS    Calculate the embeddings for each k-neighborhood of a mesh.
%
% U: cell array, U{i} contains the embedded vertex coordinates of the
%    k-neighborhood with triangulation TS{i} and boundary length BL(i). 
%    For all i index embedding(TS{i},BL(i)) method is called.
%
%    See also <a href="matlab:help embedding">embedding</a>.
%    

    n=length(BL);
    U=cell(n,1);
    for i=1:n
        U{i}=embedding(TS{i},BL(i));
    end
end