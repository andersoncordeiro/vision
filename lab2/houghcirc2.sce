clear;
exec /home/anderson/visao/siptoolbox/loader.sce;
stacksize('max');

//Carregando Imagem
ImgOriginal = imread('/home/anderson/VisaoComputacional/vision-course/lab2/figs/moedas.jpg');
Img = im2gray(ImgOriginal);
I = edge(Img, 'sobel', 0.2);
[y,x]=find(I);
[sy,sx]=size(I);

xset('window',0);
imshow(I);

// Transformada de Hough

[Ni,Nj] = size(I);    // Tamanho da imagem


// Parametros
r_max = floor(sqrt((Ni/2)^2+(Nj/2)^2));   // Raio máximo 
r_min = 15; // raio minimo

mycos = cos(linspace(0,2*%pi,360));
mysen = sin(linspace(0,2*%pi,360));

hough_space = zeros(Ni,Nj,r_max);
for i = 1 : Ni 
	for j = 1 : Nj
		if I(i,j) == 1
		    for r = r_min : r_max
		        for teta = 1 : 360
		            x0 = round(i - r*mycos(teta));
		            y0 = round(j - r*mysen(teta));
		            if (x0 > 0) & (y0 > 0) & (x0 < Ni) & (y0 <Nj)
		            	hough_space(x0,y0,r - r_min +1) = hough_space(x0,y0,r - r_min +1) + 1;
		            end
		        end
		    end
		end
    end
end


//Plotar o circulo
B = hough_space;
cir_max = 3;		

xset('window',1);
imshow(ImgOriginal);


for cir = 1 : cir_max 

	posicao = find(B == max(B));


	linha = modulo(posicao,Ni);
	linha(linha == 0 ) = Ni;

	coluna = ceil(posicao/Ni);

	submatriz = ones(1, length(coluna));
	submatriz(coluna > Nj) = ceil(coluna(coluna>Nj)/Nj);

	coluna(coluna > Nj) = modulo(coluna(coluna>Nj),Nj);
	coluna(coluna == 0) = Nj;

	x0 = coluna;
	y0 = linha;
	r  = submatriz;

	for p = 1 : length(linha)
		plot( x0(p) + ( r(p)+r_min-1 )*mycos, (Ni - y0(p) )+ ( r(p)+r_min-1 )*mysen, 'thickness',5);
	end

	B(B == max(B)) = 0;


end


