---
title: Introdução ao Sass
date: 05/07/2013
author: Duke

O que é o Sass? de acordo com o [site do sass](sass-lang.com):

<blockquote>Sass é uma meta-linguagem em cima do CSS que usada para descrever documentos de estilo de forma limpa e estruturada, com mais poder do que o CSS permite.</blockquote>

O **Sass** não é uma linguagem de programação, não tem nada haver com OOCSS, Sass é uma meta-linguagem ou um pré-processador, o Sass tem um compilador que escreve CSS. O Sass é um tanto antigo já, um cara chamado [Hampton Catlin](http://www.hamptoncatlin.com) o criou lá em meados de 2008. Está atualmente na sua versão 3.2.9.


### Instalação

Para instalar o sass você precisa ter o rubygems instalado, o rubygems é um gerenciador de bibliotecas para quem trabalha com a linguagem Ruby. Para quem usa Mac OS, o rubygems já está instalado, para quem não usa segue o [link para instalar o Rubygems](http://rubygems.org/pages/download), se seu sistema operacional tem algum sistema de pacotes, deve ter o rubygems lá, eu sugiro usa-lo.

Com o rubygems instalado basta rodar no terminal:

<pre><code class="shell">$ gem install sass</code></pre>

Pronto! O sass esta instalado.

### Sobre AS syntax do sass

Antes de começar entendam uma coisa, o Sass tem duas formas de ser escrito, duas syntax, a forma *sass* e a *scss*. A *sass* é uma outra forma de escrever css, entre as diferenças utiliza tabulações e não se usa ponto e virgula no final, é a syntax original do Sass. A *scss* nasceu na [versão 3](http://sass-lang.com/docs/yardoc/file.SASS_CHANGELOG.html#3-0-0) ela é um superset do CSS, ou seja, você escreve CSS mas com as funcionalidades do SASS, você pode pegar qualquer arquivo CSS que ele é valido como um SCSS. Se você está se perguntando *'Qual é a melhor forma?'*, o post [Sass vs. Scss: Which Syntax is Better](http://thesassway.com/articles/sass-vs-scss-which-syntax-is-better) pode ajudar, eu acredito que depende de cada um, minha preferencia é escrever com a syntax sass sempre!


### Usando Sass

Para demonstrar na prática como usar o Sass peguei um pedaço estratégico de css do artigo chamado [Slider with Sliding Backgrounds](http://css-tricks.com/slider-with-sliding-backgrounds/)(CSS Tricks)

Então temos um arquivo chamado <code>hello-word.css</code> assim:

<pre><code class="css sass">.slider {
  overflow-x: scroll;
}
.slide {
  float: left;
  width: 300px;
  height: 500px;
  position: relative;
  background-position: -100px 0;
}
.slide:before {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 40%;
  background: linear-gradient(transparent, black);
}
.slider-nav a {
  width: 10px;
  height: 10px;
  display: inline-block;
  background: #ddd;
  overflow: hidden;
  text-indent: -9999px;
  border-radius: 50%;
}
.slider-nav a.active {
  background: #999;
}</code></pre>


#### Nesting
Como eu disse, o scss é compatível com o css, então vamos apenas mudar a extensão do arquivo para .scss e já podemos começar. A primeira feature do sass é os aninhamento, você não precisa repetir toda hora um seletor pai. POR FAVOR USA ISSO COM MUITO CUIDADO.

Vamos ver como fica, agora nosso arquivo <code>hello-word.scss</code>

<pre><code>.slider {
  overflow-x: scroll;
  .slide {
    float: left;
    width: 300px;
    height: 500px;
    position: relative;
    background-position: -100px 0;
  }
  .slide:before {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 40%;
    background: linear-gradient(transparent, black);
  }
}
.slider-nav{
  a {
    width: 10px;
    height: 10px;
    display: inline-block;
    background: #ddd;
    overflow: hidden;
    text-indent: -9999px;
    border-radius: 50%;
  }
  a.active {
    background: #999;
  }
}</code></pre>

Ótimos usamos os aninhamentos, no nosso exemplo não temos muitos ganhos nem perdas, mas aninhamento pode tanto ajudar como atrapalhar, use com cuidado, é interessante não passar do 3º nível. Lembrando que sempre o css gerado será igual o nosso inicial.

No sass podemos usar o **&** para referenciar o seletor atual, por exemplo, em:

<pre><code>.slider {
  &amp;.hide{
    # aqui é o seletor '.slider.hide'
  }
}</code></pre>


O que podemos fazer com isso no nosso exemplo? veja você mesmo:

<pre><code>.slider {
  overflow-x: scroll;
  .slide {
    float: left;
    width: 300px;
    height: 500px;
    position: relative;
    background-position: -100px 0;
    &amp;:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 40%;
      background: linear-gradient(transparent, black);
    }
  }
}
.slider-nav{
  a {
    width: 10px;
    height: 10px;
    display: inline-block;
    background: #ddd;
    overflow: hidden;
    text-indent: -9999px;
    border-radius: 50%;
    &amp;.active {
      background: #999;
    }
  }
}</code></pre>

#### Variáveis

Para escrever uma variável no sass é fácil, e pode ser muito útil, por exemplo: Você pode criar um esquema de cor com variáveis, se precisa altera você altera em um lugar só. Um exemplo básico:

<pre><code class="css">$main_color: #b23755;
p{
  color: $main_color
}</code></pre>

Mas o sass te permite fazer algo ainda mais interessante, cálculos matemáticos com as variáveis, veja só:

<pre><code>$main_color: #b23755;
$margin: 16px;

p{
  color: $main_color;
  margin: $margin / 2
}</code></pre>

O resultado será:

<pre><code class="css">p{
  color: #b23755;
  margin: 8px
}</code></pre>

Vamos brincar com isso no nosso exemplo, vou definir uma variável e usa-la para calcular os tamanho dos elementos.

<pre><code>$base_width: 300px;
$base_height: 500px;

.slider {
  overflow-x: scroll;
  .slide {
    float: left;
    width: $base_width;
    height: $base_height;
    position: relative;
    background-position: -100px 0;
    &amp;:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 40%;
      background: linear-gradient(transparent, black);
    }
  }
}
.slider-nav{
  a {
    width: $base_width / ($base_width / 10px);
    height: $base_height / ($base_height / 10px);
    display: inline-block;
    background: #ddd;
    overflow: hidden;
    text-indent: -9999px;
    border-radius: 50%;
    &amp;.active {
      background: #999;
    }
  }
}</code></pre>

#### Mixins

Mixins é uma forma de reutilizar pedaços códigos, imagina que precisamos criar um botão e ele só será usado em alguns lugares, fazemos assim:

<pre><code>@mixin button{
  padding: 15px 30px;
  border: 1px solid #000;
  background: linear-gradient(to bottom, #999, #000);
  &amp;:active{
    position: relative;
    top: 1px;
  }
}

form input[type='submit']{
  @include button;
}</code></pre>

Nosso input submit tem as instruções que definimos no mixin button, no nosso exemplo vamos usar algo mais completo, fazer o mixin receber um parâmetro.

<pre><code>$base_width: 300px;
$base_height: 500px;

@mixin size_with_base($base_calc){
  width: $base_width / ($base_width/$base_calc);
  height: $base_height / ($base_height/$base_calc);
}

.slider {
  overflow-x: scroll;
  .slide {
    float: left;
    width: $base_width;
    height: $base_height;
    position: relative;
    background-position: -100px 0;
    &amp;:before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 40%;
      background: linear-gradient(transparent, black);
    }
  }
}
.slider-nav{
  a {
    @include size_with_base(10px);
    display: inline-block;
    background: #ddd;
    overflow: hidden;
    text-indent: -9999px;
    border-radius: 50%;
    &amp;.active {
      background: #999;
    }
  }
}</code></pre>

#### Herança

No sass você pode herdar tudo de um seletor em outro, lembra que o sass gera css, então, basicamente o que ele faz é não precisar que você declare mais de uma vez uma estilo. Vou usar um exemplo um pouco melhor do que nosso exemplo.

<pre><code>.alert{
  border: 1px solid #CCC;
  padding: 15px 20px;
  color: #000;
  text-align: center;
  background: #EEE;
}

.alert-success{
  @extend .alert;
  background: #0E0;
  border-color: #0C0;
}

.alert-error{
  @extend .alert;
  background: #E00;
  border-color: #C00;
}</code></pre>

Esse código assim, onde `.alert-success` e `.alert-error` estendem ou herdam as definições de `.alert` fica assim:

<pre><code class="css">.alert, .alert-success, .alert-error {
  border: 1px solid #CCC;
  padding: 15px 20px;
  color: #000;
  text-align: center;
  background: #EEE; }

.alert-success {
  background: #0E0;
  border-color: #0C0; }

.alert-error {
  background: #E00;
  border-color: #C00; }</code></pre>


### Usando sass

Existe algumas formas para utilizar **sass** no seus projetos, vou apresentar algumas delas

#### Sass Command Line

Quando você baixa o sass peli rubygems(```$ gem install sass```) a instala  o comando ```sass``` para gerar seus arquivos .css.

De um arquivo sass para um css:
<pre><code>$ sass app/stylesheets/my.sass public/stylesheets/my.css</code></pre>

Normalmente quando se está desenvolvendo é melhor usar o parâmetro ```--watch```, qualquer mudanças nos arquivos sass ele automaticamente gera o css, e bem simples basta passar a pasta dos arquivos sass e a pasta dos arquivos css.

<pre><code>$ sass --watch app/stylesheets:public/stylesheets</code></pre>

#### Codekit (Mac)

O [Codekit](http://incident57.com/codekit/) faz bastante coisa, uma delas é converter de forma fácil seus arquivos sass para css. Eu não uso, nem nunca usei. Mas é uma ferramenta bem conhecida.


---

Alem disso, quem trabalha com Rails sabe que o por padrão ele suporta, para outros frameworks em Ruby(Rack), como Sinatra, existe a gem [sprockets-sass](https://github.com/petebrowne/sprockets-sass) que faz o processo ficar transparente.

***<a href="https://plus.google.com/109270548417191996419?rel=author">- Duke</a>***