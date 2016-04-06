

%% Author: Prem Shankar
%% SBU ID: 110500038


%% Theoretical Part

input = 3;
output = 4;
prob = 0.02:0.02:1;
throughput = zeros(3,50);
for i = 1:3
    for p = 1:50
        %Calculation of theoretical throughput
        throughput(i,p) = (1-(1-(prob(p)/output))^input);
    end
    input = input + 1;
    output = output + 1;
end
t1 = throughput(1,1:50);    %Throughput for 3x4
t2 = throughput(2,1:50);    %Throughput for 4x5
t3 = throughput(3,1:50);    %Throughput for 5x6


 
%% Simulation Part

input = 3;
output = 4;
throughput_sim = zeros(3,50);
for i = 1:3                 %For each of the crossbar
    l = 1;
    t = 0;
    for p = 0.02:0.02:1     
        for j = 1:5000
            input_packet = (rand(1,input)) <= p ;   %Generate input packets
            o = zeros(1,output);
            for k = 1:input
                if(input_packet(k) == 1 )
                    o(randi([1 output],1,1)) = 1;   %Randomly select output packet
                end
            end
            t = t + sum(o);
        end
        t = t/(5000 * output);       %Calculate throughput for each probability
        throughput_sim(i,l) = t;        
        l = l+1;
    end
    input = input + 1;
    output = output + 1;

