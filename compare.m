function compare(EsN0,ber)
% figure()
% plot(EsN0,ber,"o");
% %semilogy(EsN0,ber,"o");
[x,~] = size(ber);
hold off
legen = [];
for i = 1:1:x
    leg = num2str(i);
    legen = [legen;leg];
end
for i = 1:1:x
    plot(EsN0,ber(i,:));
    hold on
end
title("256-QAM�ز������ź���AWGN�ŵ��µ������������")
xlabel("EsN0");
ylabel("�������");
legend(legen);
