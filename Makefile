.PHONY: all clean

all: bf.exe

bf.exe:
	dune build
	mv ./src/bf.exe ./bf.exe

clean:
	dune clean
	rm -f bf.exe
