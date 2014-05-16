#!/usr/bin/python
# Generate an OpenSCAD surface file from the first 256 bytes of a text file
import sys

f = open(sys.argv[1], "rb")
d = f.read(256)
f.close()

for y in range(16):
  s = ''
  for x in range(16):
    s = s + ("%d " % (d[(y*16) + x]))
  print(s)

