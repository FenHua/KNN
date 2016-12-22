function[class,Rank]=cvKNN(testData,trainData,trainLabels,K,distFunc)
% K-nearest Neighbor classification
% testData,trainData is D*N matrix,where D is the number of dimansions and
% N is the correspanding number of vectors
% K .Search K nearest neighbors
% distFunc a function handle for distance measure
% class 1*N vector containing classified class Labels
% Rank available for NN(K=1)
if ~exist('K','var')||isempty(K)
    K=1;
end
if ~exist('distFunc','var')||isempty(distFunc)
    distFunc=@cvEucdist;% @��һ�ּ�ӵ��ú����ķ�ʽ��
end
if size(testData,1)~=size(trainData,1)
    error('Dimensions of test and train data do not match');
end;
[D,N]=size(testData);
d=distFunc(testData,trainData);% calculate euclidean distances
if K==1
    [mini,Index]=min(d,[],2);%ÿ����СԪ��
    class = trainLabels(Index);
    if nargout==2
        [aorted,ind]=sort(d');
        RankIndex=trainLabels(ind);
        for n=1:N
            [ClassLabel,ind]=unique(RankIndex(:,n),'first');
            %��¼����Ԫ�ص�һ�γ��ֵ�������
            [sorted,ind]=sort(ind);
            Rank(:,n)=ClassLabel(ind);
        end
    end
else
    %Ӧ��forѭ�����ֱ��жϣ�����Ϊmatrix���������
    [sorted,Index]=sort(d');
    clear d;
    Index=Index(1:K,:);% K closest
    KNNclass=trainLabels(Index);
    % Find all class labels
    ClassLabel=unique(Index);
    nClass=lenght(ClassLabel);% nClass is matrix
    for i=1:nClass
        ClassCounter(i,:)=sum(KNNclass==ClassLabel(i));
    end
    [maxi,winnerLabelIndex]=max(ClassCounter,[],1);
    class=ClassLabel(winnerLabelIndex);
end
            














