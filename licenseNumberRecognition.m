%ECE 4580 Final Project
%Ethan Kim, Teng Li, Sean Zhang

function licenseNumberRecognition(input,numChar)

orig=imread(input); % Reading the license plate
figure(1),imshow(orig);
orig=imresize(orig,[400 NaN]); % Resize the image 

gray=rgb2gray(orig); %Convert RGB to gray
figure(2),imshow(gray);
gray=medfilt2(gray,[3 3]); % Median filtering to remove noise.
figure(3),imshow(gray);
filter=strel('disk',1);
dilation=imdilate(gray,filter); % gray image dilation
figure(4), imshow(dilation);
erosion=imerode(gray,filter); % gray image erosion
figure(5), imshow(erosion);
edge_enhanced=imsubtract(dilation,erosion); % edge enhancement
figure(6),imshow(edge_enhanced);


edge_enhanced=mat2gray(edge_enhanced); % Converting the class to double.
edge_enhanced=conv2(edge_enhanced,[1 1;1 1]); % Convolution of the double image for brightening the edges.
intensity_scaled=imadjust(edge_enhanced,[0.5 0.7],[0 1],0.1); % Intensity scaling between the range 0 to 1.
figure(7), imshow(edge_enhanced);
B=logical(intensity_scaled); % double to binary
filter1 = strel('line',50,0);
line=imerode(B,filter1);
filterHorizontal=imsubtract(B,line);
figure(8), imshow(filterHorizontal);
Filled=imfill(filterHorizontal,'holes');     %fill in the holes
figure(9),imshow(Filled);
Thin=bwmorph(Filled,'thin',1);          %thin between each characters
figure(10),imshow(Thin);
filter2 = strel('line',3,90);
Thin=imerode(Thin,filter2);
final=bwareaopen(Thin,2000);            %delete pixels that are less than 2000
BoundingBox=regionprops(final,'BoundingBox','Image');
figure(11), imshow(final)
hold on
for n=1:size(BoundingBox,1)         %display bounding box for each character
    rectangle('Position',BoundingBox(n).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off

AllBoxes=cat(1,BoundingBox.BoundingBox);       %all bounding boxes
indices=extractIndices(AllBoxes, numChar); 
I={BoundingBox.Image}; 
PlateNum=[]; 


for i=1:length(indices)         %for each indices, check with template
    N=I{1,indices(i)}; 
    letter=compare(N); 
    PlateNum=[PlateNum letter]; 
end
X = ['The license number is: ',PlateNum];       %output to screen
disp(X)

end


