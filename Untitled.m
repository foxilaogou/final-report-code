% �����������
x1 = randn(100,1); % �Ա���1
x2 = randn(100,1); % �Ա���2
y = 2*x1 - 3*x2 + randn(100,1); % �����

% ������ƾ���
X = [ones(100,1), x1, x2]; % ��ӽؾ���

% ����ع�ϵ��
b = inv(X'*X)*X'*y;

% ����в�
e = y - X*b;

% ����ع�ƽ���͡��в�ƽ���͡���ƽ����
SST = sum((y-mean(y)).^2);
SSR = sum((X*b-mean(y)).^2);
SSE = sum(e.^2);

% �������ɶȡ������Fͳ������pֵ
dfR = size(X,2)-1;
dfE = size(X,1)-size(X,2);
MSR = SSR/dfR;
MSE = SSE/dfE;
F = MSR/MSE;
pval = 1-fcdf(F,dfR,dfE);

% ����ع�ϵ����R2��Fͳ��������pֵ
disp(['Coefficients: ', num2str(b')]);
disp(['R-squared: ', num2str(1-SSE/SST)]);
disp(['F-statistic: ', num2str(F), ' with p-value: ', num2str(pval)]);
% �����Ԫ���Իع�ϵ��
[b, bint, r, rint, stats] = regress(y,X);

% ���Ʋв�ֲ�ͼ
figure;
plot(r, 'o');
title('Residual Plot');
xlabel('Observation Number');
ylabel('Residuals');

% ������̬�Լ���
[h, p] = chi2gof(r);
if h == 0
    disp('�в���ͨ����̬�Լ���');
else
    disp('�в���δͨ����̬�Լ���');
end

nftool %%��BP�����繤����

a = error.';
