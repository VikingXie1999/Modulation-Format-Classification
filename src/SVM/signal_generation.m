function RxSignal = signal_generation(bitPerSymbol,snr,format,varargin)
% This function is to generate signals with different digital
% baseband modulation format (PSK,QPSK,8QAM,16QAM,32QAM...)
% under additive white Gaussian noise (AWGN) channel.
% 
% bitPerSymbol - the information quantity of a single symbol
% 	       snr - signal noise ratio with unit of dB
%       format - modulation format (PSK or QAM)
%     RxSignal - output signals
if nargin == 3
    dataNum = 10000;
else
    dataNum = varargin{1};
end

M = 2^bitPerSymbol;
dataSymbol = randi([0,M-1],1,dataNum);
if strcmp(format,'psk')||strcmp(format,'PSK')
    TxSignal = pskmod(dataSymbol,M,0);
elseif strcmp(format,'qam')||strcmp(format,'QAM')
    if bitPerSymbol == 3
        constel = [1+1i, -1+1i, -1-1i, 1-1i, 1+sqrt(3), (1+sqrt(3))*1i, -1-sqrt(3), -(1+sqrt(3))*1i];
        TxSignal = constel(dataSymbol+1);
    else
        TxSignal = qammod(dataSymbol,M,'gray');
    end
end
RxSignal = awgn(TxSignal,snr,'measured');
RxSignal = RxSignal/sqrt(mean(abs(RxSignal).^2));
end
