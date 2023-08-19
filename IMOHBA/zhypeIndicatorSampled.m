%   Example: f =  hypeIndicatorExact( [1 3; 3 1], [4 4], 1, 10000 )
function F = zhypeIndicatorSampled( points, bounds, nrOfSamples)
% points=[1 3; 3 1];
% bounds=[4 4];
%bounds=[2 2 2 2 2 2 2 2 2 2];%dtlz2
%bounds=[1.2 1.2 1.2 1.2 1.2 1.2 1.2 1.2 1.2 100];%dtlz7
%bounds=[5 5 5 5 5];
%bounds=[2000 2000 2000 2000 2000 2000 2000 2000 2000 2000];%dtlz3
% k=2;
% nrOfSamples=10000;
[nrP, dim] = size(points);%nrP is the number of individuals, dim is the objective dimensionnr
k=nrP;
F = zeros(1,nrP);%Generate a 0 matrix with 1 row and nrp columns
alpha = zeros(1,nrP);
for i = 1 : k
    j = 1:i-1;
    alpha(i) = prod( (k-j) ./ (nrP - j ) )./i;
end
if( length(bounds) == 1 )
    bounds = repmat( bounds,1, dim );
end
BoxL = min(points);%Find the minimum value on each objective
S = rand(nrOfSamples,dim)*diag( bounds - BoxL) ...
    + ones( nrOfSamples,dim)*diag(BoxL);
dominated = zeros( nrOfSamples, 1 );
for j = 1 : nrP
    B = S - repmat(points(j,:),nrOfSamples,1);
    ind = find( sum( B >= 0, 2) == dim);
    dominated(ind) = dominated(ind) + 1;
end
for j = 1 : nrP
    B = S - repmat(points(j,:),nrOfSamples,1);
    ind = find( sum( B >= 0, 2) == dim);
    x = dominated(ind);
    F(j) = sum(  alpha(x)  );
end
F = sum(F'*prod( bounds - BoxL)/nrOfSamples);%The hypervolume of the solution set
