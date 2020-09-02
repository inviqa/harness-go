package main

import (
	"context"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	log "github.com/sirupsen/logrus"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	var srv http.Server
	httpWait := make(chan struct{})
	log.SetFormatter(&log.JSONFormatter{})
	log.Info("service running")

	http.Handle("/metrics", promhttp.Handler())
	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte(`{"status": "OK"}`))
	})

	go func() {
		stop := make(chan os.Signal, 1)
		signal.Notify(stop, syscall.SIGINT, syscall.SIGTERM)
		<-stop
		log.Info("shutting down HTTP server")
		ctx, _ := context.WithTimeout(context.Background(), 10*time.Second)
		if err := srv.Shutdown(ctx); err != nil {
			log.Errorf("HTTP server did not shutdown correctly: %s", err)
		}
		close(httpWait)
	}()

	if err := srv.ListenAndServe(); err != http.ErrServerClosed {
		log.Fatalf("failed to start HTTP server: %s", err)
	}

	<-httpWait
}
