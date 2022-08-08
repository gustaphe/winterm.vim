.PHONY : all

all : bin/libcursor.dll

bin/%.dll : auxiliary/%.o
	gcc -shared -o $@ $<

auxiliary/%.o : src/%.c
	gcc -o $@ -c $<
