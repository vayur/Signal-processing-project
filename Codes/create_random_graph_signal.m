function [G,fn] = create_random_graph_signal(size)
W = rand(size,size);
W =  W + W'; % create symmetric matrix
for i = 1:size
    W(i,i) = 0;
end
% make diagonal elements zero.
%coordinates = randn(size,2); % assign random 2d coordinates to all nodes.
%G = gsp_graph(W,coordinates);
G=gsp_sensor(size);
% graph is created, now to create the function.
n = 0:1:size-1;

fn = sin(n*(1/size)*5);

end

