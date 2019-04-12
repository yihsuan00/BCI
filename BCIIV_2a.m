
for l=1:9 
 C3temp=zeros(288,2200);
 C4temp=zeros(288,2200);
 Cztemp=zeros(288,2200);
 dire=strcat('C:\Users\wu\Desktop\Brain Computer Interaction\2018 paper\BCICIV_2a_gdf\A0',int2str(l),'E.gdf');
 dirr=strcat('C:\Users\wu\Desktop\Brain Computer Interaction\2018 paper\BCICIV_2a_gdf\A0',int2str(l),'E.mat'); 
%  dire2=strcat('C:\Users\wu\Desktop\Brain Computer Interaction\2018 paper\BCICIV_2a_gdf\A0',int2str(l),'T.gdf');
 [s,HDR]=sload(dire,0,'OVERFLOWDETECTION:OFF');
 table=load(dirr);
%  [s1,HDK]=sload(dire2,0,'OVERFLOWDETECTION:OFF');
 B=s(HDR.TRIG(1):length(s),:);
 C3=B(:,8);
 Cz=B(:,10);
 C4=B(:,12);
 
%分session紀錄
 for i =1:length(HDR.TRIG)-1
    a=HDR.TRIG(i+1)-HDR.TRIG(1);
    b=HDR.TRIG(i)-HDR.TRIG(1)+1;
    temp=C3(b:a);
    temp2=C4(b:a);
    temp3=Cz(b:a);
    for j=1:length(temp)
        C3temp(i,j)=temp(j);
    end
     for j=1:length(temp2)
        C4temp(i,j)=temp2(j);
    end
     for j=1:length(temp3)
        Cztemp(i,j)=temp3(j);
     end
 end
  t=C3(HDR.TRIG(288)-HDR.TRIG(1)+1:end);
  for k=1:length(C3(HDR.TRIG(288)-HDR.TRIG(1)+1:end))
    C3temp(288,k)=t(k);
  end
  t1=C4(HDR.TRIG(288)-HDR.TRIG(1)+1:end);
  for k=1:length(C4(HDR.TRIG(288)-HDR.TRIG(1)+1:end))
    C4temp(288,k)=t(k);
  end
  t2=Cz(HDR.TRIG(288)-HDR.TRIG(1)+1:end);
  for k=1:length(Cz(HDR.TRIG(288)-HDR.TRIG(1)+1:end))
    Cztemp(288,k)=t(k);
  end
%幫task進行分類
  C3session=zeros(288,2328);
  C4session=zeros(288,2328);
  Czsession=zeros(288,2328);
  h=1;h1=73;h2=145;h3=217;
  for i =1:288
    if table.classlabel(i)==1
        C3session(h,:)=C3temp(i,:);
        C4session(h,:)=C4temp(i,:);
        Czsession(h,:)=Cztemp(i,:);
        h=h+1;
    end
     if table.classlabel(i)==2
        C3session(h1,:)=C3temp(i,:);
        C4session(h1,:)=C4temp(i,:);
        Czsession(h1,:)=Cztemp(i,:);
        h1=h1+1;
     end
     if table.classlabel(i)==3
        C3session(h2,:)=C3temp(i,:);
        C4session(h2,:)=C4temp(i,:);
        Czsession(h2,:)=Cztemp(i,:);
        h2=h2+1;
     end
     if table.classlabel(i)==4
        C3session(h3,:)=C3temp(i,:);
        C4session(h3,:)=C4temp(i,:);
        Czsession(h3,:)=Cztemp(i,:);
        h3=h3+1;
     end
        
  end
 C3NAN=findnan(C3session);
 C4NAN=findnan(C4session);
 CzNAN=findnan(Czsession);
 name=strcat('BCICIV_2a_A0',int2str(l),'T.mat');
 save(name,'C3session','C4session','Czsession','C3NAN','C4NAN','CzNAN');
end





    
