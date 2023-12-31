import sys
try:
    fileName = sys.argv[1]
except Exception as e:
    print("Must pass in a file name to update.")

offset = 400 # NTFS specific
access_flag = [0xA2, 0xA0, 0xD0, 0xEB, 0xE5, 0xB9, 0x33, 0x44,
               0x87, 0xC0, 0x68, 0xB6, 0xB7, 0x26 ,0x99, 0xC7,
               0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10]

with open(fileName, "r+b") as fh:
    fh.seek(offset)
    fh.write(bytes(access_flag))
