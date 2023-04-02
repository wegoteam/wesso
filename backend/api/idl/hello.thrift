namespace go hello

struct Request {
  1: string message
}

struct Response {
  1: string message
}

service Hello {
    Response hello(1: Request req)
}
