    C3sessiontask1=zeros(288,2328);
    C3sessiontask2=zeros(288,2328);
    C3sessiontask3=zeros(288,2328);
    C3sessiontask4=zeros(288,2328);
    C4sessiontask1=zeros(288,2328);
    C4sessiontask2=zeros(288,2328);
    C4sessiontask3=zeros(288,2328);
    C4sessiontask4=zeros(288,2328);
    Czsessiontask1=zeros(288,2328);
    Czsessiontask2=zeros(288,2328);
    Czsessiontask3=zeros(288,2328);
    Czsessiontask4=zeros(288,2328);
%     C31sessiontask1=zeros(288,2328);
%     C32sessiontask2=zeros(288,2328);
%     C33sessiontask3=zeros(288,2328);
%     C34sessiontask4=zeros(288,2328);
%     C41sessiontask1=zeros(288,2328);
%     C42sessiontask2=zeros(288,2328);
%     C43sessiontask3=zeros(288,2328);
%     C44sessiontask4=zeros(288,2328);
%     Cz1sessiontask1=zeros(288,2328);
%     Cz2sessiontask2=zeros(288,2328);
%     Cz3sessiontask3=zeros(288,2328);
%     Cz4sessiontask4=zeros(288,2328);
for l=1:9 
    dire=strcat('C:\Users\wu\Desktop\Brain Computer Interaction\2018 paper\BCICIV_2a_gdf\A0',int2str(l),'E.gdf'); 
    dirr=strcat('C:\Users\wu\Desktop\Brain Computer Interaction\2018 paper\BCICIV_2a_gdf\A0',int2str(l),'E.mat'); 
    [tr,Hug]=sload(dire,0,'OVERFLOWDETECTION:OFF');
    table=load(dirr);
%     dire2=strcat('C:\Users\wu\Desktop\Brain Computer Interaction\2018 paper\BCICIV_2a_gdf\A0',int2str(l),'E.gdf');
%     [tr1,H]=sload(dire2,0,'OVERFLOWDETECTION:OFF');
    B=tr(Hug.TRIG(1):length(tr),:);
    C3=B(:,8);
    Cz=B(:,10);
    C4=B(:,12);
    C3session=zeros(288,2200);
    C4session=zeros(288,2200);
    Czsession=zeros(288,2200);
    %分session紀錄
    for i =1:length(Hug.TRIG)-1
        a=Hug.TRIG(i+1)-Hug.TRIG(1);
        b=Hug.TRIG(i)-Hug.TRIG(1)+1;
        atemp=C3(b:a);
        atemp2=C4(b:a);
        atemp3=Cz(b:a);
        for j=1:length(atemp)
            C3session(i,j)=atemp(j);
        end
         for j=1:length(atemp2)
            C4session(i,j)=atemp2(j);
        end
         for j=1:length(atemp3)
            Czsession(i,j)=atemp3(j);
        end
    end
    t=C3(Hug.TRIG(288)-Hug.TRIG(1)+1:end);
    for k=1:length(C3(Hug.TRIG(288)-Hug.TRIG(1)+1:end))
        C3session(288,k)=t(k);
    end
    t1=C4(Hug.TRIG(288)-Hug.TRIG(1)+1:end);
    for k=1:length(C4(Hug.TRIG(288)-Hug.TRIG(1)+1:end))
        C4session(288,k)=t1(k);
    end
    t2=Cz(Hug.TRIG(288)-Hug.TRIG(1)+1:end);
    for k=1:length(Cz(Hug.TRIG(288)-Hug.TRIG(1)+1:end))
        Czsession(288,k)=t2(k);
    end
    %幫task進行分類
    h=l*72-71;h1=l*72-71;h2=l*72-71;h3=l*72-71;
    for i =1:288
        if table.classlabel(i)==1
            C3sessiontask1(h,:)=C3session(i,:);
            C4sessiontask1(h,:)=C4session(i,:);
            Czsessiontask1(h,:)=Czsession(i,:);
            h=h+1;
        end
         if table.classlabel(i)==2
            C3sessiontask2(h1,:)=C3session(i,:);
            C4sessiontask2(h1,:)=C4session(i,:);
            Czsessiontask2(h1,:)=Czsession(i,:);
            h1=h1+1;
         end
         if table.classlabel(i)==3
            C3sessiontask3(h2,:)=C3session(i,:);
            C4sessiontask3(h2,:)=C4session(i,:);
            Czsessiontask3(h2,:)=Czsession(i,:);
            h2=h2+1;
         end
         if table.classlabel(i)==4
            C3sessiontask4(h3,:)=C3session(i,:);
            C4sessiontask4(h3,:)=C4session(i,:);
            Czsessiontask4(h3,:)=Czsession(i,:);
            h3=h3+1;
        end

    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     B1=tr1(H.TRIG(1):length(tr1),:);
%     C31=B1(:,8);
%     Cz1=B1(:,10);
%     C41=B1(:,12);
%     C3session1=zeros(288,2200);
%     C4session1=zeros(288,2200);
%     Czsession1=zeros(288,2200);
%     %分session紀錄
%     for i =1:length(H.TRIG)-1
%         a=H.TRIG(i+1)-H.TRIG(1);
%         b=H.TRIG(i)-H.TRIG(1)+1;
%         atempr=C31(b:a);
%         atemp2r=C41(b:a);
%         atemp3r=Cz1(b:a);
%         for j=1:length(atempr)
%             C3session1(i,j)=atempr(j);
%         end
%          for j=1:length(atemp2r)
%             C4session1(i,j)=atemp2r(j);
%         end
%          for j=1:length(atemp3r)
%             Czsession1(i,j)=atemp3r(j);
%         end
%     end
%     tk=C31(H.TRIG(288)-H.TRIG(1)+1:end);
%     for k=1:length(C3(H.TRIG(288)-H.TRIG(1)+1:end))
%         C3session1(288,k)=tk(k);
%     end
%     t11=C41(H.TRIG(288)-H.TRIG(1)+1:end);
%     for k=1:length(C4(H.TRIG(288)-H.TRIG(1)+1:end))
%         C4session1(288,k)=t11(k);
%     end
%     t21=Cz(H.TRIG(288)-H.TRIG(1)+1:end);
%     for k=1:length(Cz(H.TRIG(288)-H.TRIG(1)+1:end))
%         Czsession1(288,k)=t21(k);
%     end
%     %幫task進行分類
%     hh=l*72-71;hh1=l*72-71;hh2=l*72-71;hh3=l*72-71;
%     for i =1:288
%         if Hug.Classlabel(i)==1
%             C31sessiontask1(hh,:)=C3session1(i,:);
%             C41sessiontask1(hh,:)=C4session1(i,:);
%             Cz1sessiontask1(hh,:)=Czsession1(i,:);
%             hh=hh+1;
%         end
%          if Hug.Classlabel(i)==2
%             C32sessiontask2(hh1,:)=C3session1(i,:);
%             C42sessiontask2(hh1,:)=C4session1(i,:);
%             Cz2sessiontask2(hh1,:)=Czsession1(i,:);
%             hh1=hh1+1;
%          end
%          if Hug.Classlabel(i)==3
%             C33sessiontask3(hh2,:)=C3session1(i,:);
%             C43sessiontask3(hh2,:)=C4session1(i,:);
%             Cz3sessiontask3(hh2,:)=Czsession1(i,:);
%             hh2=hh2+1;
%          end
%          if Hug.Classlabel(i)==4
%             C34sessiontask4(hh3,:)=C3session1(i,:);
%             C44sessiontask4(hh3,:)=C4session1(i,:);
%             Cz4sessiontask4(hh3,:)=Czsession1(i,:);
%             hh3=hh3+1;
%         end
% 
%     end
    save('BCIIVtwiceC3.mat','C3sessiontask1','C3sessiontask2','C3sessiontask3','C3sessiontask4');
    save('BCIIVtwiceC4.mat','C4sessiontask1','C4sessiontask2','C4sessiontask3','C4sessiontask4');
    save('BCIIVtwiceCz.mat','Czsessiontask1','Czsessiontask2','Czsessiontask3','Czsessiontask4');
%     save('BCIIVtwiceC3.mat','C31sessiontask1','C32sessiontask2','C33sessiontask3','C34sessiontask4');
%     save('BCIIVtwiceC4.mat','C41sessiontask1','C42sessiontask2','C43sessiontask3','C44sessiontask4');
%     save('BCIIVtwiceCz.mat','Cz1sessiontask1','Cz2sessiontask2','Cz3sessiontask3','Cz4sessiontask4');
end
%     