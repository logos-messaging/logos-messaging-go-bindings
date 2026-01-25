package common

import (
	"crypto/sha256"
	"encoding/binary"
	"encoding/hex"
	"errors"
	"fmt"
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

func ToMessageHashFromStringFormat(val string) (MessageHash, error) {
	if len(val) == 0 {
		return MessageHash{}, errors.New("empty message hash string not allowed")
	}

	if len(val) < 2 || val[:2] != "0x" {
		return MessageHash{}, errors.New("string must start with 0x")
	}

	// Remove "0x" prefix for hex decoding
	hexStr := val[2:]

	// Verify the remaining string is valid hex
	v, err := hex.DecodeString(hexStr)
	if err != nil {
		return MessageHash{}, fmt.Errorf("invalid hex string: %v", err)

	}
	return MessageHash(v), nil
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
