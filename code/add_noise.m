function W=add_noise(V,amount)
    % ADD_NOISE     Add uniform noise to a set of vertices. 
    %
    % W = ADD_NOISE(V,strength) returns noisy vertex coordinates.
    %   The returned W matrix contains the original coordinates
    %   of V corrupted by an additive uniform random noise:
    %
    %   W(i,:) = V(i,:) + r(i);
    %   
    %   For the r(i) random vector: norm(r(i)) < amount * diam(V), where
    %   diam(V) denotes the diameter of set V (the length of the body
    %   diagonal of the bounding box). 
    %

    d=norm(max(V)-min(V));
    R=(2*rand(size(V))-1);
    R=R./sqrt(sum(R.^2,2));
    P=rand(size(V,1),1)*amount*d;
    W=V+P.*R;
end