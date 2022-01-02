
close all; clear; clc; radiusEarth=6371;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd('Outputs');

load Tile0FlatMain.mat
                        A0=TileFlatMain;
load Tile1FlatMain.mat
                        A1=TileFlatMain;
load Tile2FlatMain.mat
                        A2=TileFlatMain;
load Tile3FlatMain.mat
                        A3=TileFlatMain;
load Tile0FlatEdge.mat
                        B0=TileFlatEdge;
load Tile1FlatEdge.mat
                        B1=TileFlatEdge;
load Tile2FlatEdge.mat
                        B2=TileFlatEdge;
load Tile3FlatEdge.mat
                        B3=TileFlatEdge;
cd ..

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Position',[120,60,1420,780],'Color','k'); hold on;

subtightplot(1,2,1); hold on;

        A=A0; k=0;
        for i=1:length(A)
            plot3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k,'c','LineWidth',3);
        end

        A=A1; k=1;
        for i=1:length(A)
            plot3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k,'c','LineWidth',2);
        end

        A=A2; k=2;
        for i=1:length(A)
            plot3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k,'c','LineWidth',1);
        end

        A=A3; k=3;
        for i=1:length(A)
            plot3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k,'c','LineWidth',0.1);
        end

        xlim([-185,185]); ylim([-95,95]);
        view(-45,15); axis off;

subtightplot(1,2,2); hold on;

        A=B0; k=0;
        for i=1:length(A)
            fill3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k, ...
            'm','FaceAlpha',0.25,'EdgeColor','r');
        end

        A=B1; k=1;
        for i=1:length(A)
            fill3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k, ...
            'm','FaceAlpha',0.25,'EdgeColor','r');
        end

        A=B2; k=2;
        for i=1:length(A)
            fill3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k, ...
            'm','FaceAlpha',0.25,'EdgeColor','r');
        end

        A=B3; k=3;
        for i=1:length(A)
            fill3(A(:,1,i),A(:,2,i),A(:,1,i)*0+k, ...
            'm','FaceAlpha',0.25,'EdgeColor','r');
        end

        xlim([-185,185]); ylim([-95,95]);
        view(-45,15); axis off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd('Outputs');

load Tile0SphereMain.mat
                        A0=TileSphereMain;
load Tile1SphereMain.mat
                        A1=TileSphereMain;
load Tile2SphereMain.mat
                        A2=TileSphereMain;
load Tile3SphereMain.mat
                        A3=TileSphereMain;
load Tile4SphereMain.mat
                        A4=TileSphereMain;
load Tile5SphereMain.mat
                        A5=TileSphereMain;
load Tile6SphereMain.mat
                        A6=TileSphereMain;
load Tile0SphereEdge.mat
                        B0=TileSphereEdge;
load Tile1SphereEdge.mat
                        B1=TileSphereEdge;
load Tile2SphereEdge.mat
                        B2=TileSphereEdge;
load Tile3SphereEdge.mat
                        B3=TileSphereEdge;
load Tile4SphereEdge.mat
                        B4=TileSphereEdge;
load Tile5SphereEdge.mat
                        B5=TileSphereEdge;
load Tile6SphereEdge.mat
                        B6=TileSphereEdge;
cd ..

ArcLine=(-180:1:180)';
ArcLine=cat(2,ArcLine,zeros(length(ArcLine),1));
radX=deg2rad(ArcLine(:,1));
radY=deg2rad(ArcLine(:,2));
[arcX,arcY,arcZ]=sph2cart(radX,radY,20000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Position',[120,60,1420,780],'Color','k'); hold on;

plot3(arcX,arcY,arcZ,'Color','#006ec7');
plot3(arcY,arcZ,arcX,'Color','#006ec7');
plot3(arcZ,arcX,arcY,'Color','#006ec7');

A=cat(3,A0,B0)*3;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',3);
end

A=cat(3,A1,B1)*2;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',2);
end

A=cat(3,A2,B2)*1;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',1);
end

A=cat(3,A3,B3)*0.5;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',0.1);
end

set(gca,'CameraViewAngleMode','manual');
view(-45,45); axis off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Position',[120,60,1420,780],'Color','k'); hold on;

plot3(arcX,arcY,arcZ,'Color','#006ec7');
plot3(arcY,arcZ,arcX,'Color','#006ec7');
plot3(arcZ,arcX,arcY,'Color','#006ec7');

A=(A0)*3;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',3);
end

A=(A1)*2;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',2);
end

A=(A2)*1;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',1);
end

A=(A3)*0.5;
for i=1:length(A)
    plot3(A(:,1,i),A(:,2,i),A(:,3,i),'c','LineWidth',0.1);
end

A=(B0)*3;
for i=1:length(A)
    fill3(A(:,1,i),A(:,2,i),A(:,3,i),'m','FaceAlpha',0.25,'EdgeColor','r');
end

A=(B1)*2;
for i=1:length(A)
    fill3(A(:,1,i),A(:,2,i),A(:,3,i),'m','FaceAlpha',0.25,'EdgeColor','r');
end

A=(B2)*1;
for i=1:length(A)
    fill3(A(:,1,i),A(:,2,i),A(:,3,i),'m','FaceAlpha',0.25,'EdgeColor','r');
end

A=(B3)*0.5;
for i=1:length(A)
    fill3(A(:,1,i),A(:,2,i),A(:,3,i),'m','FaceAlpha',0.25,'EdgeColor','r');
end

set(gca,'CameraViewAngleMode','manual');
view(-45,45); axis off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
