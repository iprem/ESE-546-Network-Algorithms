
%% Author: Prem Shankar
%% SBU ID: 110500038


%% Theoretical Part

p=0; i = 1;
prob = 0.02:0.02:1;
drops = zeros(1,50);
throughput = zeros(1,50);
while p<=1
    p = p + 0.02;
    [t,d] = Output(p);  %function call to find Throughput and Dropped packets
    drops(i) = d;
    throughput(i) = t;
    i = i+1;
end



%% Simulation part
 
simulation = 1000;
x = 1;
t_sim = zeros(1,50);
d_sim = zeros(1,50);
 
for j = 0.02:0.02:1
    t = 0;
    d = 0;
    for i= 1:simulation
        packets = 0;
        p = rand(1,10);
        for k = 1:10
            if(p(k) <= j)
                packets = packets+1;   %calculate number of packets for %each time slot
            end
        end                   
        if(packets<4)
            t = t + packets;           %calculate Throughput
        else
            t = t+3;
            d = d + packets - 3;       %calculate packets dropped
        end
    end
    total  = t;
    t = t/simulation;                  %Average number of busy oputputs for 1000 timeslots
    t_sim(x) = t;
    d = d/simulation;                  %Average dropped packets for 1000 timeslots
    d_sim(x) = d;
    x = x + 1;
end



%% Plot Graphs
 
p1 = plot(prob,throughput,'g',prob,t_sim,':xk');
title('Simulated VS Theoretical');
xlabel('Probability');
ylabel('Average Number of Busy Output');
p1(1).LineWidth = 2;
p1(2).LineWidth = 2;
p1(1).Marker = '*';
 
figure
p2 = plot(prob,drops,'g',prob,d_sim,':xb');
title('Simulated VS Theoretical');
xlabel('Probability');
ylabel('Number of packets dropped');
p2(1).LineWidth = 2;
p2(2).LineWidth = 2;
p2(1).Marker = '*';


