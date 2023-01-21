.PHONY: build clean deploy gomodgen start

build: gomodgen
	export GO111MODULE=on
	go mod tidy
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

clean:
	rm -rf ./bin ./vendor go.sum

deploy: clean build
	sls deploy --verbose

destroy:
	sls remove

start:
	sls offline --useDocker start

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh