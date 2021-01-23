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
title("256-QAM载波调制信号在AWGN信道下的误比特率性能")
xlabel("EsN0");
ylabel("误比特率");
legend(legen);
