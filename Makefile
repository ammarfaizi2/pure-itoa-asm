
BIN = itoa

NASM = nasm
LINKER = ld

NASM_FLAG = -felf64
LINKER_FLAG = 

SOURCES = $(shell find src/ -name '*.asm')
OBJECTS = $(SOURCES:%.asm=%.o)

RM = rm -rfv

all: ${OBJECTS} ${BIN}

${BIN}: ${OBJECTS}
	${LINKER} ${OBJECTS} -o $@

${OBJECTS}:
	${NASM} ${NASM_FLAG} ${@:%.o=%.asm} -o $@

clean:
	${RM} ${OBJECTS}
	${RM} ${BIN}
