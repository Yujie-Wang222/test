function rxBits = decoding(re_bi_in)
% ldpcDecoder = comm.LDPCDecoder;
% demodSig = double(re_bi_in');
% rxBits = ldpcDecoder(demodSig)';
re_bi_in = re_bi_in';
bgn = 2;
rxcodedcbs = double(1-2*re_bi_in);   

FillerIndices = re_bi_in(:,1) == -1;  %?不太明白这两行在干嘛，注释掉也可正常运行
rxcodedcbs(FillerIndices,:) = 0;

% maximum number of decoding iterations maxNumIter
% Decode the encoded codeword with a maximum of 25 iterations.
[rxBits,actualniters] = nrLDPCDecode(rxcodedcbs,bgn,25); 
% Replace filler bits with zero in transmit data and compare the results of encoding and decoding.
rxBits = rxBits';
% txcbs(end+1:end,:) = 0;    
% isequal(rxcbs,txcbs)     %  确定数组相等性       
% actualniters