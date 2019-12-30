% 低信噪比（10dB）条件下，星座图聚类点各类到聚类中心距离平方和之对数与SNR的多项式关系
n=10;
p=20;
x1 = 0:n;
y1 = 0:n;
num = 10000;
a = 1:p;
%% 2PSK
for snr=0:n
    for jj=1:p
        signal = signal_generation(1,snr,'psk',num);
        x = real(signal);
        y= imag(signal);
        tmp=[x;y];
        tmp=tmp';
        [idx,C,sumD] = kmeans(tmp,2);
        a(jj) = mean(sumD);
    end
    y1(snr+1) = mean(a);
end
SNRModel_2PSK = polyfit(x1,log10(y1),2);
f1=SNRModel_2PSK(1)*x1.^2+SNRModel_2PSK(2)*x1+SNRModel_2PSK(3);
save SNRModel_2PSK SNRModel_2PSK 
% plot
subplot(2,3,1)
plot(x1,log10(y1),'s','MarkerFaceColor',[0 0.4470 0.7410] )
hold on;
title('2PSK')
hold on;
plot(x1,f1,'Color',[0 0.4470 0.7410])
xlabel('SNR/dB')
ylabel('log(Var^2)' )
%% QPSK
for snr=0:n
    for jj=1:p
        signal = signal_generation(2,snr,'psk',num);
        x = real(signal);
        y= imag(signal);
        tmp=[x;y];
        tmp=tmp';
        [idx,C,sumD] = kmeans(tmp,4);
        a(jj) = mean(sumD);
    end
    y1(snr+1) = mean(a);
end
SNRModel_QPSK = polyfit(x1,log10(y1),2);
f2=SNRModel_QPSK(1)*x1.^2+SNRModel_QPSK(2)*x1+SNRModel_QPSK(3);
save SNRModel_QPSK SNRModel_QPSK
% plot
subplot(2,3,2)
plot(x1,log10(y1),'s','MarkerFaceColor',[0 0.4470 0.7410] )
hold on;
plot(x1,f2,'Color',[0 0.4470 0.7410])
title('QPSK')
xlabel('SNR/dB')
ylabel('log(Var^2)' )
%% 8PSK
for snr=0:n
    for jj=1:p
        signal = signal_generation(3,snr,'psk',num);
        x = real(signal);
        y= imag(signal);
        tmp=[x;y];
        tmp=tmp';
        [idx,C,sumD] = kmeans(tmp,8);
        a(jj) = mean(sumD);
    end
    y1(snr+1) = mean(a);
end
SNRModel_8PSK = polyfit(x1,log10(y1),2);
save SNRModel_8PSK SNRModel_8PSK
% plot
f3=SNRModel_8PSK(1)*x1.^2+SNRModel_8PSK(2)*x1+SNRModel_8PSK(3);
subplot(2,3,3)
plot(x1,log10(y1),'s','MarkerFaceColor',[0 0.4470 0.7410] )
hold on;
plot(x1,f3,'Color',[0 0.4470 0.7410])
title('8PSK')
xlabel('SNR/dB')
ylabel('log(Var^2)' )
%% 8QAM
for snr=0:n
    for jj=1:p
        signal = signal_generation(3,snr,'qam',num);
        x = real(signal);
        y= imag(signal);
        tmp=[x;y];
        tmp=tmp';
        [idx,C,sumD] = kmeans(tmp,8);
        a(jj) = mean(sumD);
    end
    y1(snr+1) = mean(a);
end
SNRModel_8QAM = polyfit(x1,log10(y1),2);
save SNRModel_8QAM SNRModel_8QAM
% plot
f4=SNRModel_8QAM(1)*x1.^2+SNRModel_8QAM(2)*x1+SNRModel_8QAM(3);
subplot(2,3,4)
plot(x1,log10(y1),'s','MarkerFaceColor',[0 0.4470 0.7410] )
hold on;
plot(x1,f4,'Color',[0 0.4470 0.7410])
title('8QAM')
xlabel('SNR/dB')
ylabel('log(Var^2)' )
%% 16QAM
for snr=0:n
    for jj=1:p
        signal = signal_generation(4,snr,'qam',num);
        x = real(signal);
        y= imag(signal);
        tmp=[x;y];
        tmp=tmp';
        [idx,C,sumD] = kmeans(tmp,16);
        a(jj) = mean(sumD);
    end
    y1(snr+1) = mean(a);
end
SNRModel_16QAM = polyfit(x1,log10(y1),2);
save SNRModel_16QAM SNRModel_16QAM
% plot
f5=SNRModel_16QAM(1)*x1.^2+SNRModel_16QAM(2)*x1+SNRModel_16QAM(3);
subplot(2,3,5)
plot(x1,log10(y1),'s','MarkerFaceColor',[0 0.4470 0.7410] )
hold on;
plot(x1,f5,'Color',[0 0.4470 0.7410])
title('16QAM')
xlabel('SNR/dB')
ylabel('log(Var^2)')
%% 32QAM
for snr=0:n
    for jj=1:p
        signal = signal_generation(5,snr,'qam',num);
        x = real(signal);
        y= imag(signal);
        tmp=[x;y];
        tmp=tmp';
        [idx,C,sumD] = kmeans(tmp,32);
        a(jj) = mean(sumD);
    end
    y1(snr+1) = mean(a);
end
SNRModel_32QAM = polyfit(x1,log10(y1),2);
save SNRModel_32QAM SNRModel_32QAM
% plot
f6=SNRModel_32QAM(1)*x1.^2+SNRModel_32QAM(2)*x1+SNRModel_32QAM(3);
subplot(2,3,6)
plot(x1,log10(y1),'s','MarkerFaceColor',[0 0.4470 0.7410] )
hold on;
plot(x1,f6,'Color',[0 0.4470 0.7410])
title('32QAM')
xlabel('SNR/dB')
ylabel('log(Var^2)')

