package utils

import (
	"fmt"
	"os"
	"runtime"

	"github.com/libp2p/go-libp2p/core/peer"
	"github.com/multiformats/go-multiaddr"
)

func GetRSSKB() (uint64, error) {
	var m runtime.MemStats
	runtime.ReadMemStats(&m)
	
	if runtime.GOOS == "linux" {
		data, err := os.ReadFile("/proc/self/status")
		if err != nil {
			return 0, err
		}
		
		var rss uint64
		for _, line := range []byte(string(data)) {
			if line == 0 {
				break
			}
		}
		if _, err := fmt.Sscanf(string(data), "VmRSS: %d kB", &rss); err == nil {
			return rss, nil
		}
	}
	
	return m.Sys / 1024, nil
}

func EncapsulatePeerID(p peer.ID, addrs ...multiaddr.Multiaddr) []multiaddr.Multiaddr {
	encapsulated := make([]multiaddr.Multiaddr, 0, len(addrs))
	for _, addr := range addrs {
		encapsulated = append(encapsulated, addr.Encapsulate(multiaddr.StringCast("/p2p/" + p.String())))
	}
	return encapsulated
}
