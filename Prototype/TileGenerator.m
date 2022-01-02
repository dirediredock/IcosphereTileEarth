
close all; clear; clc; radiusEarth=6371;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

partition=3;
A=icosphere(partition);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Faces=A.Faces;

icoXYZ=A.Vertices;

icoX=icoXYZ(:,1)*radiusEarth;
icoY=icoXYZ(:,2)*radiusEarth;
icoZ=icoXYZ(:,3)*radiusEarth;

Points=cat(2,icoX,icoY,icoZ);

Triangles=[];

for i=1:length(Faces)
    
    trindex=Faces(i,:);
    
    pointA=Points(trindex(:,1),:);
    pointB=Points(trindex(:,2),:);
    pointC=Points(trindex(:,3),:);
    Triangle=cat(1,pointA,pointB,pointC,pointA);
    
    Triangles=cat(3,Triangles,Triangle);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[radX,radY,radius]=cart2sph(icoX,icoY,icoZ);

degX=rad2deg(radX);
degY=rad2deg(radY);

flatPoints=cat(2,degX,degY);

flatTriangles=[];

for i=1:length(Faces)
    
    trindex=Faces(i,:);
    
    pointA=flatPoints(trindex(:,1),:);
    pointB=flatPoints(trindex(:,2),:);
    pointC=flatPoints(trindex(:,3),:);
    Triangle=cat(1,pointA,pointB,pointC,pointA);
    
    flatTriangles=cat(3,flatTriangles,Triangle);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vectorX=squeeze(flatTriangles(:,1,:));
TotalY=squeeze(flatTriangles(:,2,:));

Xmax=nanmax(vectorX(:));
YmaxTotal=nanmax(TotalY(:));
YminTotal=nanmin(TotalY(:));

TheIndex=0;
        
        for i=1:length(flatTriangles)
            
            if flatTriangles(1,1,i)==Xmax || ...
               flatTriangles(2,1,i)==Xmax || ...
               flatTriangles(3,1,i)==Xmax
                
                if flatTriangles(1,1,i)<=0 || ...
                   flatTriangles(2,1,i)<=0 || ...
                   flatTriangles(3,1,i)<=0
               
                   TheIndex=cat(1,TheIndex,i);
                
                end
            end
        end
        
TheIndex(1)=[];
TheIndex=sort(TheIndex);

vectorY=[];

        for j=1:length(TheIndex)

            i=TheIndex(j);
            valuesY=flatTriangles(:,2,i);
            vectorY=cat(1,vectorY,valuesY);
        end

Ymax=nanmax(vectorY(:));
Ymin=nanmin(vectorY(:));

CapTriangles=[];
        
        for i=1:length(flatTriangles)
            
            if flatTriangles(1,2,i)==YmaxTotal || ...
               flatTriangles(2,2,i)==YmaxTotal || ...
               flatTriangles(3,2,i)==YmaxTotal
               
               Triangle=flatTriangles(:,:,i);
               CapTriangles=cat(3,CapTriangles,Triangle);
            end
        end
        
capX=CapTriangles(:,1,:);
capX=capX(:);

maxCapX=nanmax(capX);
minCapX=nanmin(capX);

CapIndex=0;
        
        for i=1:length(flatTriangles)

            if flatTriangles(1,2,i)==Ymax || ...
               flatTriangles(2,2,i)==Ymax || ...
               flatTriangles(3,2,i)==Ymax

                if flatTriangles(1,2,i)==YmaxTotal || ...
                   flatTriangles(2,2,i)==YmaxTotal || ...
                   flatTriangles(3,2,i)==YmaxTotal

                    if flatTriangles(1,1,i)==maxCapX || ...
                       flatTriangles(2,1,i)==maxCapX || ...
                       flatTriangles(3,1,i)==maxCapX

                        if flatTriangles(1,1,i)==minCapX || ...
                           flatTriangles(2,1,i)==minCapX || ...
                           flatTriangles(3,1,i)==minCapX

                            CapIndex=cat(1,CapIndex,i);
                        end
                    end
                end
            end
        end

        for i=1:length(flatTriangles)

            if flatTriangles(1,2,i)==Ymin || ...
               flatTriangles(2,2,i)==Ymin || ...
               flatTriangles(3,2,i)==Ymin

                if flatTriangles(1,2,i)==YminTotal || ...
                   flatTriangles(2,2,i)==YminTotal || ...
                   flatTriangles(3,2,i)==YminTotal

                    if flatTriangles(1,1,i)==maxCapX || ...
                       flatTriangles(2,1,i)==maxCapX || ...
                       flatTriangles(3,1,i)==maxCapX

                        if flatTriangles(1,1,i)==minCapX || ...
                           flatTriangles(2,1,i)==minCapX || ...
                           flatTriangles(3,1,i)==minCapX

                            CapIndex=cat(1,CapIndex,i);
                        end
                    end
                end
            end
        end
        
CapIndex(1)=[];
CapIndex=sort(CapIndex);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TheIndex=cat(1,TheIndex,CapIndex);
TheIndex=unique(TheIndex);

list=(1:length(Triangles))';
list=ismember(list,TheIndex);
MainIndex=double(list);
MainIndex(:,2)=1:length(MainIndex);
condition=(MainIndex(:,1)==1);
MainIndex(condition,:)=[];
MainIndex(:,1)=[];

TileFlatMain=[];

        for j=1:length(MainIndex)

            i=MainIndex(j);
            Triangle=flatTriangles(:,:,i);
            TileFlatMain=cat(3,TileFlatMain,Triangle);
        end

TileFlatEdge=[];

        for j=1:length(TheIndex)

            i=TheIndex(j);
            Triangle=flatTriangles(:,:,i);
            TileFlatEdge=cat(3,TileFlatEdge,Triangle);
        end

TileSphereMain=[];

        for j=1:length(MainIndex)

            i=MainIndex(j);
            Triangle=Triangles(:,:,i);
            TileSphereMain=cat(3,TileSphereMain,Triangle);
        end

TileSphereEdge=[];

        for j=1:length(TheIndex)

            i=TheIndex(j);
            Triangle=Triangles(:,:,i);
            TileSphereEdge=cat(3,TileSphereEdge,Triangle);
        end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ArcLine=(-180:1:180)';
ArcLine=cat(2,ArcLine,zeros(length(ArcLine),1));
radX=deg2rad(ArcLine(:,1));
radY=deg2rad(ArcLine(:,2));
[arcX,arcY,arcZ]=sph2cart(radX,radY,8000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Position',[120,60,1420,780],'Color','k'); hold on;

            plot3(arcX,arcY,arcZ,'Color','#006ec7');
            plot3(arcY,arcZ,arcX,'Color','#006ec7');
            plot3(arcZ,arcX,arcY,'Color','#006ec7');
            A=TileSphereMain;
            for i=1:length(A)
                fill3(A(:,1,i),A(:,2,i),A(:,3,i), ...
                      'c','FaceAlpha',0.25,'EdgeColor','w');
            end
            A=TileSphereEdge;
            for i=1:length(A)
                fill3(A(:,1,i),A(:,2,i),A(:,3,i), ...
                      'm','FaceAlpha',0.25,'EdgeColor','r');
            end
            set(gca,'CameraViewAngleMode','manual');
            view(-45,45); axis off;

figure('Position',[120,60,1420,780]); hold on;

            A=TileFlatMain;
            for i=1:length(A)
                fill3(A(:,1,i),A(:,2,i),A(:,1,i)*0, ...
                      'c','FaceAlpha',0.25,'EdgeColor','k');
            end
            A=TileFlatEdge;
            for i=1:length(A)
                fill3(A(:,1,i),A(:,2,i),A(:,1,i)*0+1, ...
                      'm','FaceAlpha',0.25,'EdgeColor','r');
            end
            xlim([-185,185]); ylim([-95,95]);
            view(-45,45);box on;
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd('Outputs');

string={['Tile',num2str(partition),'SphereMain']};
        save(string{1},'TileSphereMain','-v7.3');
string={['Tile',num2str(partition),'SphereEdge']};
        save(string{1},'TileSphereEdge','-v7.3');
string={['Tile',num2str(partition),'FlatMain']};
        save(string{1},'TileFlatMain','-v7.3');
string={['Tile',num2str(partition),'FlatEdge']};
        save(string{1},'TileFlatEdge','-v7.3');
        
cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



