


function indices=metric(chromosome, nObj, nVar, ybounds,k)
%indices(1:4)分别存放分布度（SP），延展度（D），最好超体积（BHV）及不确定度值（I）
npop=size(chromosome,1);%用于计算性能指标归档集的规模/个体数。
sp=spp(chromosome,nObj, nVar)
yz=yanzhan(chromosome, nObj, nVar)
% indices=[];
indices.sp(k)=sp;
indices.yz(k)=yz;


%%%最好及最差超体积*********************************
if nObj==4  %目标函数为2个时的计算指标的方法
    hv=[];
    % ybounds=[10^7,5*10^4];
    nrOfSamples=10000;
    points=[];
    points(:,1)=chromosome(:,nVar+1);
    points(:,2)=chromosome(:,nVar+3);
    hv(1) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    
    points(:,1)=chromosome(:,nVar+2);
    points(:,2)=chromosome(:,nVar+4);
    hv(2) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    if hv(2)<=hv(1)
        hv(3)=hv(1);
        hv(4)=hv(2);
        hv(1)=hv(4);
        hv(2)=hv(3);
    end
    hv=hv(1:2);
    indices.whv(k)=hv(1);
    indices.bhv(k)=hv(2);%最好超体积
    
    
%%%%%%%%不确定度：各目标函数值区间长度和
    imprecise=0; 
    for i=1:npop
        imprecise=imprecise+abs((chromosome(i,nVar + 2)-chromosome(i,nVar + 1)))+...
        abs((chromosome(i,nVar + 4)-chromosome(i,nVar + 3)));
    end

%     ave_imprecise=imprecise/pop
    indices.im(k)=imprecise;
    
elseif nObj==6 % %目标函数为3个时的计算指标的方法
    
    
%%%最好及最差超体积*********************************
    hv=[];    
    nrOfSamples=10000;
    points=[];
    points(:,1)=chromosome(:,nVar+1);
    points(:,2)=chromosome(:,nVar+3);
    points(:,3)=chromosome(:,nVar+5);
    hv(1) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    points(:,1)=chromosome(:,nVar+2);
    points(:,2)=chromosome(:,nVar+4);
    points(:,3)=chromosome(:,nVar+6);
    hv(2) = zhypeIndicatorSampled( points, ybounds, nrOfSamples);
    if hv(2)<=hv(1)
        hv(3)=hv(1);
        hv(4)=hv(2);
        hv(1)=hv(4);
        hv(2)=hv(3);
    end
  hv=hv(1:2);
    indices.whv(k)=hv(1);
    indices.bhv(k)=hv(2);%最好超体积  
    
    
 %%%%%%%%不确定度：各目标函数值区间长度和
    imprecise=0;
    for i=1:npop
        imprecise=imprecise+abs((chromosome(i,nVar + 2)-chromosome(i,nVar + 1)))+...
        abs((chromosome(i,nVar + 4)-chromosome(i,nVar + 3)))+abs((chromosome(i,nVar + 6)-chromosome(i,nVar + 5)));
    end
%     ave_imprecise=imprecise/pop;
    indices.im(k)=imprecise;
    
end

    

