import random

toOrder = (random.sample(range(100,999), 500))
print (toOrder)

def radixSort(lista):
    subBuckets = [2,1,0]
    bucket = [[],[],[],[],[],[],[],[],[],[]]
    for x in subBuckets:
        for y in lista:
            bucket[int(str(y)[x])].append(int(y))
        lista = []
        for w in bucket:
            for y in w:
                lista.append(y)
        bucket = [[],[],[],[],[],[],[],[],[],[]]
    return lista
    
print(radixSort(toOrder))
