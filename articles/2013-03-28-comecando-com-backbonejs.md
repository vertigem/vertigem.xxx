---
title: Começando com Backbone.js
date: 28/03/2013
author: Duke



Antes de começar posts mais complexos sobre o backbone.js vou tentar mostrar o básico dele, vejo que algumas pessoas se confundem nas nomenclaturas que ele usa, então vamos ver alguns conceitos:

### Models
Os models é onde vai a grande parte, se não toda, regra de negócio da aplicação, é nele que temos validações e as interações com os dados, os models são nomeados. Vamos usar o exemplo de um Blog no decorrer desse artigo, em um Blog `Post` e `Category` são considerados models.

Para criar um model, extende-se `Backbone.Model`[^1], com isso temos as funcionalidade básicas. Se tivermos trabalhando com uma API, o atributo ``url`` pode ser usado para colocarmos nosso endpoint.

<pre><code class='javascript'>var Post = Backbone.Model.extend({
    url: "http://api.project.com/v1/posts",
});</code></pre>

#### criando um recurso
Para criar um recurso podemos simplesmente passar os atributos para uma nova instancia da classe `Post` e após isso chamar o método ```save``` para enviar nossos dados para API.

<pre><code class='javascript'>var post = new Post({title: "Backbone"});
post.save();</code></pre>

O método ```save``` do backbone, enviara uma requisição tipo POST(http) para a url definida no model.

#### get
O método ```get``` do `Backbone.Model` retorna o valor de um atributo do model.
<pre><code class='javascript'>post.get('title'); // Backbone</code></pre>

#### set
O método ```set``` do ```Backbone.Model``` é usado para modificar um atributo do model.
<pre><code class='javascript'>post.get('title') // Backbone
post.set('title', 'Começando com Backbone');
post.get('title') // Começando com Backbone</code></pre>

O `set` não salva o valor na API, para confirmar a alteração, basta chamar o método `save`

<pre><code class='javascript'>post.save();</code></pre>


[^1]: http://backbonejs.org/#Model


### Collections
As Collections do backbone pode, no começo, confundir, mais basicamente uma Collection é apenas um set ordenado de models, se em um blog `Post` é um model, então `Posts`(plural) seria uma collection.

Para criar uma collection, extende-se `Backbone.Collection`[^2], definimos também que models pertence aquela collection passando a classe do mesmo com o atributo `model`, novamente se uma API estiver sendo usada, o atributo `url` deve ser definido

<pre><code>var Posts = Backbone.Collection.extend({
    model: Post,
    url: "http://api.project.com/v1/posts"
});</code></pre>

[^2]: http://backbonejs.org/#Collection

#### constructor

O método construtor de uma collection recebe um array com os valores dos models

<pre><code>var blog = new Posts([{title: "Começando com Backbone"},
{title: "Brincando com Node.js"}]);</pre></code>

Com isso criamos dois Post, um com o titulo 'Começando com Backbone', e outro 'Brincando com Node.js'.

Vamos entender mais um pouco isso. Quando passamos o array de objeto para a collection pense que ele pegou cada objeto e criou um Post(que é o model que passamos), então ele fez:

<pre><code class='javascript'>new Post({title: "Começando com Backbone"});
new Post({title: "Brincando com Node.js"});</code></pre>

Esses models ele salvou na variável ```models``` da collection

#### models
A variável models da collection é onde estão os models que pertence a essa collection, lembrando que uma collection é apenas um set de models, continuando nosso exemplo vamos ver o que temos na variavel `models` da nossa collection `blog`

<pre><code class='javascript'>console.log(blog.models)

[ {attributes: Object
  changed: Object
  cid: "c1"
  collection: Object},
  {attributes: Object
  changed: Object
  cid: "c2"
  collection: Object}
]</code></pre>r


#### outros metodos
Uma collection tem uma serie de metodos para trabalhar com os modelos, como [push](http://backbonejs.org/#Collection-push) que adiciona um model para collection, [get](http://backbonejs.org/#Collection-get) que retorna um model pelo id, [sort](http://backbonejs.org/#Collection-sort) para reordenar os models, [where](http://backbonejs.org/#Collection-where) que retorna um array com todos os models da collection que casar com a busca, [entre outros](http://backbonejs.org/#Collection)

### Routes
O Routes será responsável por organizar as rotas da aplicação, basicamente tenta casar a rota da pagina com algum método que chama, provavelmente, uma ` jView`


### Views

### Templates



