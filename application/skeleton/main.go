package main

import (
	"fmt"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Service running")

	http.Handle("/metrics", promhttp.Handler())
	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		w.WriteHeader(200)
		w.Write([]byte(`{"status": "OK"}`))
	})

	err := http.ListenAndServe(":80", nil)
	if err != nil {
		log.Fatalf("failed to start HTTP server: %s", err)
	}
}
