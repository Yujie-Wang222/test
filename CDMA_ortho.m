clc
clear

global bps Mum
bps = 40e6;
Mum = 0.01; % Mum = multiple of sampling interval

EsN0=1:5; % range of signal to noise ratio
snr1 = 10.^(EsN0/10); % convert snr from decibels to linear values

num_of_users = 1; 

% gengerate random bit information
u_binary = rand_sig_gen;

% coding part
userCode = coding(u_binary);

% modulation
msgmod1 = modulation(userCode);
msgmod = 2 * msgmod1 - 1; % Change to bipolar code

% generate walsh matrix
walsh_order = nextpow2(num_of_users+2);  % add 2 to avoid num_of_user = 1 there is no walsh matrix
spreadCode = hadamard(walsh_order); 
spreadCode = spreadCode(2,:); % take the second row for num_of_user = 1 

% spread spectrum
res_spreadSpectrum = spreadSpectrum(msgmod,spreadCode); % first is information seconde is walsh 
% res_spreadSpectrum = msgmod1;

% base signal
base_sig = res_spreadSpectrum;

for z = 1:1:length(EsN0)

    % noise
    message_n = awgn(base_sig,EsN0(z));
    
    % despread spectrum
    res_deSpreadSpectrum = deSpreadSpectrum(message_n,spreadCode);
    res_deSpreadSpectrum = (res_deSpreadSpectrum + 1)/2; % Change from bipolar code to sigle code
%     res_deSpreadSpectrum = message_n;
    
    % demodulation
    re_bi_out = demodulation(res_deSpreadSpectrum);
    
    % decoding
    reBits = decoding(re_bi_out);
%     reBits = re_bi_out;
    
    % get bit error
    [~,ber(z)]=biterr(u_binary,reBits);

end

% compare
compare(EsN0,ber);

fprintf('Finish!\n');

