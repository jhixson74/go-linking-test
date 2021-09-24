package main

import "C"
import "fmt"

//export TerraformMain
func TerraformMain() {
	fmt.Printf("terraform...\n")
}

func main() {
	return
}
