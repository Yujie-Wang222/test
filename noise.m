% noise - Additive white gaussian noise AWGN
function rx = noise(sig_m,snr)
% snr = 20;
% signalpower = 'measured';
% rx=sig_m+sigma*(randn(1,length(sig_m))+1i*randn(1,length(sig_m)));
rx = awgn(sig_m,snr,signalpower);
[row,col] = size(sig_m);
rx = zeros(row,col);
for n = 1:1:row
    for m = 1:1:col
        rx(n,m) = awgn(sig_m(n,m),snr);
    end
end

        
        