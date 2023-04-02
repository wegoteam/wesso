package main

import (
	"context"
	hello "github.com/wego2023/wesso/api/kitex_gen/hello"
)

// HelloImpl implements the last service interface defined in the IDL.
type HelloImpl struct{}

// Hello implements the HelloImpl interface.
func (s *HelloImpl) Hello(ctx context.Context, req *hello.Request) (resp *hello.Response, err error) {
	// TODO: Your code here...
	return &hello.Response{Message: req.Message}, nil
}
