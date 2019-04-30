load('att_face.mat');

k = 10; % number of eigenfaces

h = size(face_training, 1);
w = size(face_training, 2);
n_train = size(face_training, 3);
n_test = size(face_testing, 3);

fprintf('Compute eigenface...\n');
%% reshape face_training from h x w x num_train to (h*w) x num_train
X = reshape(face_training,(h*w),n_train);

%% compute mean face
x_bar = mean(X,2);
meanShow = reshape(x_bar,h,w);
imshow(meanShow);

%% substract mean from X
Y = X - repmat(x_bar,1,n_train);

%% compute covariance matrix C
C = zeros((h*w),(h*w));
Y_T = transpose(Y);
for i = 1:n_train
    C_temp = Y(i,:)*Y_T(:,i);
    C = C + C_temp;
end

%% singular value decomposition
[U,S,D] = svd(C);

%% select the first k column from U
U = U(:,1:k);

%% encode face image as coefficients of eigenface
fprintf('Face reconstruction...\n');
x = face_training(:, :, 1);
figure(1), 
subplot(1, 2, 1); imshow(imresize(x, 4)); title('input');

% TODO: compute coef
coef = zeros((h*w),k);
x = x(:);
x = x-x_bar;
for i = 1:k
    U_i = U(:,i);
    coef(:,i) = U_i .* x;
end

%% reconstruct face image from coefficients
x_rec = x_bar;

for i = 1:k
    x_rec = x_rec + coef(:,i);
end
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
    coef_test = img_test(:);
    
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


