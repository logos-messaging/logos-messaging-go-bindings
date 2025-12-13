# Makefile for Logos Messaging Go Bindings

# Directories
THIRD_PARTY_DIR := $(shell pwd)/../third_party
LOGOS_MESSAGING_NIM_REPO := https://github.com/logos-co/logos-messaging-nim
LOGOS_MESSAGING_NIM_DIR := $(THIRD_PARTY_DIR)/logos-messaging-nim

.PHONY: all clean build-libwaku build

# Default target
all: build

# Build libwaku
build-libwaku:
	@echo "Building libwaku..."
	@cd $(LOGOS_MESSAGING_NIM_DIR) && make libwaku

# Build Logos Messaging Go Bindings

build: export CGO_CFLAGS = "-I${LOGOS_MESSAGING_NIM_DIR}/library/"
build: export CGO_LDFLAGS = "-L${LOGOS_MESSAGING_NIM_DIR}/build/ -lwaku -L${LOGOS_MESSAGING_NIM_DIR} -Wl,-rpath,${LOGOS_MESSAGING_NIM_DIR}/build/"
build:
	@echo "Building Logos Messaging Go Bindings..."
	go build ./...

# Clean up generated files
clean:
	@echo "Cleaning up..."
	@rm -rf $(THIRD_PARTY_DIR)
	@rm -f logos-messaging-go-bindings