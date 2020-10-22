%Rogelio Sansaloni

%Funci�n parameq_fullband.m
function [B,A,y_filtrada] = parameq_fullband(f0,fs,bw,G,x)
% Funci�n encargada de implementar el filtro global formado por la
% concatenaci�n en serie o cascada de dos filtros param�tricos (funci�n
% parameq.m)

[B1, A1, y1] = parameq(f0(1),fs,bw(1),G(1),x);
[B2, A2, y2] = parameq(f0(2),fs,bw(2),G(2),y1);
y = y2;

B = conv(B1, B2);
A = conv(A1, A2);

y_filtrada = filter(B,A,y2);
%
% Sus par�metros son los siguientes:
% - f0: vector con las frecuencias centrales de los dos filtros en Hz
% - fs: frecuencia de muestreo (en Hz)
% - bw: vector con el ancho de banda de los dos filtros en Hz
% - G: vector con las ganancias de los dos filtros en dB
% - x: se�al temporal de entrada del filtro
%
% Los argumentos de salida son los coeficientes del filtro global
%(numerador B y denominador A) y la se�al temporal filtrada de salida y.
