def saveimages(files):
    for f in files:
        print(f)
        number=np.loadtxt(f)
        for n in range(16):
        #for n in range(len(number)):  
            nn = np.reshape(number[n],(28,28))
            im = image.fromarray(nn).convert('L')
            im.save("D:/images/im{}.png".format(n))
#             #plt.show(im)
#             #plt.subplot(100,100,n+1)
#             #plt.subplot(211,len(number),n+1)
#             plt.subplot(4,4,n+1)
#             #plt.subplot(number.shape[0]//5,5,n+1)
#             plt.axis('off')
#             plt.imshow(im,cmap=plt.cm.gray_r)
            
def read_data():
    '''to access 0 you need xxx_set[0][:], to access 1 you need xxx_set[1][:] and so on'''
    #testdata
    testdata= []
    for f in test:
        testdata.append(np.loadtxt(f))
    finaltest=np.array(testdata)
    #traindata
    traindata = []
    for f in train:
        traindata.append(np.loadtxt(f))
    finaltrain = np.array(traindata)
    return finaltest,finaltrain

test=[]
for i in range(0,10):
    test.append("D:/mnistdata/test{}.txt".format(str(i)))
train=[]
for i in range(0,10):
    train.append("D:/mnistdata/train{}.txt".format(str(i)))
