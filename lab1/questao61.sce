stacksize('max');
chdir('/home/anderson/VisaoComputacional/PoucaLuz');
rotulo = ls('*.jpg');

QTDimagens = size(rotulo,1)


M = [ ]

for i = 1 : QTDimagens
    
    im = imread(rotulo(i));
    M  = [ M, im(:) ];
end

[l,c,p] = size(im);

ImMedia = mean(M,'c');
ImMedia = matrix(ImMedia,l,c,p);

xset('window',1);  
imshow(ImMedia);
imwrite(ImMedia,'MediaPoucaLuz.jpg');


ImDesvio = st_deviation(M,'c');
ImDesvio = matrix(ImDesvio,l,c,p);

xset('window',2);  
imshow(ImDesvio);
imwrite(ImDesvio,"DesvioPoucaLuz.jpg');

 
xset('window',3);   
histplot(256,ImDesvio(:),normalization=%f);
a=get("current_axes");
a.data_bounds(:,1) = [0;0.25];


histplot(256,M(10233,:),normalization=%f);
plot(ImMedia(10233),0.2,'r.')
