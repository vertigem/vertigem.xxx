---
title: ! 'rake routes no Grape '
date: 02/04/2013
author: Duke

Se está em busca de algo sobre o [Grape](https://github.com/intridea/grape), segue alguns links:

* [github.com/intridea/grape](http://github.com/intridea/grape)
* [Grape RDoc](http://rdoc.info/github/intridea/grape)
* [Grape Groups](https://groups.google.com/forum/?fromgroups#!forum/ruby-grape)
* [Grape Wiki](https://github.com/intridea/grape/wiki)


Para aqueles que sentem falta do ```rake routes``` do rails no grape, algumas linhas de códigos podem ajudar Cria primeiramente um ```Rakefile```, se não existir, agora adiciona a task:

<pre><code class='ruby'>desc "API Routes"
task :routes do
  MyProject::API.routes.each do |api|
    method = api.route_method.ljust(10)
    path = api.route_path
    puts "     #{method} #{path}"
  end
end</code></pre>

Lembrando que ```MyProject::API``` deve ser alterado para sua classe. Rodando ```rake routes``` ira ver algo assim:

<pre><code class='bash'>     GET        /resourceX(.:format)
     GET        /resourceX/:id(.:format)
     POST       /resourceX
     ...</code></pre>