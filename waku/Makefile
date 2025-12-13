# Makefile for Logos Messaging Go Bindings

# Directories
THIRD_PARTY_DIR := $(shell pwd)/../third_party
LMN_REPO := https://github.com/logos-messaging/logos-messaging-nim
LMN_DIR := $(THIRD_PARTY_DIR)/logos-messaging-nim

.PHONY: all clean build-libwaku build

# Default target
all: build

# Build libwaku
build-libwaku:
	@echo "Building libwaku..."
	@cd $(LMN_DIR) && make libwaku

# Build Logos Messaging Go Bindings

build: export CGO_CFLAGS = "-I${LMN_DIR}/library/"
build: export CGO_LDFLAGS = "-L${LMN_DIR}/build/ -lwaku -L${LMN_DIR} -Wl,-rpath,${LMN_DIR}/build/"
build:
	@echo "Building Logos Messaging Go Bindings..."
	go build ./...

# Clean up generated files
clean:
	@echo "Cleaning up..."
	@rm -rf $(THIRD_PARTY_DIR)
	@rm -f logos-messaging-go-bindings