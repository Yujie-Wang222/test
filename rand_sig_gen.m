% gengerate bit information info_row*info_col
function bits = rand_sig_gen
message_row = 1; % here we all consider to be 1 
% message_col = 8^3; % one point represents 8 bits in 256QAM
% message_col = 32400; 
message_col = 2560;
% Invalid lifting size 1024 for base graph number 2. 
% A valid lifting size must be one from the supported set of
% [2:16 18:2:32 36:4:64 72:8:128 144:16:256 288:32:384] values.
% The decoder uses the sum-product message-passing algorithm.
% The data bits must be LDPC-encoded as defined in TS 38.212 Section 5.3.2 
bits =randi([0,1],message_row,message_col);