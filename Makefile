.PHONY: build clean deploy gomodgen

build: 
	export GO111MODULE=on
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go

clean:
	rm -rf ./bin ./vendor go.sum

deploy: build
	sls deploy --stage local 

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
