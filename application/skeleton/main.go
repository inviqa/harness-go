package main

import (
  "fmt"
  "github.com/prometheus/client_golang/prometheus/promhttp"
  "log"
  "net/http"
)

func main() {
  fmt.Println("Service running")

  startPrometheusHttpServer()
}

func startPrometheusHttpServer() {
  http.Handle("/metrics", promhttp.Handler())

  err := http.ListenAndServe(":2112", nil)
  if err != nil {
    log.Logger.Fatalf("failed to start prometheus HTTP server: %s", err)
  }
}
