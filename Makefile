CC=gcc
CFLAGS=-lpthread -lm -Iinclude -g
INC_DIR := include
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

SOURCE_FILES=$(shell find $(SRC_DIR) -name '*.c')
OBJS=$(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCE_FILES))

$(BIN_DIR)/parser: $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(INCLUDE) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<

clean:
	@rm -rf $(OBJ_DIR)
	@rm -rf $(BIN_DIR)