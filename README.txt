Instructions for running the code for Low Light Image Enhancement (LIME):

1. 'lime_main_module.m' is the main file. To run LIME, steps are:
	a. Load an image from this folder
	b. Use the table mentioned below for selecting optimum values of mu, rho, ds, ss for this image
	c. In MATLAB command line, write [Ti,Tout,img_out,Iout] = lime_main_module(img_in,mu,rho,ds,ss,flag);
	Here, flag is kept 1 to view the results. Ti and Tout are initial and refined illumination maps, img_out and Iout are enhanced and denoised results.

		       Table I
	name	 mu	rho	ds	ss
	building 0.01	1.188	10	1.5
	cars	 0.045	1.134	5	0.75
	lamp	 0.8	1.07	0.1	1
	land	 0.5	1.09	0.3	4
	moon	 0.01	1.2	1	0.5
	paint	 0.3	1.15	1	0.5
	robot	 0.01	1.25	10	1
	table	 0.002	1.035	100	1
	wires	 0.01	1.165	1	0.6
	
2. 'lime_loop.m' is the file for tuning the parameters for the solver, i. e. alpha, mu, rho.

3. 'lime_bf_loop.m' is the file for tuning the parameters for the bilateral filter, i. e. ds, ss.

4. 'histeq_all.m' is the file for generating the results of applying histogram equalization, on the raw image, in five different ways.

5. 'denoise_bm3d.m' is the file for denoising the enhanced result using BM3D.
The code for BM3D in file 'BM3D.m' as well as other files related to it have been downloaded and used only for the purpose of comparison with bilateral filtering.