function C=fit_poly_surf(U,V,d)
% FIT_POLY_SURF     Fitting a polynomial surface to a k-neighborhood.
%
% U: vertices of a k-neighborhood embedded into the plane.
% V: the original 3D positions of vertices of a k-neighborhood. 
% d: local fitting to the k-neighborhood of a 2D polynomial
%    of degree d in the following form:
%
%       p(x,y) =    sum     a(i,j) * x^i * y^j 
%                 i+j <= d
%    where a(i,j) coefficients are 3D vectors (i.e. p : R^2 -> R^3). 
%    The possible values of d are 1,2 or 3. 
%    
% C: vector containing the a(i,j) coefficients in the following order:
%    d=1:  a00, a10, a01
%    d=2:  a00, a10, a01, a11, a20, a02
%    d=3:  a00, a10, a01, a11, a20, a02, a21, a12, a30, a03
%
    n=size(U,1);
    u=U(:,1)-U(1,1);
    v=U(:,2)-U(1,2);
    
    m1=[ones(n,1),u,v];
    m2=[u.*v,u.^2,v.^2];
    m3=[u.^2.*v,u.*v.^2,u.^3,v.^3];
    
    if d==1
        M=m1;
    elseif d==2    
        M=[m1,m2];
    elseif d==3
        M=[m1,m2,m3];
    end

    C=pinv(M)*V;
end