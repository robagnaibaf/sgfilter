function [V,T] = read_mesh(s)
% READ_MESH     Read mesh from an OBJ file
%
% [V,T] = READ_MESH(s) returns the V matrix of vertex coordinates, and
%   T matrix of the triangle index triplets of a mesh contained in an OBJ
%   file named s. The file should be of the following form:
%   
%   v x1 y1 z1
%   ...
%   v xn yn zn
%
%   f i1 j1 k1
%   ...
%   f im jm km
%
% The lines starting with other than 'v' or 't' are ignored. 

[fid,msg]=fopen(s, 'r');

if fid<0
    error(msg);
end

% Default row number of the vertex matrix
VN=5000;
% Default row number of the triangle matrix
TN=10000;

% If the number of rows of matrices are not enough, the number of rows 
% will be duplicated. 

V=zeros(VN,3);
T=zeros(TN,3);
vi=0;
ti=0;

while ~feof(fid)
    v=fscanf(fid,'v %f %f %f');

    if ~isempty(v)
        vi=vi+1;
        if vi>VN
            % Expand V
            VN = VN * 2;
            V=[V; zeros(VN,3)];
        end
        V(vi,:)=v';
    end

    t=fscanf(fid,'f %d %d %d');
    if ~isempty(t)
        ti=ti+1;
        if ti>TN
            % Expand T
            TN = TN * 2;
            T=[T; zeros(TN,3)];
        end
        T(ti,:)=t';
    end

    fgetl(fid);
end
fclose(fid);
T=T(1:ti,:);
V=V(1:vi,:);
end