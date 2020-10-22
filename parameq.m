%Sof�a Bonifasi
%Carles Castro
%Rogelio Sansaloni

%Funci�n parameq.m
function [B,A,yFinal] = parameq(f0,fs,bw,G,x)
% [B,A,y] = parameq(f0,fs,bw,G,x)
%
% Filtro param�trico de Regalia-Mitra [1], donde x es la se�al discreta
% a filtrar, y los par�metros de entrada del filtro son:
% - f0: frecuencia central (en Hz)
% - fs: frecuencia de muestreo (en Hz)
% - bw: ancho de banda (en Hz)
% - G: ganancia del filtro (en dB)
% - x: se�al temporal de entrada del filtro
%
% Los argumentos de salida son los vectores de coeficientes del filtro
%(numerador B y denominador A) y la se�al temporal filtrada de salida y.
%
% [1] Regalia and Mitra (IEEE Trans. ASSP-35, no. 1, January, 1987

K = 10.^(G/20);
b = -cos((2*pi*f0)/(fs));
a = (1 - tan(2*pi*(bw/fs)))/(1 + tan(2*pi*(bw/fs)));
%Numerador
num = [a b*(1+a) 1];
%Denominador
den = [1 b*(1+a) a];
%Funcion de Transferencia
Hap = num/den;
%Filtro
%Ecuaci�n de la y
y = (1/2)*(x + x*Hap) + (K/2)*(x - x*Hap);
%A partir del filtro aislamos la M y la N
M = (1 + K)/2;
N = (1 - K)/2;
B = [(M+N*a) b*(1+a)*(M +N) (M*a+N)];
A = den;

yFinal = filter(B, A, y);

end





