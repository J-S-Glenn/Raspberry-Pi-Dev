import sys
try:
    fileName = sys.argv[1]
except Exception as e:
    print("Must pass in a file name to update.")

offset = 400
access_flag = r"0xA2\0xA0\0xD0\0xEB\0xE5\0xB9\0x33\0x44\0x87\0xC0\0x68\0xB6\0xB7\0x26\0x99\0xC7\0x00\0x00\0x00\0x00\0x00\0x00\0x00\0x10"
access_flag_bytes = []

access_flag = access_flag.split('\\')
print(len(access_flag))
try:
    for n in range(0,len(access_flag)):
        access_flag_bytes.append(int(access_flag[n], 16))
except Exception as e:
    print("access_flag cannot be interpreted as hex values.")
    print(e)

with open(fileName, "r+b") as fh:
    fh.seek(offset)
    fh.write(bytes(access_flag_bytes))
