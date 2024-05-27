
%%% Designed and Developed by Dr. Gaurav Dhiman (http://dhimangaurav.com/) %%%

clear all 
clc
SearchAgents=30; 
Fun_name='F1';  
Max_iterations=1000; 
[lowerbound,upperbound,dimension,fitness]=fun_info(Fun_name);
[Best_score,Best_pos,SOA_curve]=soa(SearchAgents,Max_iterations,lowerbound,upperbound,dimension,fitness);


figure('Position',[500 500 660 290])

subplot(1,2,1);
func_plot(Fun_name);
title('Objective space')
xlabel('x_1');
ylabel('x_2');
zlabel([Fun_name,'( x_1 , x_2 )'])

subplot(1,2,2);
plots=semilogx(SOA_curve,'Color','r');
set(plots,'linewidth',2)
hold on
title('Objective space')
xlabel('Iterations');
ylabel('Best score');

axis tight
grid on
box on
legend('SOA')

display(['The best solution obtained by SOA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by SOA is : ', num2str(Best_score)]);

        