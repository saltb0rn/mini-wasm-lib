.PHONY: clean wasm-libmini.a native-libmini.a

CC := clang

example.wasm: example.c wasm-libmini.a
	$(CC) \
	--target=wasm32 \
	-I../include \
	-L../lib/wasm \
	-nostartfiles \
	-nostdlib \
	-Wl,--no-entry \
	-Wl,--export=example \
	-o $@ example.c '-l:libmini.a'

example_native: main.c native-libmini.a
	$(CC) \
	-I../include \
	-L../lib/native \
	-o $@ main.c example.c '-l:libmini.a'

wasm-libmini.a:
	cd .. && make -B libmini.a TARGET=WASM

native-libmini.a:
	cd .. && make -B libmini.a

clean:
	rm -rf example{.o,.wasm,_native}
	cd .. && make clean
