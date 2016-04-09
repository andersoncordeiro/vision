//Funcao que reduz o número de levels (Questao 4 - Celula)

function [Img8, Img16] = quantization (imagem);
	info = imfinfo(imagem);
        [Img] = imread(imagem);
	xset('window',0);imshow(Img);

	//8levels
        dImg = Img*256;
	for i=1:info.Height
		for j=1:info.Width
                	if dImg(i,j) > 0 & dImg(i,j) < 32  then
				dImg(i,j) = 16;
			elseif dImg(i,j) >= 32 & dImg(i,j) < 64  then
				dImg(i,j) = 48;
			elseif dImg(i,j) >= 64 & dImg(i,j) < 96  then
				dImg(i,j) = 80;
			elseif dImg(i,j) >= 96 & dImg(i,j) < 128  then
				dImg(i,j) = 112;
			elseif dImg(i,j) >= 128 & dImg(i,j) < 160  then
				dImg(i,j) = 144;
			elseif dImg(i,j) >= 160 & dImg(i,j) < 192  then
				dImg(i,j) = 176;
			elseif dImg(i,j) >= 192 & dImg(i,j) < 224  then
				dImg(i,j) = 208;			
			elseif dImg(i,j) >= 224 & dImg(i,j) < 256  then
				dImg(i,j) = 240;			
			end
        	end
	end
	Img8 = normal(dImg);
	
	//16 levels
        dImg = Img*256;
	for i=1:info.Height
		for j=1:info.Width
                	if dImg(i,j) > 0 & dImg(i,j) < 16  then
				dImg(i,j) = 8;
			elseif dImg(i,j) >= 16 & dImg(i,j) < 32  then
				dImg(i,j) = 24;
			elseif dImg(i,j) >= 32 & dImg(i,j) < 48  then
				dImg(i,j) = 40;
			elseif dImg(i,j) >= 48 & dImg(i,j) < 64 then
				dImg(i,j) = 56;
			elseif dImg(i,j) >= 64 & dImg(i,j) < 80  then
				dImg(i,j) = 72;
			elseif dImg(i,j) >= 80 & dImg(i,j) < 96  then
				dImg(i,j) = 88;
			elseif dImg(i,j) >= 96 & dImg(i,j) < 112  then
				dImg(i,j) = 104;			
			elseif dImg(i,j) >= 112 & dImg(i,j) < 128  then
				dImg(i,j) = 120;			
			elseif dImg(i,j) >= 128 & dImg(i,j) < 144  then
				dImg(i,j) = 136;
			elseif dImg(i,j) >= 144 & dImg(i,j) < 160  then
				dImg(i,j) = 152;
			elseif dImg(i,j) >= 160 & dImg(i,j) < 172 then
				dImg(i,j) = 168;
			elseif dImg(i,j) >= 172 & dImg(i,j) < 188  then
				dImg(i,j) = 184;
			elseif dImg(i,j) >= 188 & dImg(i,j) < 204  then
				dImg(i,j) = 200;
			elseif dImg(i,j) >= 204 & dImg(i,j) < 220  then
				dImg(i,j) = 216;			
			elseif dImg(i,j) >= 220 & dImg(i,j) < 236  then
				dImg(i,j) = 232;			
			elseif dImg(i,j) >= 236 & dImg(i,j) < 252  then
				dImg(i,j) = 248;		
			end
        	end
	end
	Img16 = normal(dImg);

	
endfunction

// Digite o caminho com as aspas
Caminho = input('Digite o caminho da imagem: ')
[Img8, Img16] = quantization(Caminho);
xset('window',1);
imshow(Img8);
xset('window',2);
imshow(Img16);
