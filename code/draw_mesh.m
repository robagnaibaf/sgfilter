function draw_mesh(V,F,color,edges,linewidth)
% DRAW_MESH     Drawing a mesh with some options
%
% DRAW_MESH(V,T) draws a surface of the mesh defined by [V,T]. 
%
% V:  vertex coordinates in an n-by-3 array of doubles.
% T:  triangle index tuples in an m-by-3 array of integers.
%
% DRAW_MESH(V,T,color,edges,linewidth)
% 
% color: color of the faces.  
% edges: color of the edges.
% linewidth: thickness of edges. 
%

if ~exist('color','var')
    color = [1,1,1]*.8;
end
if ~exist('linewidth','var')
    linewidth = 0.3;
end

if ~exist('edges','var')
    edges = [1,1,1]*.1;
end

t=trisurf(F,V(:,1),V(:,2),V(:,3),'FaceColor',color,'EdgeColor',edges);
t.LineWidth=linewidth;

lighting phong
axis off
grid off
axis equal
camlight
end
