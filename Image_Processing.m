%-------------------------------------------------------------------------%
                            %%%%%%% part a %%%%%%%
%-------------------------------------------------------------------------%                                 
                                 
                                 
img1 = imread('pout.tif'); %Reading the image
% img1 will be the original image.
img2 = img1; % img2 will be the Brightened Image in the next lines.
img3 = img1; % img3 will be the darkened imagen in the next lines.

figure('Part a'); % Creating a figure.
subplot(1,2,1); imshow(img1);%Ploting the image and the histogram using the subplot statement
subplot(1,2,2); imhist(img1);
ylim([0 3700]);



%-------------------------------------------------------------------------%
                               %%%%%%% part b %%%%%%%
%-------------------------------------------------------------------------%                                 
                               
                                

                             
img2 = img2+100; % adding 100  to pixels.
img3 = img3-100; % subtracting 100 from pixels.


                          %%% Original image Part(Printing info) %%%
                          
                          
figure; % Creating a new figure.
subplot(3,3,1), imshow(img1), title('Original'); % Ploting the original image.
subplot(3,3,2), imhist(img1), title('Histogram of Original Image'); 
ylim([0 3700]);
% Ploting the histogram of the Original image with limits of (0 --> 3700). 
arr1= 0:255;
subplot(3,3,3), plot(arr1,arr1), title('Transform of Original Image');
% Ploting the(output transform of the original image).
grid on;
xlabel('Pixels of Orignal Image'); % Labelling the x axis.
ylabel('Pixels of Orignal Image'); % Labelling the y axis. 

                             %%% Brightened image Part(Printing info) %%%
subplot(3,3,4), imshow(img2), title('Brightened Image'); % Ploting the Brightened image.
subplot(3,3,5), imhist(img2),title('Histogram of Brightened Image');
ylim([0 3700]);
% Ploting the histogram of the Brightened image with limits of (0 --> 3700).
arr2 =uint8(arr1+100);
subplot(3,3,6), plot(arr1,arr2), title('Transform of Brightened Image');
% Ploting the(output transform of the Brightened image).
%yline(255);
ylim([0 300]); % giving limits for the x axis.
xlim([0 300]); % giving limits for the y axis.
grid on;
xlabel('Pixels of Orignal Image'); % Labelling the x axis.
ylabel('Pixels of Brightened Image'); % Labelling the y axis.

                           %%% Darkened image Part(Printing info) %%%
                           
subplot(3,3,7), imshow(img3), title('Darkened Image'); % Ploting the Darkened image.
subplot(3,3,8), imhist(img3),title('Histogram of Darkened Image');
ylim([0 3700]);
% Ploting the histogram of the Darkened image with limits of (0 --> 3700).
arr3 =uint8(arr1-100);
subplot(3,3,9), plot(arr1, arr3), title('Transform of Darkened Image');
% Ploting the(output transform of the Darkened image).
ylim([0 300]); % giving limits for the x axis.
xlim([0 300]); % giving limits for the y axis.
grid on;
xlabel('Pixels of Orignal Image'); % Labelling the x axis.
ylabel('Pixels of Darkened Image'); % Labelling the y axis.


%-------------------------------------------------------------------------%
                               %%%%%%% part c %%%%%%%
%-------------------------------------------------------------------------%                                 
                                  
                                  
figure; % Creating a new figure.
img4=imadjust(img1,[(75/255), (180/255)],[]);%Enhancing the image(Increasing the contrast). 
% to plot the graph of the transformation we would describe it into pieces.
t1=0*[0:75]; % the first part of the plot(a horizontal line from 0:75).
t2=(255/(180-75.01))*[75.01:180]-180; % the second part of the plot is a ramp with a slope of (255-0)/(180-75).
t3=255*[180.01:255]; % the last part of the plot is (a horizontal lime from 180:255).
T1=uint8(floor([t1 t2 t3])); % combining the three pieces into one plot.

                           %%% Original image Part(Printing info) %%%
% output of the enhancing process(it would be used to plot the transform).
subplot(2,3,1), imshow(img1), title('Original Image'); % Ploting the Original image.
subplot(2,3,2), imhist(img1),title('Histogram of Original Image');
ylim([0 3700]);
% Ploting the histogram of the Original image with limits of (0 --> 3700).
subplot(2,3,3), plot(arr1,arr1),title('Transform of Original Image');
% Ploting the(output transform of the Original image).
ylim([0 300]); % giving limits for the x axis.
xlim([0 300]); % giving limits for the y axis.
grid on;
xlabel('Pixels of Orignal Image'); % Labelling the x axis.
ylabel('Pixels of Orignal Image'); % Labelling the y axis.

                            %%% Enhanced image Part(Printing info) %%%
                            
subplot(2,3,4), imshow(img4), title('Enhanced Image'); % Ploting the Enhanced image.
subplot(2,3,5), imhist(img4),title('Histogram of Enhanced Image');
ylim([0 3700]);
% Ploting the histogram of the Enhanced image with limits of (0 --> 3700). 
subplot(2,3,6), plot(arr1,T1),title('Transform of Enhanced Image');
% Ploting the(output transform of the Enhanced image).
ylim([0 300]); % giving limits for the x axis.
xlim([0 300]); % giving limits for the y axis.
grid on;
xlabel('Pixels of Orignal Image');  % Labelling the x axis.
ylabel('Pixels of Enhanced Image');  % Labelling the y axis.


%-------------------------------------------------------------------------%
                               %%%%%%% part d %%%%%%%
%-------------------------------------------------------------------------%                                 



figure; % Creating a new figure.
%img5 = histeq(img1);% Increasing the contrast by another way
[img5,T] = histeq(img1); % img5 will contain the image after increasing the
%contrast. & T will contain the output transform.

                            %%% Original image Part(Printing info) %%%

subplot(2,3,1), imshow(img1), title('Original Image');  % Ploting the Original image.
subplot(2,3,2), imhist(img1),title('Histogram of Original Image');
ylim([0 3700]);
% Ploting the histogram of the Original image with limits of (0 --> 3700). 
subplot(2,3,3), plot(arr1,arr1),title('Transform of Original Image');
% Ploting the(output transform of the Original image).
ylim([0 300]); % giving limits for the x axis.
xlim([0 300]); % giving limits for the y axis.
grid on;
xlabel('Pixels of Orignal Image');  % Labelling the x axis.
ylabel('Pixels of Orignal Image');  % Labelling the y axis.

                            %%% Stretched image Part(Printing info) %%%

subplot(2,3,4), imshow(img5), title('Stretched Image');  % Ploting the Stretched image.
subplot(2,3,5), imhist(img5),title('Histogram of Stretched Image');
ylim([0 3700]);
% Ploting the histogram of the Stretched image with limits of (0 --> 3700).
subplot(2,3,6), plot(arr1,255*T),title('Transform of Stretched Image');
% Ploting the(output transform of the Stretched image).
ylim([0 300]); % giving limits for the x axis.
xlim([0 300]); % giving limits for the y axis.
grid on;
xlabel('Pixels of Orignal Image');  % Labelling the x axis.
ylabel('Pixels of Stretched Image');  % Labelling the y axis.

