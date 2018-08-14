

# print the topk members of sort
def printTopk(topk, sort):
    print 'The result of top ' + str(topk) + ' is: '
    i = 0
    for item in sort:
        if(i < topk):
            print item[0], item[1]
            i += 1