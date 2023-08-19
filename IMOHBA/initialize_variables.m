function f = initialize_variables(name,N, M, V, min_range, max_range)

%% function f = initialize_variables(N, M, V, min_tange, max_range) 
% This function initializes the individual. Each individual has the
% following at this stage  
%       * set of decision variables
%       * objective function values
% where,
% N - Population size
% M - Number of objective functions
% V - Number of decision variables
% min_range - A vector of decimal values which indicate the minimum value
% for each decision variable.
% max_range - Vector of maximum possible values for decision variables.
min = min_range;
max = max_range;
% K is the total number of array elements. For ease of computation decision
% variables and objective functions are concatenated to form a single array. 
K = M + V;
%% Initialize each individual
% For each individual perform the following (N is the population size)
for i = 1 : N
    % Initialize the decision variables based on the minimum and maximum
    % possible values. V is the number of decision variable. A random
    % number is picked between the minimum and maximum possible values for
    % the each decision variable.
    for j = 1 : V
        f(i,j) = (min(j) + (max(j) - min(j))*rand(1));
    end
    % For ease of computation and handling data the individual also has the
    % vlaue of the objective function concatenated at the end. The elements
    % V + 1 to K has the objective function valued. 
    % The function evaluate_objective takes one individual at a time,
    % in fact only the decision variables are passed to the function along
    % with information about the number of objective functions which are
    % processed and returns the value for the objective functions. These
    % values are now stored at the end of the individual itself.
    f(i,V + 1: K) = (evaluate_objective(name,f(i,:), M, V));
end










