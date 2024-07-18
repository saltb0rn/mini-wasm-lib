.PHONY: clean

CC := clang
AR := llvm-ar
OBJS := lib0.o lib1.o lib2.o lib3.o
TARGET ?= NATIVE
CFLAGS   ?=
LIB_ROOT := lib
LIB_DIR  ?=

ifeq ($(TARGET), WASM)
	CFLAGS  = --target=wasm32-unknown-wasi
	LIB_DIR = $(LIB_ROOT)/wasm
else
	CFLAGS  =
	LIB_DIR = $(LIB_ROOT)/native
endif

libmini.a: $(OBJS)
	mkdir -p $(LIB_DIR)
	$(AR) rcs $(LIB_DIR)/$@ $^
	rm -rf $(OBJS)

$(OBJS): %.o: %.c
	mkdir -p $(LIB_DIR)
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -rf $(LIB_ROOT)
