//Funcao que recebe caminho da imagem e o I (Questao 3.1 - Brightness/Clipping)

function [ImgAumentaBrilho, ImgDiminuiBrilho, map1, map2]=brilho(imagem, I);
	info = imfinfo(imagem);
        [ImgAumentaBrilho, map1] = imread(imagem);
        [ImgDiminuiBrilho, map2] = imread(imagem);
	for i=1:info.Height
		for j=1:info.Width
                	ImgAumentaBrilho(i,j)=ImgAumentaBrilho(i,j)+I;
			ImgDiminuiBrilho(i,j)=ImgDiminuiBrilho(i,j)-I;			
        	end
	end
endfunction

// Digite o caminho com as aspas
Caminho = input('Digite o caminho da imagem: ')
i = input('Digite i: ')
[ImgAumentaBrilho, ImgDiminuiBrilho, map1, map2] = brilho(Caminho,i);
xset("window",0);
imshow(ImgAumentaBrilho,map1)
xset("window",1);
imshow(ImgDiminuiBrilho,map2)
