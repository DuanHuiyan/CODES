function testFeature2()

clear
tic;

c=[];
for j=1:18
      B=strcat('.\test\Ne\',num2str(j),'\');
      cd (B);
     a=dir('*.bmp');
     for i = 1 : length(a)
         ImgName = getfield(a, {i}, 'name');
         Imgdat = imread(ImgName);
         if size(Imgdat, 3) == 3 % if color images, convert it to gray
            Imgdat = rgb2gray(Imgdat);
         end;
        [height width] = size(Imgdat);
        if i == 1
            VolData = zeros(height, width, length(a));
        end;
        VolData(:, :, i) = Imgdat;
     end;
cd ../../..;


		Histogram=block_LBPSIP(VolData);
        
        c=[c;Histogram];
end;

for j=1:37
      B=strcat('.\test\Ot\',num2str(j),'\');
      cd (B);
     a=dir('*.bmp');
     for i = 1 : length(a)
         ImgName = getfield(a, {i}, 'name');
         Imgdat = imread(ImgName);
         if size(Imgdat, 3) == 3 % if color images, convert it to gray
            Imgdat = rgb2gray(Imgdat);
         end;
        [height width] = size(Imgdat);
        if i == 1
            VolData = zeros(height, width, length(a));
        end;
        VolData(:, :, i) = Imgdat;
     end;
cd ../../..;


		Histogram=block_LBPSIP(VolData);
        
        c=[c;Histogram];
end;

for j=1:3
      B=strcat('.\test\Po\',num2str(j),'\');
      cd (B);
     a=dir('*.bmp');
     for i = 1 : length(a)
         ImgName = getfield(a, {i}, 'name');
         Imgdat = imread(ImgName);
         if size(Imgdat, 3) == 3 % if color images, convert it to gray
            Imgdat = rgb2gray(Imgdat);
         end;
        [height width] = size(Imgdat);
        if i == 1
            VolData = zeros(height, width, length(a));
        end;
        VolData(:, :, i) = Imgdat;
     end;


cd ../../..;

		Histogram=block_LBPSIP(VolData);
        
        c=[c;Histogram];
end;

for j=1:7
      B=strcat('.\test\Su\',num2str(j),'\');
      cd (B);
     a=dir('*.bmp');
     for i = 1 : length(a)
         ImgName = getfield(a, {i}, 'name');
         Imgdat = imread(ImgName);
         if size(Imgdat, 3) == 3 % if color images, convert it to gray
            Imgdat = rgb2gray(Imgdat);
         end;
        [height width] = size(Imgdat);
        if i == 1
            VolData = zeros(height, width, length(a));
        end;
        VolData(:, :, i) = Imgdat;
     end;
cd ../../..;


		Histogram=block_LBPSIP(VolData);

        c=[c;Histogram];
end;

P_test=c;
save('block_featureLBPSIPtest1210','P_test');
disp('speed cost:');
toc