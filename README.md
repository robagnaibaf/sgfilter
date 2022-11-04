This project is the MATLAB implementation of a mesh smoothing method introduced in the following article:
Gábor Fábián, Generalized Savitzky-Golay filter for smoothing triangular meshes. Computer Aided Geometric Design, 2022. 

Usage: the smoothing vertex coordinates determined by evaluating bivariate polynomials of degree d fitted to the k-neighborhoods of vertices. The smoothing process can be called iteratively N consecutive times. In data folder you can find test models, the details of the test can be customized in "test.m".

Running the test with the following settings:  

    % Input OBJ file
    file = "../data/bunny.obj";
    % Noise strength
    noise = 0.03; 
    % Size of the neighborhood
    k=2;
    % Degree of polynomial to be fitted
    d=1; 
    % Number of iterations
    N=1;

creates three files in the "results" folder:

    "bunny_original.png": the original mesh, 
    "bunny_noisy.png": the mesh corrupted by some random noise. To set amount of noise, set the "noise" variable. 
    "bunny_SG(2,1)x1.png": the mesh smoothed with N=1 iteration of Savitzky-Golay filter using k=2 and d=1.
