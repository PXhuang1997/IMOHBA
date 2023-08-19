function width=myIntersect(A,B)
if(A(2)<=B(1)||B(2)<=A(1))
    width=0;
else
    lb=max(A(1),B(1));
    ub=min(A(2),B(2));
    width=ub-lb;
end