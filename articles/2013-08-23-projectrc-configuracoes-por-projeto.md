---
title: ProjectRC, configurações por projeto
date: 23/08/2013
author: Duke

Tem bastante tempo que trabalho com duas aplicações ao mesmo tempo, normalmente uma api e outra o front-end.

Esses dias estava automatizando algumas coisas, sempre faço isso quando começo a ver que estou usando muito o mesmo comando ainda mais quando com os mesmos argumentos, criar alias nesse caso ajuda bastante, no meu [zshrc](https://github.com/dukex/oh-my-zsh/blob/master/zshrc) tem alguns como ```gc```(git commit), ```psgrep```(ps aux | grep), alem dos plugins do [oh-my-zsh](https://github.com/dukex/oh-my-zsh/tree/master/plugins) que quase sempre tem alias para coisas muito usadas.

Em projetos que rode ruby, o [rvm](https://rvm.io/) permite criar um grupo de gems(gemset) para cada projeto, mas o foco é a administração das versões do ruby, o [bundler](http://bundler.io/) em 10 de 10 projetos hoje é responsavel pelo controle das dependecias(gems) de cada projeto. Em python o [virtualenv](https://pypi.python.org/pypi/virtualenv) faz algo parecido, mas ele vai um pouco além no meu ver, como o nome sugere ele cria um ambiente virtual para cada projeto, altera variaveis de ambiente, versão do python, etc.

Foi pensando nisso que criei uma forma MUIIITOO simples para em cada projeto eu ter por exemplo uma configuração da JVM adequada, ou alguns alias/funções etc. Criei um arquivo chamado .projectrc nos meus projetos, configurei algumas coisas como alias e algumas variaveis de ambiente do projeto, algo mais ou menos assim:

<pre><code class="bash">alias xrestart='pumactl -C tcp://127.0.0.1:9293 restart'
alias up='bundle exec jruby --ng -S puma -C .puma_config'
export ASYNC=false
export JAVA_OPTS="-d32 -Djruby.memory.max=384m -Xmx384m -Xms256m -Xss512k -XX:+PrintGCDetails"</code></pre>

Então uma função bem simples para ler esse arquivo:

<pre><code class="bash">function activate() {
  PROJECT_DIR=`pwd`
  PROJECT_RC=$PROJECT_DIR/.projectrc
  if [[ -a $PROJECT_RC ]]; then
    source $PROJECT_RC
  fi
  unset PROJECT_RC
  unset PROJECT_DIR
}</code></pre>

E agora toda vez que entro no projeto, rodo ```activate``` e meu projeto está com suas configurações costumizadas.

O código completo está no github em [dukex/projectrc](https://github.com/dukex/projectrc) não testei ele fora do zsh no mac, mas creio que não tenha problemas em outros sistemas.

#### Update

Usando o código do repositório não é necessario rodar ```activate```, quando entra na pasta do projeto e tem um arquivo ```.projectrc``` automaticamente ele é chamado.


#### Extra

Para saber o Top 10 comandos mais usados rode:

<pre><code class="bash">$ history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10</code></pre>
Fonte: [How do I see what my most used linux command are?](http://superuser.com/a/250230)

Alguns comandos dessa lista certamente podem ser mais automatizado e com isso você ganha tempo.

***<a href="https://plus.google.com/109270548417191996419?rel=author">- Duke</a>***
