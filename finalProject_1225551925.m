%%
clc; clear;
load('data.mat');
figure(1)
I=imshow(image);

%%
I2 = im2double(image);
I2 = I2(:,:,1);    %%For gray scale image dscard 3rd column
[U,S,V] =svd(I2);   %% perform SVD

%Number of singular values to take 

 m=50;
    
% Change the diagonal eigenvalue matrix to keep only 'k' eigenvalues
S_reduced = S(1:m,1:m);
U_reduced = U(:,1:m);
V_reduced = V(:,1:m);

%produce matrix A with reduced matrix 
Ak = U_reduced*S_reduced*V_reduced';

%plot the image
figure(2), 
imshow(Ak);
% figure(2), imshow(Ak);

%%
[m, n] = size(I2);
rank= min(m,n);

sigmar = zeros(1,rank);

for x = 1:rank
sigmar(x) = S(x,x); 

end
sigma1 = S(1,1);
Y = sigmar/sigma1;

figure(3)
semilogy(Y)
grid on
