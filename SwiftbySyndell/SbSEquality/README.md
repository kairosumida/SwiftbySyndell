<h1>Equality</h1>
Verificando se dois objetos ou valores são considerados iguais é definitivamente uma das operações mais comum na programação. Então nesse artigo, vamos dar uma olhada em como o Swift modela o conceito de igualdade e como esse modelo varia entre os tipos de valor e referencia
Um dos aspectos mais interessantes na comparação com swift é que tudo é feito de uma maneira muito orientada a protocolos - o que significa que qualquer tipo pode se tornar comparaveis em conformidade com o protocolo Equatable, que pode ser feito assim:

```Swift
struct Article: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title && lhs.body == rhs.body
    }

    var title: String
    var body: String
}
```

A maneira como estamos em conformidade com o Equatable no exemplo acima é implementando uma sobrecarga do operador ==, que aceita os dois valores para comparar (lhs, o valor do lado esquerdo e rhs, o valor do lado direito), e em seguida, retorna um resultado booleano se esses dois valores devem ser considerados iguais.
A boa notícia é que normalmente não temos que escrever esses tipos de sobrecargas de operador == já que o compilador é capaz de sintetizar automaticamente essas implementações sempre que as propriedades armazenadas de um tipo forem todas iguais.
Portanto, no caso do tipo de artigo acima, podemos remover nosso codigo de verificação de igualdade manual e simplesmente fazer com que esse tipo fique assim: 

```Swift
struct Article: Equatable {
    var title: String
    var body: String
}
```

Pelo fato do swift ser orientado a protocolo, tambem nos da um poder enorme para trabalharmos com tipos genericos. Por exemplo, uma coleção Equatable-conforming com os valores(como um Array ou um Set) automaticamente são considerados comparaveis. - sem exigir nenhum código adicional de nossa parte:

```Swift
let latestArticles = [
    Article(
        title: "Writing testable code when using SwiftUI",
        body: "..."
    ),
    Article(title: "Combining protocols in Swift", body: "...")
]

let basicsArticles = [
    Article(title: "Loops", body: "..."),
    Article(title: "Availability checks", body: "...")
]

if latestArticles == basicsArticles {
    ...
}
```

A maneira como esses tipos de verificações de igualdade funcionam é por meio do recurso de conformidades condicionais do Swift, que permite que um tipo esteja em conformidade com um protocolo somente quando determinadas condições forem atendidas. Por exemplo, veja como o tipo Array do Swift está em conformidade com o Equatable apenas quando os elementos que estão sendo armazenados em um determinado array também são, em conformidade com o Equatable - que é o que nos permite verificar se dois arrays Article são considerados iguais:

```Swift
extension Array where Element: Equatable {
    ...
}
```

Como nenhuma das lógicas acima é codificada no próprio compilador, também podemos utilizar exatamente a mesma técnica baseada em conformidades condicionais se quisermos tornar nossos próprios tipos genéricos também condicionalmente equacionáveis. Por exemplo, nossa base de código pode incluir algum tipo de grupo que pode ser usado para rotular um grupo de valores relacionados:

```Swift
struct Group<Value> {
    var label: String
    var values: [Value]
}
```

Pra fazer esse Group ter um tipo em conformidade com o Equatable, quando este é usado para armazenar valores Equatable, simplesmente precisamos escrever essa vazia estenção, que parece identica a extensão do Array que vamos dar uma okhada abaixo

```Swift
extension Group: Equatable where Value: Equatable {}
```

Como em baixo, podemos verificar se os valores dos 2 Article - baseado em Group são iguais, assim como poderiamos quando usamos Array

```Swift
let latestArticles = Group(
    label: "Latest",
    values: [
        Article(
            title: "Writing testable code when using SwiftUI",
            body: "..."
        ),
        Article(title: "Combining protocols in Swift", body: "...")
    ]
)

let basicsArticles = Group(
    label: "Basics",
    values: [
        Article(title: "Loops", body: "..."),
        Article(title: "Availability checks", body: "...")
    ]
)

if latestArticles == basicsArticles {
    ...
}
```

Assim como as coleções, as Tuplas no swift tambem podem ser marcadas para ser comparaveis quando todos os valores estão marcados com Equatable

```Swift
let latestArticles = (
    first: Article(
        title: "Writing testable code when using SwiftUI",
        body: "..."
    ),
    second: Article(title: "Combining protocols in Swift", body: "...")
)

let basicsArticles = (
    first: Article(title: "Loops", body: "..."),
    second: Article(title: "Availability checks", body: "...")
)

if latestArticles == basicsArticles {
    ...
}
```

No entanto, no exemplo abaixo as coleções não são consideradas iguais automaticamente em conformidade com Equatable. então. se colocarmos duas tuplas em identicas arrays, as duas não são consideradas como iguais:

```Swift
let firstArray = [latestArticles, basicsArticles]
let secondArray = [latestArticles, basicsArticles]

// Compiler error: Type '(first: Article, second: Article)'
// cannot conform to 'Equatable':
if firstArray == secondArray {
    ...
}
```

A razão para que não funciona(pelo menos não pronto para uso) é porque - como a mensagem do compilador emitida alude - as tuplas não podem estar em conformidade com os protocolos, o que significa que a extensão Array em conformidade com Equatable que pegamos não terá efeito.
No entanto, existe uma maneira de fazer o trabalho acima e embora eu pense que o codigo genérico não pertença a um arigo "Básico", ainda pensei que valeria a pena dar uma olhada rápida - já que ilustra apenas quão flexiveis são as verificações  de igualdade do Swift e que não estamos limitados apenas a implementar uma única == sobrecarga para estar em conformidade com Equatable
Portanto, se adicionarmos outra sobrecarga == personalizada, especificamente para matrizes que contêm tuplas de dois elementos equacionáveis, o exemplo de. código acima será compilado com sucesso: 

```Swift
extension Array {
    // This '==' overload will be used specifically when two
    // arrays containing two-element tuples are being compared:
    static func ==<A: Equatable, B: Equatable>(
        lhs: Self,
        rhs: Self
    ) -> Bool where Element == (A, B) {
        // First, we verify that the two arrays that are being
        // compared contain the same amount of elements:
        guard lhs.count == rhs.count else {
            return false
        }

        // We then "zip" the two arrays, which will give us
        // a collection where each element contains one element
        // from each array, and we then check that each of those
        // elements pass a standard equality check:
        return zip(lhs, rhs).allSatisfy(==)
    }
}
```

Atá agora, nos concentramos em como os tipos de valor (como structs) se comportam quando verificados quanto à igualdade, mas e os tipos de referência? Por exemplo, digamos que agora decidimos transformar nossa estrutura Article anterior em uma classe, como isso afetaria sua implementação Equatable?

```Swift
class Article: Equatable {
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
```

A primeira coisa que notamos ao realizar a alteração acima é que o compilador não é capaz de sintetizar automaticamente a conformidade Equatable do nosso tipo - já que esse recurso é limitado a tipos de valor. Portanto, se quisessemos que nosso tipo de artigo permanecesse uma classe, teriamos que implementar manualmente a== sobrecarga que o Equatable requer, assim como fizemos no início deste artigo:

```Swift
class Article: Equatable {
    static func ==(lhs: Article, rhs: Article) -> Bool {
    lhs.title == rhs.title && lhs.body == rhs.body
}

    var title: String
    var body: String

    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
```

No entanto, as classes que são subclasses de qualquer tipo de classe baseada em Objective-C herdam uma implementação Equatable padrão de NSObject(que é a classe base raiz para quase todas as classes Objective-C). Então, se fossemos tornar nossa classe Article uma subclasse NSObject, ela se tornaria Equatable sem exigir estritamente que implementássemos uma sobrecarga == customizada:

```Swift
class Article: NSObject {
    var title: String
    var body: String

    init(title: String, body: String) {
        self.title = title
        self.body = body
        super.init()
    }
}
```

Embora passa ser tentador usar a técnica de subclasse abaixo para evitar ter que escrever código de verificação de igualdade personalizado, é importante ressaltar que a unica coisa que a implementação Equatable fornecida por Objective-C padrão fará é verificar se das classes são as mesmas instancias - não se contiverem os mesmos dados. Portanto, mesmo que as duas instancias de Article a seguir tenham o mesmo titulo e corpo, elas não serão consideradas iguais ao usar a abordagem baseada em NSObject abaixo:

```Swift
let articleA = Article(title: "Title", body: "Body")
let articleB = Article(title: "Title", body: "Body")
print(articleA == articleB) // false
```

Executar esses tipos de verificação de instancia pode ser realmente util - pois as vezes podemos querer verificar se duas referencias baseadas em classe apontam para a mesma instancia subjacente. No entanto não precisamos que nossa classes herdem de NSObject para fazer isso podemos usar o operador triplo- igual integrado no Swift === para realizar essa verificação entre duas referencias

```Swift
let articleA = Article(title: "Title", body: "Body")
let articleB = articleA
print(articleA === articleB) // true
```

