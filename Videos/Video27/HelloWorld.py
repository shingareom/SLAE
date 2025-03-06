import binascii

text = "Hello World"
hex_text = binascii.hexlify(text[::-1].encode()).decode()
print(hex_text)  # Output: 6f6c6c6568
