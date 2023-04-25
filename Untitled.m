% 生成随机数据
x1 = randn(100,1); % 自变量1
x2 = randn(100,1); % 自变量2
y = 2*x1 - 3*x2 + randn(100,1); % 因变量

% 构建设计矩阵
X = [ones(100,1), x1, x2]; % 添加截距项

% 计算回归系数
b = inv(X'*X)*X'*y;

% 计算残差
e = y - X*b;

% 计算回归平方和、残差平方和、总平方和
SST = sum((y-mean(y)).^2);
SSR = sum((X*b-mean(y)).^2);
SSE = sum(e.^2);

% 计算自由度、均方差、F统计量、p值
dfR = size(X,2)-1;
dfE = size(X,1)-size(X,2);
MSR = SSR/dfR;
MSE = SSE/dfE;
F = MSR/MSE;
pval = 1-fcdf(F,dfR,dfE);

% 输出回归系数、R2、F统计量及其p值
disp(['Coefficients: ', num2str(b')]);
disp(['R-squared: ', num2str(1-SSE/SST)]);
disp(['F-statistic: ', num2str(F), ' with p-value: ', num2str(pval)]);
% 计算多元线性回归系数
[b, bint, r, rint, stats] = regress(y,X);

% 绘制残差分布图
figure;
plot(r, 'o');
title('Residual Plot');
xlabel('Observation Number');
ylabel('Residuals');

% 进行正态性检验
[h, p] = chi2gof(r);
if h == 0
    disp('残差量通过正态性检验');
else
    disp('残差量未通过正态性检验');
end

nftool %%打开BP神经网络工具箱

a = error.';
