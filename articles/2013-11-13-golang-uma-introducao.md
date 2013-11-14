---
title: Golang, uma introdução
date: 13/11/2013
author: Duke

Postei um video falando um pouco sobre o **Go(golang)**

<iframe width="560" height="315" src="//www.youtube.com/embed/t9ZRqtokVgQ?rel=0" frameborder="0" allowfullscreen></iframe>


#### Código final:

<pre><code class="go">package main

import "fmt"

type Message struct {
  name string
  body string
}

func NewMessage(name string, body string) (message *Message) {
  return &Message{ name: name, body: body }
}

func (m *Message) GoDuke() (err bool) {
  if m.name == "Duke" {
    m.body = "Go Duke, Go!!!"
    return false
  }
  return true
}

func main() {
  var name string
  fmt.Scan(&name)

  message := NewMessage(name, "")
  err := message.GoDuke()

  if err {
    fmt.Println("Olá", name)
  } else {
    fmt.Println(message.body)
  }
}</code></pre>
