package test

type Example interface {
	HelloWorld() string
}

type test struct {
	ex Example
}

func (t test) Run() string {
	return t.ex.HelloWorld()
}
