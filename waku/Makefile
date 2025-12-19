# Makefile for Waku Go Bindings

# Path to logos-messaging-nim (nwaku) submodule
LMN_DIR ?= $(shell pwd)/../third_party/nwaku

# Default paths for libwaku library and headers (can be overridden)
LIBWAKU_HEADER_PATH ?= $(LMN_DIR)/library
LIBWAKU_LIB_PATH ?= $(LMN_DIR)/build

export CGO_CFLAGS := -I$(LIBWAKU_HEADER_PATH)/
export CGO_LDFLAGS := -L$(LIBWAKU_LIB_PATH)/ -lwaku -Wl,-rpath,$(LIBWAKU_LIB_PATH)/

# Expected files
HEADER_FILE := $(LIBWAKU_HEADER_PATH)/libwaku.h
LIB_FILES   := $(wildcard $(LIBWAKU_LIB_PATH)/libwaku.*)

.PHONY: all clean prepare build build-libwaku

# Default target
all: build

# Validate necessary folders and files
check-folders:
	@echo Checking libwaku header directory ...
	@if [ -z "$(LIBWAKU_HEADER_PATH)" ]; then \
		echo "ERROR: LIBWAKU_HEADER_PATH not set"; exit 1; \
	fi
	@if [ ! -d "$(LIBWAKU_HEADER_PATH)" ]; then \
		echo "ERROR: Header path does not exist: $(LIBWAKU_HEADER_PATH)"; exit 1; \
	fi

	@echo Checking libwaku lib directory ...
	@if [ -z "$(LIBWAKU_LIB_PATH)" ]; then \
		echo "ERROR: LIBWAKU_LIB_PATH not set"; exit 1; \
	fi
	@if [ ! -d "$(LIBWAKU_LIB_PATH)" ]; then \
		echo "ERROR: Library path does not exist: $(LIBWAKU_LIB_PATH)"; exit 1; \
	fi

	@echo Checking for libwaku.h ...
	@if [ ! -f "$(HEADER_FILE)" ]; then \
		echo "ERROR: libwaku.h not found at: $(HEADER_FILE)"; exit 1; \
	fi

	@echo Checking for libwaku library file ...
	@if [ -z "$(LIB_FILES)" ]; then \
		echo "ERROR: No libwaku library file found in: $(LIBWAKU_LIB_PATH)"; exit 1; \
	fi

# Build SDS Go Bindings
build: build-libwaku check-folders
	@echo "Building Waku Go Bindings..."
	go build ./...

# Build libwaku from the nwaku submodule
build-libwaku:
	@echo "Building libwaku from logos-messaging-nim submodule..."
	@if [ ! -d "$(LMN_DIR)" ]; then \
		echo "nwaku sources not found at $(LMN_DIR), cloning shallow copy..."; \
		mkdir -p $(dir $(LMN_DIR)); \
		git clone --depth 1 https://github.com/logos-messaging/logos-messaging-nim.git $(LMN_DIR); \
	fi
	$(MAKE) -C $(LMN_DIR) libwaku

# Clean up generated files
clean:
	@echo "Cleaning up..."
	@rm -f waku-go-bindings
