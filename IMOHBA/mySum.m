function result=mySum(x,y,M,V)
result=0;
for i=1:2:M
    x_temp=(x(V+i)+x(V+i+1))/2;
    y_temp=(y(V+i)+y(V+i+1))/2;
    result=result+abs(x_temp-y_temp);
end

