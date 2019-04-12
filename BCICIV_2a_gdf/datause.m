%         dire=strcat('tCzsessiontask1NAN.mat');  
%         dire2=strcat('tCzsessiontask2NAN.mat');
%         dire3=strcat('tCzsessiontask3NAN.mat');
%         dire4=strcat('tCzsessiontask4NAN.mat');
%         task1=load(dire);
%         task2=load(dire2);
%         task3=load(dire3);
%         task4=load(dire4);
%         target=load('BCIIVtwiceCz.mat');
%         for k=0:length(task1.u)-1
%             num=length(task1.u)-k;
%             target.Cz1sessiontask1(task1.u(num),:)=[];
%             Czsessiontask1=target.Cz1sessiontask1;
%         end       
%         for k=0:length(task2.u)-1
%             num2=length(task2.u)-k;
%             target.Cz2sessiontask2(task2.u(num2),:)=[];
%             Czsessiontask2=target.Cz2sessiontask2;
%         end
%         for k=0:length(task3.u)-1
%             num3=length(task3.u)-k;
%             target.Cz3sessiontask3(task3.u(num3),:)=[];
%             Czsessiontask3=target.Cz3sessiontask3;
%         end
%         for k=0:length(task4.u)-1
%             num4=length(task4.u)-k;
%             target.Cz4sessiontask4(task4.u(num4),:)=[];
%             Czsessiontask4=target.Cz4sessiontask4;
%         end
for i=3:4
        adire=strcat('C',num2str(i),'sessiontask1NAN.mat');  
        adire2=strcat('C',num2str(i),'sessiontask2NAN.mat');
        adire3=strcat('C',num2str(i),'sessiontask3NAN.mat');
        adire4=strcat('C',num2str(i),'sessiontask4NAN.mat');
        atask1=load(adire);
        atask2=load(adire2);
        atask3=load(adire3);
        atask4=load(adire4);
        lr=[atask1.u;atask2.u;atask3.u;atask4.u];
        lr=sort(lr);
        lr=unique(lr);
        atarget=load(strcat('BCIIVfirstC',num2str(i),'.mat'));
        for k=0:length(lr)-1
            anum=length(lr)-k;
            if i==3
            atarget.C3sessiontask1(lr(anum),:)=[];
            C3sessiontask1=atarget.C3sessiontask1;
            else
                 atarget.C4sessiontask1(lr(anum),:)=[];
                  C4sessiontask1=atarget.C4sessiontask1;
            end
        end
        for k=0:length(lr)-1
            anum2=length(lr)-k;
            if i==3
            atarget.C3sessiontask2(lr(anum2),:)=[];
            C3sessiontask2=atarget.C3sessiontask2;
            else
                 atarget.C4sessiontask2(lr(anum2),:)=[];
            C4sessiontask2=atarget.C4sessiontask2;
            end
        end
        for k=0:length(lr)-1
            anum3=length(lr)-k;
            if i==3   
            atarget.C3sessiontask3(lr(anum3),:)=[];
            C3sessiontask3=atarget.C3sessiontask3;
            else 
                 atarget.C4sessiontask3(lr(anum3),:)=[];
            C4sessiontask3=atarget.C4sessiontask3;
            end
        end
        for k=0:length(lr)-1
            anum4=length(lr)-k;
            if i==3
            atarget.C3sessiontask4(lr(anum4),:)=[];
            C3sessiontask4=atarget.C3sessiontask4;
            else
                atarget.C4sessiontask4(lr(anum4),:)=[];
            C4sessiontask4=atarget.C4sessiontask4;
            end
        end
        name=strcat('BCIfirstC',num2str(i),'.mat');
        v1=strcat('C',num2str(i),'sessiontask1');
        v2=strcat('C',num2str(i),'sessiontask2');
        v3=strcat('C',num2str(i),'sessiontask3');
        v4=strcat('C',num2str(i),'sessiontask4');
        save(name,v1,v2,v3,v4);
end
