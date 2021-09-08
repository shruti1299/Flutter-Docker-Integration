#!/usr/bin/python3


print("content-type: text/html")
print("Access-Control-Allow-Origin: *")
print()

import cgi
import subprocess as sb
#import time

f = cgi.FieldStorage()
cmd = f.getvalue("x")
cn = f.getvalue("y")

output = sb.getoutput("docker run -dit --name {} {}".format(cn,cmd))
print(output)
