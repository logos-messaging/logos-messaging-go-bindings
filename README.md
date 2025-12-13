# Logos Messaging Go Bindings

Go bindings for the Logos Messaging library.

## Install

```
go get -u github.com/logos-messaging/logos-messaging-go-bindings
```

## Dependencies

This repository doesn't download or build `logos-messaging-nim`. You must provide `libwaku` and its headers.

To do so, you can:
- Build `libwaku` from https://github.com/logos-messaging/logos-messaging-nim.
- Point `cgo` to the headers and compiled library when building your project.

Example environment setup (adjust paths to your logos-messaging-nim checkout):
```
export LMN_DIR=/path/to/logos-messaging-nim
export CGO_CFLAGS="-I${LMN_DIR}/library"
export CGO_LDFLAGS="-L${LMN_DIR}/build -lwaku -Wl,-rpath,${LMN_DIR}/build"
```

Such setup would look like this in a `Makefile`:
```Makefile
LMN_DIR ?= /path/to/logos-messaging-nim
CGO_CFLAGS = -I$(LMN_DIR)/library
CGO_LDFLAGS = -L$(LMN_DIR)/build -lwaku -Wl,-rpath,$(LMN_DIR)/build

build: ## Your project build command
	go build ./...
```

For a reference integration, see how `status-go` wires `CGO_CFLAGS` and `CGO_LDFLAGS` in its build setup.

NOTE: If your project is itself used as a Go dependency, all its clients will have to follow the same logos-messaging-nim setup. 

## Development

When working on this repository itself, `logos-messaging-nim` is included as a git submodule for convenience.

- Initialize and update the submodule, then build `libwaku`
    ```sh
    git submodule update --init --recursive
    make -C waku build-libwaku
    ```
- Build the project. Submodule paths are used by default to find `libwaku`.
    ```shell
    make -C waku build
    ```
