function res = spreadSpectrum(msgcode,spreadCode)
% spreadSpectrum can be used for more than 1 user
% 
% [row_userCode,col_userCode] = size(userCode);
% [row_spreadCode,col_spreadCode] = size(spreadCode);
% % each row of spread code represents for one user
% % the colomn of user code the information for transmission
% 
% if row_spreadCode < row_userCode
%     error('The row of spread code can not smaller than the row of user code.');
% end
% 
% % res = int8(zeros(row_userCode,col_userCode * col_spreadCode));
% res = zeros(row_userCode,col_userCode * col_spreadCode);
% for j = 1:1:col_userCode
%     res(1,(j-1)*col_spreadCode+1:j*col_spreadCode) = userCode(1,j).*spreadCode(1,:); 
% end

% res = kron(userCode,spreadCode); % same result
res = kron(spreadCode,msgcode);
% % spread spectrum for each user
% for i = 1:1:row_userCode
%     for j = 1:1:col_userCode
%         res(i,(j-1)*col_spreadCode+1:j*col_spreadCode) = userCode(i,j).*spreadCode(i,:);
%     end
% end