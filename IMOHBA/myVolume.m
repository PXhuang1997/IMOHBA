function result=myVolume(x,M,V)
result=1;
for i=1:2:M
    x_temp1=x(V+i);
    x_temp2=x(V+i+1);
    result=result*(x_temp2-x_temp1);
end

