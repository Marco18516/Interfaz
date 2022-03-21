%%-----------------Laboratorio#10-----------------
%%-----------Procesamiento de señales------------
%%-----------------Marco Juarez------------------
%%-----------Carné 18516 - Seccion 21 -----------

close all;
clear
N = 1000;
t = linspace(0,10,N)';
K = 10;
%vector
%data = zeros(500,1);

delete(instrfind);
%Se configura el puerto en el que esta conectado la tivaC
%Y el baudrate al que se operara para la comunicación
s = serialport('COM4',115200);

figure(1); clf;
h7 = plot(t,zeros(N,1));

ylim([-50,50]);
k = 1;

%Ciclo for
while (1) 
    
    for n = 1:N        
        buffer = readline(s);
        dato_in = split(buffer,"!"); 
        grafica(k) = str2double(dato_in(1));
        %valorx = str2double(dato_in(2,1));

        if(k == K)
            h7.YData((n-K+1):n) = grafica;   % Asume que K es factor de N. De lo contrario,
                                             % hay que hacer ajustes adicionales.
            drawnow limitrate
            k = 1;
        else
            k = k + 1;    
        end
        
        
    end
    %i = i+1;
    %figure(1); clf;
    h7 = plot(t,zeros(N,1));

    ylim([-50,50]);
    k = 1;
end




