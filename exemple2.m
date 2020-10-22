%Rogelio Sansaloni

%Test 02
function exemple2
G = 30;
fs = 8000;
f0 = 2000;
bw = db2mag(6);

T = 0.1;
n = round(fs*T);
N = 0:(n-1);
x = 3*(cos(2*pi*0/fs*N)) + cos(2*pi*500/fs*N) + 3*(cos(2*pi*1900/fs*N)) + 2*(cos(2*pi*2000/fs*N));
[B,A,y] = parameq(f0,fs,bw,G,x);

z = fft(x);  
n = length(x);
z = z(1:n/2+1);
f = 0:fs/n:fs/2;


%Módulo en dB de la señal de entrada en el dominio frecuencial
subplot(3,2,1)
plot(f, 20*log10(abs(z)))
xlabel('Frequency (Hz)') 
ylabel('Magnitude (dB)')
title('Input','fontweight','bold')
grid on
xlim([0 4000])
ylim([30 85]);

%Señal de entrada en el dominio temporal
subplot(3,2,2)
plot(x)
xlabel('Sample') 
ylabel('Amplitude')
title('Input','fontweight','bold')
grid on
xlim([0 800])
ylim([-2.5 9]);

%Respuesta del filtro en el dominio frecuencial
subplot(3,2,3)
[h,w] = freqz(B,A);
H = 20*log10(abs(h));
plot(w*(400*pi), H)
xlabel('Frequency (Hz)') 
ylabel('Gain (dB)')
title('Filter Transfer Function','fontweight','bold')
grid on
xlim([0 4000])
ylim([0 30]);

%Respuesta del filtro en el dominio temporal
subplot(3,2,4)
arrayZeros = zeros(1, 3999);
H = [1 arrayZeros];
w = filter(B,A,H);
plot(w)
xlabel('Sample') 
ylabel('Amplitude')
title('Impulse Response','fontweight','bold')
grid on
xlim([0 800])
ylim([-0.09 1.1]);

%Módulo en dB de la señal filtrada en el dominio frecuencial
yFreq = fft(y);  
lengthY = length(y);
yFreq = yFreq(1:lengthY/2+1);
fY = 0:fs/lengthY:fs/2;
yDB = 20*log10(abs(yFreq));
subplot(3,2,5)
plot(fY, yDB)
xlabel('Frequency (Hz)') 
ylabel('Magnitude (dB)')
title('Output','fontweight','bold')
grid on
xlim([0 4000])
ylim([30 85]);

%Señal de salida filtrada en el dominio temporal
subplot(3,2,6)
plot(y)
xlabel('Sample') 
ylabel('Amplitude')
title('Output','fontweight','bold')
grid on
xlim([0 800])
ylim([-45 50]);
end