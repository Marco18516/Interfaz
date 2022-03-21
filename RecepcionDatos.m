%%-----------------Miniproyecto------------------
%%-----------------Marco Juarez------------------
%%----------------Carné 18516-----------

close all;
clear
N = 1000;
t = linspace(0,10,N)';
%vector
%data = zeros(500,1);

delete(instrfind);
%Se configura el puerto en el que esta conectado la tivaC
%Y el baudrate al que se operara para la comunicación
s = serialport('COM4',115200);
%muestra = str2double(readline(s))*(-1);

figure(1); clf;
h = plot(t,zeros(N,1))
xlim([0,t(end)]);
ylim([-50,50]);
%Ciclo for
tic;
for n = 1:N
    %%Se leen los datos y se almacenan en el vector
    h.YData(n) = str2double(readline(s));
    drawnow limitrate
end
time = toc

