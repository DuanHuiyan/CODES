

function Hist=anna_phog_demo(VolData)

bin = 12;
angle = 360;
L=3;
[height,width,~]=size(VolData);
roi = [1;height;1;width];
p = anna_phog(VolData,bin,angle,L,roi);
Hist=p;