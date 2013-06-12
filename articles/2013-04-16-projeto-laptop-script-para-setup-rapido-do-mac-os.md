---
title: Projeto Laptop, script para setup rapido do Mac OS
date: 16/04/2013
author: Duke

Há tempos venho acompanhando o projeto [thoughtbot/laptop](https://github.com/thoughtbot/laptop) no github, o projeto é um script que já baixa e configurar ferramentas/bibliotecas, coisas que normalmente são utilizadas por desenvolvedores. Coisas como ImageMagick, Homebrew, Heroku Toolbelt, etc. A uns dois anos atras eu criei [um gist](https://gist.github.com/dukex/1035129) que era parecido, fix esse gist enquanto configurava o novo computador, e ia atualizando a cada novo set up.

Estava com um computador zerado e resolvi usar o [thoughtbot/laptop](https://github.com/thoughtbot/laptop), mas não uso o postgres do homebrew e gostaria de adicionar varias coisas que instalo sempre nos meus computadores, iTerm2, por exemplo. Então resolvi fazer um fork do [thoughtbot/laptop](https://github.com/thoughtbot/laptop) para [vertigem/lapto](https://github.com/vertigem/laptop).

Fazendo um diff o que modifiquei foi o seguinte:

\+ [iTerm2](http://www.iterm2.com), prefiro o iterm2 ao Terminal.app, alem do comandos tem split de telas e varias outras coisas

\+ [dukex/oh-my-zsh](https://github.com/dukex/oh-my-zsh), o projeto da thoughtbot já instala e configura o zsh, mas sem o oh-my-zsh

\+ [dukex/dotfiles](https://github.com/dukex/dotfiles), eu esse projeto e removi varias coisas do meu projeto dotfile, hoje ele tem um gitconfig, gemrc e um vimrc

\+ [dukex/vimfiles](https://github.com/dukex/vimfiles), mesmo usando o Sublime Text 2 para muito coisa, gosto de ter meu vim configurado, volta e meia uso ele

\+ [Sublime Text 2](http://www.sublimetext.com/2), alem de baixa o Sublime, ele configura com o [dukex/sublime-text-files](https://github.com/dukex/sublime-text-files)

\+ [Mou.app](http://mouapp.com), para quem gosta de escrever em Markdown, esse app é animal, estou usando ela agora ;)

\+ [Transmission.app](http://www.transmissionbt.com), quase sempre baixo algo via torrent, então meu script já vai instalar o meu client de torrent

\+ [Wunderlist](https://www.wunderlist.com), uso bastante o Wunderlist, não teria por que ficar de fora

\-+ Removi o postgres que ele instala via brew, para usar o [Postgres.app](http://postgresapp.com), acho melhor para subir e descer o server quando não precisar dele


Eu não vou mandar um pull-request para o repositorio da Thoughtbot, a não ser que exista algo que possa realmente ajudar eles, por que claramente a idéia deles não é a mesma que a minha, eles querem agilizar o processo de configuração para desenvolvedores, e eu já estou indo além disso.

