function [data_out] = loadmcxtrace_E(fname)
%LOADMCXTRACE_E Summary of this function goes here
fid = fopen(fname);
data=textscan(fid,'%f %f %f %f','CommentStyle','#');
fclose(fid);

data_out(:,1)=data{1,1};
data_out(:,2)=data{1,2};
data_out(:,3)=data{1,3};
data_out(:,4)=data{1,4};
end

