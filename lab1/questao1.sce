//Funcao que recebe caminho da imagem e o t0 (Questao 1 - Celula ou Snowman)

function [Img] = threshold (imagem,t);
	info = imfinfo(imagem);
        [Img] = gray_imread(imagem);
	for i=1:info.Height
		for j=1:info.Width
                	if Img(i,j) > t then
				Img(i,j) = 0
			else
				Img(i,j) = 1;
			end
        	end
	end
endfunction

Caminho = input('Digite o caminho da imagem: ');
T = input('Digite T: ');
[Img] = threshold(Caminho,T);
imshow(Img)

