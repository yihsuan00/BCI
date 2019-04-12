for i=1:4
    adire=strcat('tC3sessiontask',num2str(i),'NAN.mat');
    adire2=strcat('tC4sessiontask',num2str(i),'NAN.mat');
    adire3=strcat('tCzsessiontask',num2str(i),'NAN.mat');
    atask1=load(adire);
    atask2=load(adire2);
    atask3=load(adire3);
    lr=[atask1.u;atask2.u;atask3.u];
    lr=sort(lr);
    lr=unique(lr);
    atarget1=load(strcat('BCIIVtwiceC3','.mat'));
    atarget2=load(strcat('BCIIVtwiceC4.mat'));
    atarget3=load(strcat('BCIIVtwiceCz.mat'));
    for k=0:length(lr)-1
        anum=length(lr)-k;
        if i==1
            atarget1.C3sessiontask1(lr(anum),:)=[];
            atarget2.C4sessiontask1(lr(anum),:)=[];
            atarget3.Czsessiontask1(lr(anum),:)=[];
            C3sessiontask1=atarget1.C3sessiontask1;
            C4sessiontask1=atarget2.C4sessiontask1;
            Czsessiontask1=atarget3.Czsessiontask1;
        end
        if i==2
            atarget1.C3sessiontask2(lr(anum),:)=[];
            atarget2.C4sessiontask2(lr(anum),:)=[];
            atarget3.Czsessiontask2(lr(anum),:)=[];
            C3sessiontask2=atarget1.C3sessiontask2;
            C4sessiontask2=atarget2.C4sessiontask2;
            Czsessiontask2=atarget3.Czsessiontask2;
        end
        if i==3
            atarget1.C3sessiontask3(lr(anum),:)=[];
            atarget2.C4sessiontask3(lr(anum),:)=[];
            atarget3.Czsessiontask3(lr(anum),:)=[];
            C3sessiontask3=atarget1.C3sessiontask3;
            C4sessiontask3=atarget2.C4sessiontask3;
            Czsessiontask3=atarget3.Czsessiontask3;
        end
        if i==4
            atarget1.C3sessiontask4(lr(anum),:)=[];
            atarget2.C4sessiontask4(lr(anum),:)=[];
            atarget3.Czsessiontask4(lr(anum),:)=[];
            C3sessiontask4=atarget1.C3sessiontask4;
            C4sessiontask4=atarget2.C4sessiontask4;
            Czsessiontask4=atarget3.Czsessiontask4;
        end
        
    end
    
    name=strcat('BCItwicettask',num2str(i),'.mat');
    v1=strcat('C3sessiontask',num2str(i));
    v2=strcat('C4sessiontask',num2str(i));
    v3=strcat('Czsessiontask',num2str(i));
    save(name,v1,v2,v3);
end
