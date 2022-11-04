function W=sgfilter(V,T,k,d,N)
    % SGFILTER     Mesh smoothing with Savitzky-Golay filter
    %
    % SGFILTER(V,T) returns the smoothed vertex coordinates of the 
    % (V,T) mesh.
    %
    % V: vertex coordinates in an n-by-3 array of doubles.
    % T: triangle index tuples in an m-by-3 array of integers.
    %
    % W=SGFILTER(V,T,k,d,N); 
    %
    % k: sampling from k-neighborhood of the vertices.
    % d: local fitting to the k-neighborhoods of a 2D polynomial
    %    of degree d in the following form:
    %
    %       p(x,y) =    sum     a(i,j) * x^i * y^j 
    %                 i+j <= d
    %    where a(i,j) coefficients are 3D vectors (i.e. p : R^2 -> R^3). 
    %    The possible values of d are 1,2 or 3. 
    % N: number of iterations of the smoothing. 
    %
    % SGFILTER(V,T) is the same as SGFILTER(V,T,1,1,1). 
    %
    % (C) Gabor Fabian, Eotvos Lorand University, 2022.
    %
    % References: Gabor Fabian, Generalized Savitzky-Golay filter for smoothing
    % triangular meshes, In: ?, 2022. 
    %
    
    if ~exist('k','var')
        k=1;
    end
    if ~exist('d','var')
        d=1;
    end
    if ~exist('N','var')
        N=1;
    end
    
    % Get number of vertices
    n=size(V,1);

    % Generate neighborhoods
    [~,TS,BL,VI]=neighborhoods(V,T,k);

    % Generate embeddings of the neighborhoods
    U=embeddings(TS,BL);
    
    % Apply filter to the points
    W=zeros(size(V));
    VV=V;    
    for k=1:N
        for i=1:n
            W(i,:)=filter_point(U{i},VV(VI{i},:),d);            
        end
        VV=W;
    end
end