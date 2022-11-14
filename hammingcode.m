% HammingCode
%coding
G1=eye(4); %4x4 unit matrix
Gp=[ 1 1 1;1 0 1;0 1 1;1 0 0 ]; %PCheck matrix
 
G=[G1 Gp]; %Assemble test matrix and identity matrix
DW= [ 0 0 0 1]; %Data word
CW=DW*G; %Coding formula Hamming code
 
fprintf('codiertes Codewort: ');
CW=mod(CW,2); %Make CW modulo 2 --> make 0 out of 2, make 1 out of 3 etc.
disp(CW); %display code word
fprintf('\n');
 
mask=[0 1 0 0 0 0 0]; %With this mask you can generate a bit error by setting the corresponding position to 1
NCW=xor(mask,CW); %Bit error at specified position is generated in the code word
fprintf('gestörtes Codewort: ');
disp(NCW); %Incorrect code word is displayed
fprintf('\n');
 
 
 
%calculate syndrom
 
H1=eye(3);
H=[transpose(Gp) H1];
 
s=NCW*transpose(H);
s=mod(s,2);
fprintf('Syndrom: ');
disp(s); %Syndrom
fprintf('\n');
