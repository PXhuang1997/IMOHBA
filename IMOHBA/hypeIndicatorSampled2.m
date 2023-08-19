% HYPEINDICATORSAMPLED calculates the HypE fitness of maximum problem
%   HYPEINDICATORSAMPLED( POINTS, BOUNDS, K, NROFSAMPLES  ) 
%   samples the HypE fitness values for objective vectors POINTS. 
%
%   POINTS:      objective vectors as rows, all to be minimized
%   BOUNDS:      reference point
%   K:           parameter of HypE
%   NROFSAMPLES: nr of samples to be used
%
%   Example: f =  hypeIndicatorExact( [1 3; 3 1], [4 4], 1, 10000 )

function F = hypeIndicatorSampled2( points, bounds, k, nrOfSamples)
    [nrP, dim] = size(points); %nrp is the population size and dim is the number of objective functions
    F = zeros(1,nrP);
    
    alpha = zeros(1,nrP);
    for i = 1 : k
        j = 1:i-1;
        alpha(i) = prod( (k-j) ./ (nrP - j ) )./i;  %Calculate alfa value
    end  
    
    
    if( length(bounds) == 1 )
        bounds = repmat( bounds,1, dim );   
    end
    
    BoxL = max(points);
    
    S = rand(nrOfSamples,dim)*diag(BoxL-bounds) ...
    + ones( nrOfSamples,dim)*diag(bounds);   %Random sampling over the sampling space

    dominated = zeros( nrOfSamples, 1 );
    for j = 1 : nrP
        B = repmat(points(j,:),nrOfSamples,1)-S;
        ind = find( sum( B >= 0, 2) == dim);  %sum( B >= 0, 2) == dimindicates that it is dominated by j points
        dominated(ind) = dominated(ind) + 1; %Number of times each sampling point was occupied
    end
    
    for j = 1 : nrP
        B = repmat(points(j,:),nrOfSamples,1)-S;
        ind = find( sum( B >= 0, 2) == dim);
        x = dominated(ind);        
        F(j) = sum(  alpha(x)  );
    end    
    F = F'*prod(BoxL-bounds)/nrOfSamples;
    

    