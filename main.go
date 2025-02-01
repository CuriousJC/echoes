package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	// Get request details
	host := r.Host
	method := r.Method
	url := r.URL.String()
	headers := r.Header

	// Print to console (for debugging)
	fmt.Println("Received request:")
	fmt.Println("Host:", host)
	fmt.Println("Method:", method)
	fmt.Println("URL:", url)
	fmt.Println("Headers:", headers)

	// Write response
	fmt.Fprintf(w, "Echoing request:\n")
	fmt.Fprintf(w, "Host: %s\n", host)
	fmt.Fprintf(w, "Method: %s\n", method)
	fmt.Fprintf(w, "URL: %s\n", url)
	fmt.Fprintf(w, "Headers:\n")

	for key, values := range headers {
		for _, value := range values {
			fmt.Fprintf(w, "  %s: %s\n", key, value)
		}
	}
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server started on port 8020")
	http.ListenAndServe(":8020", nil)
}
