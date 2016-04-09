//Funcao que recebe caminho da imagem e faz o subsampling (Questao 5 - Celula)

function [Reduzida] = subsampling (imagem);
	info = imfinfo(imagem);
        [Img] = imread(imagem);
	for c=1:3
	for i=1:info.Height/2
		for j=1:info.Width/2
			Reduzida(i,j,c) = Img(2*i-1,2*j-1,c);			
        	end
	end
	end
endfunction

// Digite o caminho com as aspas
Caminho = input('Digite o caminho da imagem: ')
[Reduzida] = subsampling(Caminho);
imshow(Reduzida)

