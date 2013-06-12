---
title: toto em jruby
date: 14/05/2013
author: Duke

Para quem não conhece o toto, vai uma descrição rápida:

	toto is a git-powered, minimalist blog engine for the hackers of Oz. The engine weighs around ~300 sloc at its worse. There is no toto client, at least for now; everything goes through git.

Estou usando o toto nesse blog e como ando brincando com jruby, resolvi portar o toto para jruby.

A primeira coisa foi habilitar as gems para a plataforma ```java``` e desabilitar para as ```mri```, veja em [426525](https://github.com/vertigem/toto/commit/4265250071ca93e7c004bb3c2a4e504cdc098ad4). A sorte foi que o toto já tinha um suporte para a roda no windows, com as gems nativas em C desabilitada

Depois foi a vez do .gemspec, o toto usa o jeweler, uma gem que muitos usam, principalmente antes do comando ```bundle gem```, para administrar sua gem, com meu ruby definido para jruby, rodei o comando para gerar novamente o .gemspec, veja em [fe6fb6](https://github.com/vertigem/toto/commit/fe6fb6fc2fb16e43613ec813f8b7a80354e305a9)

O ultimo problema aconteceu com os parametros das gem que gera o mardown em html, já existia um pull-request só utilizei ele, veja em [d6bc84](https://github.com/vertigem/toto/commit/d6bc8418ca42d88e6ec26dbf28034f249fa0c249)

No repositório do meu blog, atualizei meu ```Gemfile```([4f145cba](https://github.com/vertigem/vertigem.xxx/commit/4f145cba00a0646668e59c43af4d03f7da0adb34)) para algo assim:


	source 'http://rubygems.org'

	ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.3'
	gem 'toto', github: 'vertigem/toto', branch: 'jruby-support'
	gem 'puma'


Pronto, mandei para o heroku e toto está rodando com jruby

