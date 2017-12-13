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
        
        
        if i == 1
            [height width] = size(Imgdat);
            VolData = zeros(height, width, length(a));
        end;
        VolData(:, :, i) = Imgdat;
     end;
cd ../../..;

        Histogramxy=hog(VolData,1);
        Histogramxy=Histogramxy';
        
        Histogramxt=hog(VolData,2);
        Histogramxt=Histogramxt';
        
        Histogramyt=hog(VolData,3);
        Histogramyt=Histogramyt';
        
        Histogram=[Histogramxy Histogramxt Histogramyt];


    
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

        Histogramxy=hog(VolData,1);
        Histogramxy=Histogramxy';
        
        Histogramxt=hog(VolData,2);
        Histogramxt=Histogramxt';
        
        Histogramyt=hog(VolData,3);
        Histogramyt=Histogramyt';
        
        Histogram=[Histogramxy Histogramxt Histogramyt];



    
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

        Histogramxy=hog(VolData,1);
        Histogramxy=Histogramxy';
        
        Histogramxt=hog(VolData,2);
        Histogramxt=Histogramxt';
        
        Histogramyt=hog(VolData,3);
        Histogramyt=Histogramyt';
        
        Histogram=[Histogramxy Histogramxt Histogramyt];



    
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
        Histogramxy=hog(VolData,1);
        Histogramxy=Histogramxy';
        
        Histogramxt=hog(VolData,2);
        Histogramxt=Histogramxt';
        
        Histogramyt=hog(VolData,3);
        Histogramyt=Histogramyt';
        
        Histogram=[Histogramxy Histogramxt Histogramyt];


    
        d=[d;Histogram];
end;

P_train3=d;
save('featureHOGtrain1212','P_train3');
disp('speed cost:');
toc