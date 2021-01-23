function re_bi_out = demodulation(sig_m)
global bps Mum 
M = 256;
f=bps*10;
bp = 1/bps;  % period time for one message
sp=bp*2;       %symbol period for M-array QAM 
t=sp*Mum:sp*Mum:sp;  %符号持续时间向量
ss = length(t);
% get original information 
m1=[];
m2=[];
for n=ss:ss:length(sig_m)
  y1=cos(2*pi*f*t);                                     % inphase component
  y2=sin(2*pi*f*t);                                  % quadrature component
  mm1=y1.*sig_m((n-(ss-1)):n);                                    
  mm2=y2.*sig_m((n-(ss-1)):n);                                    
  z1=trapz(t,mm1);                                            % integration
  z2=trapz(t,mm2);                                           % integration
  zz1=round(2*z1/sp);
  zz2=round(2*z2/sp);
  m1=[m1 zz1];
  m2=[m2 zz2];
end

% de-mapping for M-array QAM modulation 
clear i;
clear j;
for k=1:1:length(m1)  
    gt(k)=m1(k)+1j*m2(k);
end

ax=qamdemod(gt,M);
bi_in=dec2bin(ax);
[row,col]=size(bi_in);
p=1;

 for i=1:1:row
     for j=1:1:col
         re_bi_in(p)=str2num(bi_in(i,j));
         p=p+1;
     end
 end 
 
 re_bi_out = re_bi_in;