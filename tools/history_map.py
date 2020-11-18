"""
    Simple Utility to help you save time by finding your most used commands that
    you may consider aliasing
"""
import os

def main() :
    with open(os.path.expanduser('~/.bash_history'),'r') as history_file :
        history_dict = {}
        for line in history_file :
            count = history_dict.get(line, 0)
            count += 1
            history_dict[(line)] = count
        


        ##more fun binary tree with key!
        for key in history_dict :
        
        ## or use brute force list

class history_item:
    def __init__(self, key, value):
        self.key = key
        self.value = value

if __name__ == '__main__':
    main()

