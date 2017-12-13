function trainFeature2()

clear
tic;

d=[];
for j=1:34
      B=strcat('.\train\Ne\',num2str(j),'\');
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

        [Histogram1,Histogram2,Histogram3] = Demo(VolData);
        Histogram=[Histogram1 Histogram2 Histogram3];

    
        d=[d;Histogram];
end;


for j=1:70
      B=strcat('.\train\Ot\',num2str(j),'\');
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

        [Histogram1,Histogram2,Histogram3] = Demo(VolData);
        Histogram=[Histogram1 Histogram2 Histogram3];

    
        d=[d;Histogram];
end;

for j=1:6
      B=strcat('.\train\Po\',num2str(j),'\');
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

        [Histogram1,Histogram2,Histogram3] = Demo(VolData);
        Histogram=[Histogram1 Histogram2 Histogram3];

    
        d=[d;Histogram];
end;

for j=1:14
      B=strcat('.\train\Su\',num2str(j),'\');
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

        [Histogram1,Histogram2,Histogram3] = Demo(VolData);
        Histogram=[Histogram1 Histogram2 Histogram3];

    
        d=[d;Histogram];
end;

P_train=d;
save('featureLBPtrain','P_train');
disp('speed cost:');
toc