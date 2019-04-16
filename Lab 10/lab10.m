%% Load input images
img_dir = 'data/Urban';
img1 = im2double(imread(fullfile(img_dir, 'frame10.png')));
img2 = im2double(imread(fullfile(img_dir, 'frame11.png')));

%% parameters
window_size = 90;
k = 4; % number of iterations

w = floor(window_size/2);
shift = w + 10;


%% convert to gray-scale
I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

%% compute gradients
Ix_m = imfilter(I1, [1 -1;  1 -1], 'replicate');
Iy_m = imfilter(I1, [1  1; -1 -1], 'replicate');


%% compute optical flow
u = zeros(size(I1));
v = zeros(size(I1));

u_next = zeros(size(I1));
v_next = zeros(size(I1));

for t = 1:k
    for i = 1 + shift : size(Ix_m, 1) - shift
        for j = 1 + shift : size(Ix_m, 2) - shift
            %% extract Ix, Iy, It from local window
            IX = Ix_m(i-w:i+w,j-w:j+w,:);
            IY = Iy_m(i-w:i+w,j-w:j+w,:);
            i2 = i + v(i,j);
            j2 = j + v(i,j);
            IT = I1(floor(i-w):floor(i+w), floor(j-w):floor(j+w)) - I2(floor(i2-w):floor(i2+w), floor(j2-w):floor(j2+w));
            %% convert Ix, Iy, It to vectors
            IX_v = IX(:);
            IY_v = IY(:);
            IT_v = IT(:);
            
            %% construct matrix A and vector b
            A = [IX_v, IY_v];
            B = [-IT_v];
            
            %% solve A x = b
            x = pinv(A) * B;
            
            u_next(i, j) = x(1);
            v_next(i, j) = x(2);

        end
    end
    %% update flow
    u = u + u_next;
    v = v + v_next;
    
    
end

plot_flow(img2, u, v);
h = gcf;
saveas(h, 'result.png');
