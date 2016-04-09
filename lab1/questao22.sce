//Funcao que recebe caminho da imagem, t0 e t1 (Questao 2.2 - Bilevel Threshold)

function [Img] = threshold (imagem,t0,t1);
	info = imfinfo(imagem);
        [Img] = gray_imread(imagem);
	for i=1:info.Height
		for j=1:info.Width
                	if Img(i,j) > t0 & Img(i,j) < t1  then
				Img(i,j) = 1
			elseif Img(i,j) > t1 & Img(i,j) < 1
				Img(i,j) = 0
			else
				Img(i,j) = 0				
			end
        	end
	end
endfunction

// Digite o caminho com as aspas
Caminho = input('Digite o caminho da imagem: ')
T0 = input('Digite T0: ')
T1 = input('Digite T1: ')

[Img] = threshold(Caminho,T0,T1);
imshow(Img)

