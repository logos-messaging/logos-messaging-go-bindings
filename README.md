# Waku Go Bindings

Go bindings for the Waku library.

## Install

```
go get -u github.com/logos-messaging/logos-messaging-go-bindings
```

## Building & Dependencies

`libwaku` (from `logos-messaging-nim`) is required at compile-time. The Makefile gives you two ways to satisfy this:

1. **Reuse an existing clone** – if you already have `logos-messaging-nim` checked out, point the build to it:
   ### Manual build without Makefile
   If you want to invoke `go build` or `go test` directly, export the same variables the Makefile sets:
   ```bash
   # path to your existing logos-messaging-nim clone
   export LMN_DIR=/absolute/path/to/logos-messaging-nim
   export CGO_CFLAGS="-I${LMN_DIR}/library"
   export CGO_LDFLAGS="-L${LMN_DIR}/build -lwaku -Wl,-rpath,${LMN_DIR}/build"
 
   # compile all packages
   go build ./waku

   # run all tests
   go test ./waku

   # run a specific test
   go test ./waku -count=1 -run TestConnectedPeersInfo -v
   ```

2. **Automatic clone (default)** – if `LMN_DIR` is **unset**, running
   ```bash
   make -C waku build
   ```
   will clone a shallow copy of `logos-messaging-nim` into `third_party/nwaku`, build `libwaku`, and compile the Go bindings. This is what CI uses.

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
