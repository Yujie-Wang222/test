% 256-QAM modulation
function sig_m = modulation(msg)
global bps Mum 
% msg = (msg+1)/2; 
% % 如何处理0/1 与-1/1的变化？？？

% msg = [1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,1];
M = 256;  % M = order of QAM modulation

nbit = length(msg);
msg_reshape = reshape(msg,log2(M),nbit/log2(M))';  
% one point is decided by log2(M) bits
% there are nbit/log2(M) points in total in the plot

for j = 1:1:nbit/log2(M)
   for i = 1:1:log2(M)
       a(j,i) = num2str(msg_reshape(j,i));
   end
end

as = bin2dec(a); % as is the number to determine point from 0-255(column vector)
ass = as';  % ass is the row vecter for as
p = qammod(ass,M);     %constalation design for M-array QAM acording to symbol
RR = real(p);
II = imag(p);

f = bps * 10;
bp = 1/bps;  % period time for one message
sp = bp * 2;     % symbol period for M-array QAM  %采样定理???
t = sp * Mum : sp * Mum : sp;  %符号持续时间向量

sig_m = [];
for k = 1:1:length(p)
    yr = RR(k)*cos(2*pi*f*t);                     % inphase or real component
    yim = II(k)*sin(2*pi*f*t);            % Quadrature or imagenary component 
    y = yr + yim;
    sig_m = [sig_m,y];
end

% ss=length(t);  %符号持续时间向量总量
% tt=sp*Mum:sp*Mum:sp*length(RR);  %所有符号的传输时间向量
% figure(1);
% plot(tt,sig_m);    
% title('waveform for M-array QAM modulation acording to symbolic information');
% xlabel('time(sec)');
% ylabel('amplitude(volt)');

% consttelation diagram for M-array QAM                                          
% scatterplot(p),grid on;
% title('consttelation diagram for M-array QAM');