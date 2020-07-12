build:
	apio verify
	apio build
#	apio sim
	apio upload
	apio clean

# iceprog.exe -d i:0x0403:0x6014 <bin>
