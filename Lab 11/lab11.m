load('att_face.mat');

k = 10; % number of eigenfaces

h = size(face_training, 1);
w = size(face_training, 2);
n_train = size(face_training, 3);
n_test = size(face_testing, 3);

fprintf('Compute eigenface...\n');
%% reshape face_training from h x w x num_train to (h*w) x num_train
X = ?

%% compute mean face
x_bar = ?

%% substract mean from X
Y = ?

%% compute covariance matrix C
C = ?

%% singular value decomposition


%% select the first k column from U
U = ?

%% encode face image as coefficients of eigenface
fprintf('Face reconstruction...\n');
x = face_training(:, :, 1);
figure(1), 
subplot(1, 2, 1); imshow(imresize(x, 4)); title('input');

% TODO: compute coef
x = x(:);
coef = ?

%% reconstruct face image from coefficients
x_rec = ?

x_rec = reshape(x_rec, h, w);
subplot(1, 2, 2); imshow(imresize(x_rec, 4)); title('reconstruction');
imwrite(imresize(x_rec, 4), sprintf('reconstruct_k%d.jpg', k));


%% encode all training data
fprintf('Convert training data to coef...\n');
coef_train = zeros(k, n_train); % TODO: compute coef_train for all training images


%% Face recognition with eigenface coefficients
fprintf('Testing...\n');
id_predict = zeros(size(id_testing));

for i = 1:n_test
    
    %% extract testing image
    img_test = face_testing(:, :, i);
    
    %% convert testing image to feature vector
    coef_test = ?; % TODO: replace this line
    
    error = zeros(n_train, 1);
    for j = 1:n_train
        
        %% compute the square error between feature vectors
        diff = coef_train(:, j) - coef_test;
        error(j) = sum( diff .^2 );
        
    end
    
    %% find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

%% compute accuracy
accuracy = sum(id_testing == id_predict)/n_test;
fprintf('Accuracy = %f\n', accuracy);

%---------------------------------------%
%---------- Fill in this table ---------%
%---------------------------------------%
%   k   |  Accuracy
%---------------------------------------%
%  10   |   
%---------------------------------------%
%  20   |   
%---------------------------------------%
%  30   |   
%---------------------------------------%
%  40   |   
%---------------------------------------%
%  50   |   
%---------------------------------------%


