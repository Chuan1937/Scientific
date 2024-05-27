% 定义系数矩阵和常数向量
A = [2, 1, 1; 1, 1, 1; 1, 1, 2];
b = [0; 3; 1];

% 定义初始解向量和迭代误差阈值
x0 = [0; 0; 0];
epsilon = 0.5e-3;

% 初始化迭代误差和迭代次数
error = Inf;
k = 0;

while error > epsilon
    % 计算下一次迭代的近似解
    x_next = zeros(size(x0));
    for i = 1:length(x0)
        x_next(i) = (b(i) - A(i, 1:i-1) * x_next(1:i-1) - A(i, i+1:end) * x0(i+1:end)) / A(i, i);
    end
    
    % 更新迭代误差和解向量
    error = norm(x_next - x0, Inf);
    x0 = x_next;
    
    % 增加迭代次数
    k = k + 1;
end

% 输出最终结果
disp(['迭代次数：', num2str(k)]);
disp(['近似解：', num2str(x0')]);
