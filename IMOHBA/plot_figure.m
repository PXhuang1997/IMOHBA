function plot_figure(name,chromosome,nObj, nVar,runs)

pop=size(chromosome,1);
if nObj==4
    figure(1);
    
    plot(chromosome(:,nVar + 1),chromosome(:,nVar + 3),'g.');
    grid on
    hold on
    plot(chromosome(:,nVar + 2),chromosome(:,nVar + 4),'r.');
    grid on
    for i=1:pop
        
        if chromosome(i,nVar + 2)-chromosome(i,nVar + 1)>0&chromosome(i,nVar + 4)-chromosome(i,nVar + 3)>0
            rectangle('position',[chromosome(i,nVar + 1),chromosome(i,nVar + 3),chromosome(i,nVar + 2)-chromosome(i,nVar + 1),chromosome(i,nVar + 4)-chromosome(i,nVar + 3)]);
            grid on
        end
    end

    title([name])
    hold off
    
    filename1=['outputImage\',name,'\',];
    filename2=[name,'_',num2str(runs),'_1'];
    filename=[filename1,filename2,'.fig'];
    savefig(filename);

    figure(2);

    fit=ptrue(name,nVar);
    plot(fit(:,1),fit(:,2),'r-');
    for i=1:pop
        if chromosome(i,nVar + 2)-chromosome(i,nVar + 1)>0&chromosome(i,nVar + 4)-chromosome(i,nVar + 3)>0
            rectangle('position',[chromosome(i,nVar + 1),chromosome(i,nVar + 3),chromosome(i,nVar + 2)-chromosome(i,nVar + 1),chromosome(i,nVar + 4)-chromosome(i,nVar + 3)]);
            grid on
            hold on
        end      
    end
    title(name)
    
    hold off
    
    filename1=['outputImage\',name,'\'];
    filename2=[name,'_',num2str(runs),'_2'];
    filename=[filename1,filename2,'.fig'];
    savefig(filename);
   
    figure(3)
    plot(chromosome(:,nVar + 1),chromosome(:,nVar + 3),'g.');
    grid on
    hold on
    plot(chromosome(:,nVar + 2),chromosome(:,nVar + 4),'r.');
    grid on
    hold off
    title(name)
    hold off
    
    filename1=['outputImage\',name,'\'];
    filename2=[name,'_',num2str(runs),'_3'];
    filename=[filename1,filename2,'.fig'];
    savefig(filename);
   
    
elseif nObj==6
    
    figure(1);
    plot3(chromosome(:,nVar + 1),chromosome(:,nVar + 3),chromosome(:,nVar + 5),'g*');
    grid on
    hold on
    plot3(chromosome(:,nVar + 2),chromosome(:,nVar + 4),chromosome(:,nVar + 6),'r*');
    grid on
    title([name])
    hold off
    
    filename1=['outputImage\',name,'\'];
    filename2=[name,'_',num2str(runs),'_1'];
    filename=[filename1,filename2,'.fig'];
    savefig(filename);
    
    figure(2);

    fit=ptrue(name,nVar);
    plot3(fit(:,1),fit(:,2),fit(:,3),'r-');
    grid on
    hold on 
    for i=1:pop
        if chromosome(i,nVar + 2)-chromosome(i,nVar + 1)>0&chromosome(i,nVar + 4)-chromosome(i,nVar + 3)>0
            plotcube([chromosome(i,nVar + 2)-chromosome(i,nVar + 1),chromosome(i,nVar + 4)-chromosome(i,nVar + 3),chromosome(i,nVar + 6)-chromosome(i,nVar + 5)],[chromosome(i,nVar + 1),chromosome(i,nVar + 3),chromosome(i,nVar + 5)],0.01,[1,1,1]);
            %rectangle('position',[chromosome(i,nVar + 1),chromosome(i,nVar + 3),chromosome(i,nVar + 2)-chromosome(i,nVar + 1),chromosome(i,nVar + 4)-chromosome(i,nVar + 3)]);
            grid on
            
        end
    end
    title([name])
    hold off
 
    filename1=['outputImage\',name,'\'];
    filename2=[name,'_',num2str(runs),'_2'];
    filename=[filename1,filename2,'.fig'];
    savefig(filename);
end

