trainData = [
    0.6213    0.5226    0.9797    0.9568    0.8801    0.8757    0.1730    0.2714    0.2523
    0.7373    0.8939    0.6614    0.0118    0.1991    0.0648    0.2987    0.2844    0.4692
    ];
trainLabels = [
    1     1     1     2     2     2     3     3     3
    ];
testData = [
    0.9883    0.5828    0.4235    0.5155    0.3340
    0.4329    0.2259    0.5798    0.7604    0.5298
    ];
testClass = cvKNN(testData, trainData,trainLabels);
%plot
classLabel=unique(trainLabels);
nClass=length(classLabel);
plotLabel={'r*','g*','b*'};
figure;
for i=1:nClass
    A=trainData(:,trainLabels==classLabel(i));
    plot(A(1,:),A(2,:),plotLabel{i});%()是数组引用符号，{}是元胞引用符号
    hold on;
end
plotLabel={'ro','go','bo'};
for i=1:nClass
    A=testData(:,testClass==classLabel(i));
    plot(A(1,:),A(2,:),plotLabel{i});
    hold on;
end
legend('1:trainDataType','2:trainDataType','3:trainDataType','1: classifiee', '2: classifiee', '3: classifiee', 'Location', 'NorthWest');
title('KNN 算法')
hold off;













