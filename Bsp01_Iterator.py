# Bsp01_Iterator.py

# Quelle: https://www.journaldev.com/14620/python-iterator
# easily supplemented / changed!


list_string = ['student*in 1', 'student*in 2', 'student*in 3', 'student*in 4', 'student*in 5']

myIterator1 = iter(list_string)
print (myIterator1)
print("type(myIterator1): ", type(myIterator1))

# point the first student*in
output1 = next(myIterator1)
# This will print 'student*in 1'
print("next(myIterator1): ", output1)

# point the next student*in, the second student*in
output1 = next(myIterator1)
# This will print 'student*in 2'
print("next(myIterator1): ", output1)

# point the next student*in, the third student*in
output1 = next(myIterator1)
# This will print 'student*in 3'
print("next(myIterator1): ", output1)

# point the next student*in, the fourth student*in
output1 = next(myIterator1)
# This will print 'student*in 4'
print("next(myIterator1): ", output1)

# point the next student*in, the fifth student*in
output1 = next(myIterator1)
# This will print 'student*in 5'
print("next(myIterator1): ", output1)

# point the next student*in, but there is no student*in left
# so raise 'StopIteration' exception
#output1 = next(myIterator1)

# This print will execute => once more 'student*in 5'
print("'output1' once more:" ,output1)

print("type(myIterator1): ", type(myIterator1))
print("list_string:", list_string)





# zweiter (neuer!!!) Durchlauf
print("*"* 50)
myIterator1 = iter(list_string)
output1 = next(myIterator1)
print(output1)

# Output:

# <list_iterator object at 0x00000194A249A8D0>
# type(myIterator1):  <class 'list_iterator'>
# next(myIterator1):  student*in 1
# next(myIterator1):  student*in 2
# next(myIterator1):  student*in 3
# next(myIterator1):  student*in 4
# next(myIterator1):  student*in 5
# Traceback (most recent call last):
#   File "C:/Users/Erwin Mathis/PycharmProjects/IDS_Python/IteratorSolution/Bsp01_Iterator_a.py", line 39, in <module>
#     output1 = next(myIterator1)
# StopIteration