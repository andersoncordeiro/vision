clear;
exec /home/anderson/visao/siptoolbox/loader.sce;

//Carregando Imagem
ImgOriginal = imread('/home/anderson/VisaoComputacional/vision-course/lab2/figs/tabxadrez.jpeg');
xset('window',0);
imshow(ImgOriginal);

//Convertendo Imagem para escala de cinza e utilizando o Edge (Transformando em Binaria)
Img = im2gray(ImgOriginal);
Img = edge(Img, 'sobel', 0.1);
xset('window',1);
imshow(Img);

//Inicializando variaveis para Hough Transform
theta_sample_frequency = 0.01;                                             
[x, y] = size(Img);
rho_limit = norm([x y]); 

rho = (-rho_limit:1:rho_limit);
theta = (0:theta_sample_frequency:%pi);

num_thetas = length(theta);
num_rhos = length(rho);

mycos = cos(linspace(0,%pi,180));
mysen = sin(linspace(0,%pi,180));

hough_space = zeros(num_thetas, num_rhos);


// Calculando e plotando Hough Space
for xi = 1:x,
    for yj = 1:y,
        if Img(xi, yj) == 1, 
	    for theta_index = 1:num_thetas,
                th = theta(theta_index);
                r  = xi * cos(th) + yj * sin(th);
                rho_index = round(r + num_rhos/2);                      
                hough_space(theta_index, rho_index) = hough_space(theta_index, rho_index) + 1;
            end
        end
    end
end
xset('window',2);
imshow(hough_space,[]);


B = hough_space;

reta_max = 70;

xset('window',3);
imshow(Img);

for cont = 1 : reta_max

	posicao = find(B == max(B));

	linha = modulo(posicao,180);
	linha(linha == 0 ) = 180;

	coluna = ceil(posicao/180);



	teta = linha;
	rho = coluna - rho_limit;

	for i = 1 : length(teta)
		yi = [1:x];  // linha
		xj = [1:y]; // coluna
		
		
			if (teta(i) == 1) | (teta(i) == 180) 
				xj = (rho(i)*ones(1,length(yi)) - yi*mysen( teta(i) ))/mycos( teta(i) );
				pos = find( (xj>0) & (xj<=y) );
				if length(pos) ~= 0
					plot( xj(pos) , x-yi(pos) );
				end
		
			else
				yi = (rho(i)*ones(1,length(xj)) - xj*mycos( teta(i) ))/mysen( teta(i) );
				pos = find( (yi>0) & (yi<=x) );
				if length(pos) ~= 0
					plot( xj(pos) , x-yi(pos) );
				end
		
			end
	end
	
	B(B == max(B)) = 0;
end	
