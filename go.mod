module github.com/logos-messaging/logos-messaging-go-bindings

go 1.23.0

replace github.com/ethereum/go-ethereum v1.10.26 => github.com/status-im/go-ethereum v1.10.25-status.18

replace github.com/rjeczalik/notify => github.com/status-im/notify v1.0.2-status

replace github.com/docker/docker => github.com/docker/engine v1.4.2-0.20190717161051-705d9623b7c1

replace github.com/nfnt/resize => github.com/status-im/resize v0.0.0-20201215164250-7c6d9f0d3088

replace github.com/forPelevin/gomoji => github.com/status-im/gomoji v1.1.3-0.20220213022530-e5ac4a8732d4

replace github.com/mutecomm/go-sqlcipher/v4 v4.4.2 => github.com/status-im/go-sqlcipher/v4 v4.5.4-status.3

replace github.com/libp2p/go-libp2p-pubsub v0.12.0 => github.com/logos-messaging/go-libp2p-pubsub v0.12.0-gowaku.0.20240823143342-b0f2429ca27f

replace github.com/logos-messaging/logos-messaging-go => github.com/waku-org/go-waku v0.8.1-0.20241028194639-dd82c24e0057

replace github.com/logos-messaging/go-discover => github.com/waku-org/go-discover v0.0.0-20240506173252-4912704efdc5

require (
	github.com/beevik/ntp v0.3.0 // indirect
	github.com/cenkalti/backoff/v3 v3.2.2
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/ethereum/go-ethereum v1.16.3
	github.com/ipfs/go-cid v0.5.0 // indirect
	github.com/libp2p/go-libp2p v0.39.1
	github.com/libp2p/go-libp2p-pubsub v0.13.1 // indirect
	github.com/multiformats/go-multiaddr v0.14.0
	github.com/multiformats/go-multibase v0.2.0 // indirect
	github.com/multiformats/go-multihash v0.2.3 // indirect
	github.com/multiformats/go-varint v0.0.7 // indirect
	github.com/prometheus/client_golang v1.20.5 // indirect
	github.com/stretchr/testify v1.10.0
	github.com/syndtr/goleveldb v1.0.1-0.20220614013038-64ee5596c38a // indirect
	go.uber.org/zap v1.27.0
	golang.org/x/crypto v0.41.0 // indirect
	google.golang.org/protobuf v1.36.4
)

require github.com/logos-messaging/logos-messaging-go v0.8.1-0.20241028194639-dd82c24e0057

require (
	github.com/StackExchange/wmi v1.2.1 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/btcsuite/btcd/btcec/v2 v2.3.2 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cruxic/go-hmac-drbg v0.0.0-20170206035330-84c46983886d // indirect
	github.com/decred/dcrd/dcrec/secp256k1/v4 v4.3.0 // indirect
	github.com/go-ole/go-ole v1.3.0 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/snappy v0.0.5-0.20220116011046-fa5810519dcb // indirect
	github.com/hashicorp/golang-lru v0.5.5-0.20210104140557-80c98217689d // indirect
	github.com/hashicorp/golang-lru/v2 v2.0.7 // indirect
	github.com/holiman/uint256 v1.3.2 // indirect
	github.com/huin/goupnp v1.3.0 // indirect
	github.com/ipfs/go-log/v2 v2.5.1 // indirect
	github.com/jackpal/go-nat-pmp v1.0.2 // indirect
	github.com/jellydator/ttlcache/v3 v3.3.0 // indirect
	github.com/klauspost/cpuid/v2 v2.2.9 // indirect
	github.com/libp2p/go-buffer-pool v0.1.0 // indirect
	github.com/libp2p/go-msgio v0.3.0 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/minio/sha256-simd v1.0.1 // indirect
	github.com/mr-tron/base58 v1.2.0 // indirect
	github.com/multiformats/go-base32 v0.1.0 // indirect
	github.com/multiformats/go-base36 v0.2.0 // indirect
	github.com/multiformats/go-multiaddr-fmt v0.1.0 // indirect
	github.com/multiformats/go-multicodec v0.9.0 // indirect
	github.com/multiformats/go-multistream v0.6.0 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/onsi/gomega v1.34.1 // indirect
	github.com/pion/dtls/v2 v2.2.12 // indirect
	github.com/pion/logging v0.2.3 // indirect
	github.com/pion/stun/v2 v2.0.0 // indirect
	github.com/pion/transport/v2 v2.2.10 // indirect
	github.com/pion/transport/v3 v3.0.7 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_model v0.6.1 // indirect
	github.com/prometheus/common v0.62.0 // indirect
	github.com/prometheus/procfs v0.15.1 // indirect
	github.com/shirou/gopsutil v3.21.4-0.20210419000835-c7a38de76ee5+incompatible // indirect
	github.com/spaolacci/murmur3 v1.1.0 // indirect
	github.com/tklauser/go-sysconf v0.3.12 // indirect
	github.com/tklauser/numcpus v0.6.1 // indirect
	github.com/waku-org/go-discover v0.0.0-20251003191045-8ee308fe7971 // indirect
	github.com/waku-org/go-waku v0.10.1 // indirect
	github.com/wlynxg/anet v0.0.5 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	golang.org/x/exp v0.0.0-20250128182459-e0ece0dbea4c // indirect
	golang.org/x/net v0.43.0 // indirect
	golang.org/x/sync v0.16.0 // indirect
	golang.org/x/sys v0.35.0 // indirect
	golang.org/x/time v0.9.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	lukechampine.com/blake3 v1.3.0 // indirect
)
