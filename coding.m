function msg_coding = coding(txcbs)
% ldpcEncoder = comm.LDPCEncoder;
% msg_ = logical(msg');
% msg_coding = ldpcEncoder(msg_)';
txcbs = txcbs';
% Generate LDPC codeword for the transmit data. Use base graph number two.
bgn = 2; 
% Base graph number, specified as 1 or 2. 
% The values correspond to the two base graphs defined in TS 38.212 Section 5.3.2 
% 3GPP TS 38.212. ¡°NR; Multiplexing and channel coding.¡± 3rd Generation Partnership Project; Technical Specification Group Radio Access Network.
msg_coding = nrLDPCEncode(txcbs,bgn);   
msg_coding = msg_coding';
%Convert transmit data to soft bits.
