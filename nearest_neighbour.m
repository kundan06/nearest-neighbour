% nearest neighbour
clear all;
a=imread('cameraman.tif');
sf=1.5;
[rows,columns]=size(a);

xdash = floor(rows*sf);
ydash = floor(columns*sf);
ind_x=[];
ind_y=[];

for i = 1:xdash
    ind_x(i) = round((i-0.5)/sf+0.5);
end

for i =1:ydash
    ind_y(i) = round((i-0.5)/sf+0.5);
end

out_image = a(ind_x,ind_y);

final_image=imresize(a,sf,'nearest');
diff=double(final_image-out_image);
mse=(diff.*diff)/(rows*columns);
rmse=sqrt(sum(sum(mse,1),2));
disp('Error is');
disp(rmse);

figure;
subplot(1,2,1);
imshow(a);
title('Original image');
subplot(1,2,2);
imshow(out_image);
title('Interpolation using nearest neighbour');