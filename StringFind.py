#!/usr/bin/env python

#Search a String from Strings and display the list of findings 

count = 1
total = 0

try:
        file1 = open("text","r")
        file2 = open("messages","r")
except:
        print("""Missing text or messages file:
                 text file and messages file must be available in the current directory
                 text file save the key string to search
                 messages file need to have the file where need to search
                 or use ln -s <source file> messages

                 Example: ln -s /var/log/messagess messages

                 for any query please reach babionandroid@gmail.com
        """)
        exit()

key = str(file1.readline()).strip("\n")

for lineone in file2.readlines():
        if key in lineone:
                print("{} {:4d} : {} ".format("Line",count,lineone.strip("\n")))
                total = total + 1
        count = count + 1
print("{} {:4d} {} '{}' {}".format("Total",total,",Strings of",key,"Found"))
