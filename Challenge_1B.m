clear all; clc; format compact;
format short
syms x y z;

approach0 = 0.001;
min = -10;
max = 10;
x = min:0.5:max;
y = min:0.5:max;

%swap 0 in x with very small number approach0.
if ismember(0,x)
    x = nonzeros(x).';
    x = [x approach0 -approach0];
    x = sort(x);
end

%Plotting
[X,Y,Z] = meshgrid(x);
P = -X./((X.^2 + Y.^2 + Z.^2).^(3./2));
Q = -Y./((X.^2 + Y.^2 + Z.^2).^(3./2));
R = -Z./((X.^2 + Y.^2 + Z.^2).^(3./2));

[cX,cY,cZ] = meshgrid(-9:3:9);
h = coneplot(X,Y,Z,P,Q,R,cX,cY,cZ,'quiver');

hold on
plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',10);
%set(h, 'FaceColor', 'r', 'EdgeColor', 'none'); camlight; lighting gouraud;
grid on; box on;
axis([min max min max min max]);
view([-30 60]);


