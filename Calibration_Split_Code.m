for i = 1:1 
 I=imread(sprintf('img_X%d.tif', i));
  [r,c]= size(I);
 imwrite(I(1:r/2,1:c/2),('cam1.tif')) 
 imwrite(I(1:r/2,c/2+1:c),('cam2.tif'))
 imwrite(I(r/2+1:r,1:c/2),('cam3.tif'))
 imwrite(I(r/2+1:r,c/2+1:c),('cam4.tif')) 
end