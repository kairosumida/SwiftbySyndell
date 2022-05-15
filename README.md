# SwiftbySyndell
Estudos desse site https://www.swiftbysundell.com/articles/

<p>1 - Gostaria de um aplicativo que tenha alguns desses articles</p>
<p>2 - Com uma pagina inicial e um botão que leve para o resultado criado no exercicio</p>

<h1>Planejamento</h1>
<p>1 - Acredito que preciso de uma navigationView</p>
<p>2 - Uma ScroolView para podermos scrollar para baixo caso tenha muitos exercicios</p>
<p>3 - Um texto com link para direcionar a outra navigationView</p>
<p>4 - Uma View com o conteudo criado</p>
<p>Obs: Creio que precisarei de uma ViewModel com um Router que implementa varias rotas. Pois se tiver varios exercicios terá varias views</p>

<h1>Problema 1</h1>
<p> Nao consegui criar um navigation link um abaixo do outro. Depois de colocar 5 elementos VStack comeca a da erro</p>
<p> Vou tentar aprender a criar uma listView</p>

<h1> Descoberta </h1>
Não posso usar list pelo menos não de uma maneira facil, por que cada item da lista, direciona para uma view diferente. E não uma pagina igual que muda apenas alguns campos.
E ter um arquivo Json com o nome não ajuda em nada
</p>
<p>Apesar de List com um arquivo Json não ser tão eficiente para mostrar paginas completamente diferentes</p>
<p>Usei o seguinte modelo, cada exercicio tem um id. E quando o probrama abre ele mostra todos os exercicos realizados na ordem do id</p>
<p>Assim que clica em um elemento um switch case verifica o id e direciona para uma pagina criada</p>
<p>Ou seja, sempre que um exercicio for criado, é necessario criar um case e chamar a view do exercicio</p>

