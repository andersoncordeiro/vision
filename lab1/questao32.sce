//Funcao que recebe caminho da imagem e inverte O RGB (Questao 3.2 - Celula)

function [Img] = inverte (imagem);
	 info = imfinfo(imagem);
         [Img] = imread(imagem);
	 [Img] = 1 - Img ;
endfunction

// Digite o caminho com as aspas
Caminho = input('Digite o caminho da imagem: ')
[Img] = inverte(Caminho);
imshow(Img)

