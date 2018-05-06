#!/usr/bin/Python3.6

from collections import namedtuple
import pickle
import builtins
import os, argparse

"""
import json
import urlparse

"""

"""
Conceptualizing 'job graphs' within the context of an extension of or replacement to Accelerator; to link the resulting objects as historical 'neuronal maps' which variate according to a relational DNS partly constructed from generated discretized irrational intermediate namespaces, such that these and other similar maps in the series serve as semi-hardened precepts for AI.

https://github.com/eBay/accelerator/blob/master/OVERVIEW.txt
https://github.com/JanusGraph/janusgraph/

"""

"""
https://docs.python.org/3/library/collections.html
https://en.wikipedia.org/wiki/Namespace

"""
pylookup = ChainMap(locals(), globals(), vars(builtins)) 

class DeepChainMap(ChainMap):
    'Variant of ChainMap that allows direct updates to inner scopes'

    def __setitem__(self, key, value):
        for mapping in self.maps:
            if key in mapping:
                mapping[key] = value
                return
        self.maps[0][key] = value

    def __delitem__(self, key):
        for mapping in self.maps:
            if key in mapping:
                del mapping[key]
                return
        raise KeyError(key)
        
"""
https://docs.python.org/3.6/library/pickle.html
https://pythontips.com/2013/08/02/what-is-pickle-in-python/

"""
a = ['test value','test value 2','test value 3']
# a
# ['test value','test value 2','test value 3']

file_Name = "testfile"

# open the file for writing
fileObject = open(file_Name,'wb') 

# this writes the object a to the
# file named 'testfile'
pickle.dump(a,fileObject)   

# here we close the fileObject
fileObject.close()

# we open the file for reading
fileObject = open(file_Name,'r')  

# load the object from the file into var b
b = pickle.load(fileObject)  
# b
# ['test value','test value 2','test value 3']
if a==b:
    print("True")
    
if __name__ == '__main__':
    pass
