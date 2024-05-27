% 定义系数矩阵A和常数向量b  
A = [1, -2, 2; -1, 1, -1; -2, -2, 1];  
b = [-12; 0; 10];  
  
% 初始解向量x0  
x0 = [0; 0; 0];  
  
% 收敛精度tol  
tol = 1/2 * 10^(-3);  
  
% 调用雅可比迭代法函数  
[x, iter_count] = jacobi_iteration(A, b, x0, tol);  
  
% 输出结果  
disp('解向量x：');  
disp(x);  
disp(['迭代次数：' num2str(iter_count)]);
function [x, iter_count] = jacobi_iteration(A, b, x0, tol)  
    % A: 系数矩阵  
    % b: 常数向量  
    % x0: 初始解向量  
    % tol: 收敛精度  
      
    % 获取矩阵的大小  
    [n, ~] = size(A);  
      
    % 初始化解向量和迭代计数器  
    x = x0;  
    iter_count = 0;  
      
    % 迭代过程  
    while true  
        x_old = x;  
          
        % 根据雅可比迭代公式更新解向量  
        for i = 1:n  
            sum_j = 0;  
            for j = 1:n  
                if j ~= i  
                    sum_j = sum_j + A(i, j) * x_old(j);  
                end  
            end  
            x(i) = (b(i) - sum_j) / A(i, i);  
        end  
          
        % 检查收敛条件  
        if norm(x - x_old, inf) <= tol  
            break;  
        end  
          
        % 更新迭代计数器  
        iter_count = iter_count + 1;  
    end  
end  
  
