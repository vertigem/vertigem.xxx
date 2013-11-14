---
title: Golang, uma introdução
date: 13/11/2013
author: Duke

Postei um video falando um pouco sobre o **Go(golang)**

<object width="800" height="450"><param name="movie" value="//www.youtube.com/v/t9ZRqtokVgQ?hl=en_US&amp;version=3"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/t9ZRqtokVgQ?hl=en_US&amp;version=3" type="application/x-shockwave-flash" width="800" height="450" allowscriptaccess="always" allowfullscreen="true"></embed></object>



#### Código final:

<pre><code class='go'>package main

import "fmt"

type Message struct {
  name string
  body string
}

func NewMessage(name string, body string) (message *Message) {
  return &nbsp;Message{ name: name, body: body }
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
  fmt.Scan(&nbsp;name)

  message := NewMessage(name, "")
  err := message.GoDuke()

  if err {
    fmt.Println("Olá", name)
  } else {
    fmt.Println(message.body)
  }
}</code></pre>

***<a href="https://plus.google.com/109270548417191996419?rel=author">- Duke</a>***
