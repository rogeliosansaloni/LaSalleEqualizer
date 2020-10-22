%Funcion para generar las vocales concatenadas
function concatenaVocales
[x_a, fs_a] = audioread('a.wav');
[x_e, fs_e] = audioread('e.wav');
[x_i, fs_i] = audioread('i.wav');
[x_o, fs_o] = audioread('o.wav');
[x_u, fs_u] = audioread('u.wav');
x_final = x_a;
x_final = [x_final;x_e];
x_final = [x_final;x_i];
x_final = [x_final;x_o];
x_final = [x_final;x_u];

audiowrite('aeiou.wav', x_final, fs_a);
