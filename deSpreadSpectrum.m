function res = deSpreadSpectrum(message_n,spreadCode)
% res_deSpreadSpectrum = deSpreadSpectrum(message_n,spreadCode);

% signal_1 = res_demodulate;
% signal_2 = walshCode;
%按数组位循环相乘函数
%示例:bitMultiple([1 2],[2 3 4 5]) = [2 6 4 10]
%signal1:相乘信号1
%signal2:相乘信号2
%res:相乘结果
% sizeSource = length(signal_1);
% sizePNCode = length(signal_2);
% 
% res = zeros(1,sizeSource);
% for i = 1:sizeSource
%     res(i) = signal_1(i) * signal_2(mod(i-1,sizePNCode)+1);
% end

h = reshape(message_n,length(message_n)/length(spreadCode),length(spreadCode))';
[row,col] = size(h);
for i = 1:1:col
    x = [];
    for j = 1:1:row
         x = [x,h(j,i)/spreadCode(1,j)];
    end
    original_message1(1,i) = sum(x)/row;
end

% original_message1(find(original_message1 < 0)) = 0; %#ok<FNDSB>
% original_message1(find(original_message1 >= 0)) = 1; %#ok<FNDSB>
res = original_message1;
