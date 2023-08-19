


function indices=metric(chromosome, nObj, nVar, ybounds,k)
%indices(1:4)�ֱ��ŷֲ��ȣ�SP������չ�ȣ�D������ó������BHV������ȷ����ֵ��I��
npop=size(chromosome,1);%���ڼ�������ָ��鵵���Ĺ�ģ/��������
sp=spp(chromosome,nObj, nVar)
yz=yanzhan(chromosome, nObj, nVar)
% indices=[];
indices.sp(k)=sp;
indices.yz(k)=yz;


%%%��ü������*********************************
if nObj==4  %Ŀ�꺯��Ϊ2��ʱ�ļ���ָ��ķ���
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
    indices.bhv(k)=hv(2);%��ó����
    
    
%%%%%%%%��ȷ���ȣ���Ŀ�꺯��ֵ���䳤�Ⱥ�
    imprecise=0; 
    for i=1:npop
        imprecise=imprecise+abs((chromosome(i,nVar + 2)-chromosome(i,nVar + 1)))+...
        abs((chromosome(i,nVar + 4)-chromosome(i,nVar + 3)));
    end

%     ave_imprecise=imprecise/pop
    indices.im(k)=imprecise;
    
elseif nObj==6 % %Ŀ�꺯��Ϊ3��ʱ�ļ���ָ��ķ���
    
    
%%%��ü������*********************************
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
    indices.bhv(k)=hv(2);%��ó����  
    
    
 %%%%%%%%��ȷ���ȣ���Ŀ�꺯��ֵ���䳤�Ⱥ�
    imprecise=0;
    for i=1:npop
        imprecise=imprecise+abs((chromosome(i,nVar + 2)-chromosome(i,nVar + 1)))+...
        abs((chromosome(i,nVar + 4)-chromosome(i,nVar + 3)))+abs((chromosome(i,nVar + 6)-chromosome(i,nVar + 5)));
    end
%     ave_imprecise=imprecise/pop;
    indices.im(k)=imprecise;
    
end

    

