% HammingCode
%codierung
G1=eye(4); %4x4 Einheitsmatrix
Gp=[ 1 1 1;1 0 1;0 1 1;1 0 0 ]; %Prüfmatrix
 
G=[G1 Gp]; %Setze Prüfmatrix und Einheitsmatrix zusammen
DW= [ 0 0 0 1]; %Datenwort
CW=DW*G; %CodierungsformelHammingcode
 
fprintf('codiertes Codewort: ');
CW=mod(CW,2); %Mache CW Modulo2 --> aus 2 mach 0, aus 3 mach 1 usw.
disp(CW); %Gebe Codewort aus
fprintf('\n');
 
mask=[0 1 0 0 0 0 0]; %Mit dieser Maske kann man gezielt einen Bitfehler erzeugen, indem man die entrsprechende Position auf 1 setzt
NCW=xor(mask,CW); %Bitfehler an vorgegebener Position wird im Codewort erzeugt
fprintf('gestörtes Codewort: ');
disp(NCW); %Fehlerhaftes Codewort wird angezeigt
fprintf('\n');
 
 
 
%Syndrom berechnen
 
H1=eye(3);
H=[transpose(Gp) H1];
 
s=NCW*transpose(H);
s=mod(s,2);
fprintf('Syndrom: ');
disp(s); %Syndrom
fprintf('\n');