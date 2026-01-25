package common

import (
	"crypto/sha256"
	"encoding/binary"
	"hash"
	"sync"

	"github.com/ethereum/go-ethereum/common/hexutil"
)

// MessageHash represents an unique identifier for a message within a pubsub topic
type MessageHash [32]byte

func (h MessageHash) String() string {
	return hexutil.Encode(h[:])
}

func (h MessageHash) Bytes() []byte {
	return h[:]
}

// ToMessageHash converts a byte slice into a MessageHash
func ToMessageHash(b []byte) MessageHash {
	var result MessageHash
	copy(result[:], b)
	return result
}

var sha256Pool = sync.Pool{New: func() interface{} {
	return sha256.New()
}}

// SHA256 generates the SHA256 hash from the input data
func SHA256(data ...[]byte) []byte {
	h, ok := sha256Pool.Get().(hash.Hash)
	if !ok {
		h = sha256.New()
	}
	defer sha256Pool.Put(h)
	h.Reset()
	for i := range data {
		h.Write(data[i])
	}
	return h.Sum(nil)
}

func toBytes(i int64) []byte {
	b := make([]byte, 8)
	binary.BigEndian.PutUint64(b, uint64(i))
	return b
}
