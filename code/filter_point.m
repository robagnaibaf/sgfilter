function v0=filter_point(U,V,d)
% FILTER_POINT     Filter a single point of a mesh using the generalized
%                  Savitzky--Golay filter.  
%
% v0 = FILTER_POINT(U, VI, d);
% 
% U:   vertices of a k-neighborhood embedded into the plane.
% V:  the original 3D positions of vertices of a k-neighborhood. 
% d:   degree of the polynomial to be fitted.
%
% v0:  the smoothed vertex coordinate for V(1,:), the central vertex 
%      of the k-neighborhood. 
%

    eqnum=size(V,1);    
    varnum=((d+1)*(d+2))/2;
    
    if eqnum<=varnum
        v0=V(1,:);
    else
        C=fit_poly_surf(U,V,d);
        v0=C(1,:);
    end        
end