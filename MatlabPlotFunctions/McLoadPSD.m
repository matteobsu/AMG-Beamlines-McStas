function [data] = McLoadPSD(fname,Nx,Ny)
fid = fopen(fname);
data=textscan(fid,'%f','CommentStyle','#');
fclose('all');
data=cell2mat(data);
if(nargin<2)
    N2 = length(data)/3;
    Nx = sqrt(N2);
    Ny = sqrt(N2);
end
data = reshape(data(1:N2),[Nx Ny]);
end