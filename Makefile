.PHONY: docs
REPO:=github.com/intfoundation/go-events

docs:
	@go get github.com/davecheney/godoc2md
	godoc2md $(REPO) > README.md

test:
	go test -v ./...
