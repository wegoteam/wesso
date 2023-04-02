package main

import (
	hello "github.com/wego2023/wesso/api/kitex_gen/hello/hello"
	"log"
)

func main() {
	svr := hello.NewServer(new(HelloImpl))

	err := svr.Run()

	if err != nil {
		log.Println(err.Error())
	}
}
