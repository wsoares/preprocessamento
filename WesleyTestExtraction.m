clear; clc;
im = imread('FVC2002/DB1_B/102_1.tif');
blksze = 16; thresh = 0.1;
[normim, mask] = ridgesegment(im, blksze, thresh);
[orientim, reliability] = ridgeorient(normim, 1, 5, 5);
blksze = 16;
[freq, medfreq] = ridgefreq(normim, mask, orientim,blksze, 5, 5, 15);
freq = medfreq.*mask;
newim = ridgefilter(normim, orientim, freq, 0.5, 0.5,1);

figure;
imshow(im), hold on;
plotridgeorient(orientim,20), hold off;
figure;
imshow(freq);