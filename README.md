# Waku Go Bindings

Go bindings for the Waku library.

## Install

```
go get -u github.com/logos-messaging/logos-messaging-go-bindings
```

## Building & Dependencies

`libwaku` (from `logos-messaging-nim`) is required at compile-time. The Makefile gives you two ways to satisfy this:

1. **Automatic clone (default)** – if `LMN_DIR` is **unset**, running
   ```bash
   make -C waku build
   ```
   will clone a shallow copy of `logos-messaging-nim` into `third_party/nwaku`, build `libwaku`, and compile the Go bindings. This is what CI uses.

2. **Reuse an existing clone** – if you already have `logos-messaging-nim` checked out, point the build to it:
   ```bash
   export LMN_DIR=/path/to/your/logos-messaging-nim
   make -C waku build
   ```
   Existing `libwaku` artifacts under that path are reused, so this is fast for local development.

The Makefile sets `CGO_CFLAGS` and `CGO_LDFLAGS` automatically; no extra environment is required.

> **Downstream projects**: When importing `logos-messaging-go-bindings` in another Go module you must ensure `LMN_DIR` is exported (or vendor `libwaku`) before running `go build`. Otherwise the CGO step will fail.

---

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
