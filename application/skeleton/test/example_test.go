package test

import (
	"github.com/golang/mock/gomock"
	"testing"
)

func TestTest_Run(t *testing.T) {
	ctrl := gomock.NewController(t)
	ex := NewMockExample(ctrl)
	ex.EXPECT().HelloWorld().Times(1).Return("HelloWorld!")

	tst := test{ex: ex}
	if output := tst.Run(); output != "HelloWorld!" {
		t.Errorf("expected Run() function to return 'HelloWorld!', got '%s'", output)
	}
}
