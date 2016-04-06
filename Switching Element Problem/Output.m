

%% Author: Prem Shankar
%% SBU ID: 110500038


function[throughput, drops] = Output(p)
output = 0;
output1 = 0;
drops = 0;
for i=1:10
    if(i<4)
        output= output+ i*nchoosek(10,i)*(p.^i)*((1-p).^(10-i));
    else
        output1 = output1 + nchoosek(10,i)*(p.^i)*((1-p).^(10-i));
        drops = drops + (i-3)*nchoosek(10,i)*(p.^i)*((1-p).^(10-i));
    end
end
throughput = output + 3*output1;
end


