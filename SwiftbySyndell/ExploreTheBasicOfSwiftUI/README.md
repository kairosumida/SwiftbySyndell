<h1>Swift UI </h1><a href="https://www.swiftbysundell.com/basics/swiftui/">Veja no site</a>

O novo framework declarativo UI da apple, SwiftUI, oferece varias maneiras de costruir Views entre todas as plataformas da Apple.
Em vez de uma programação explicita onde cada view deve ser renderizada,  com Swift UI, em vez disso declaramos o que queremos que seja o resultado final da nossa interface de usuário - permitindo que aproveitemos a estrutura para fazer a maior parte do trabalho de renderização real para nós

Quando usamos SwiftUI, cada view é essencialmente uma descriçNao de uma unica peça de nossa UI - tanto em termos de como isso parece e o comportamento em termos de layout,
quando em como deve lidaar com intereções de usuário e outros eventos. Como um exemplo, aqui está uma ProductView que mostra informações sobre o produto dentro de um app de compras - em conformidade com o protocolo View do SwiftUI e em seguida retornando suas subviews atraves da sua propriedade de corpo computada



```Swift
struct ProductView: View {
    var product: Product

    var body: some View {
        // We'll render our product view as a vertical stack
        // containing the product's image, name, and price:
        VStack {
            Image(uiImage: product.image)
            Text(product.name)
            Text(product.price)
        }
    }
}
```
O que é interessante sobre a implementação acima, especialmente se comprado com o antigo framework da apple para escrever codigos UI(Como UIKit e AppKit), é que essas não continham uma instrução de layout, alem do seu VStack.
Essa é uma das grandes vantagens do SwiftUI - já que não estamos mais lidando com objetos de exibição que precisam ser posicionados e dimensionados explicitamente, mas com descrições de exibição, ele permite que o sistema tome muitos tipos diferentes de desições de layout por nós

Alem do VStack, o SwiftUI oferece dois outros tipos de pilha principais que podem ser usados para alavancar o seu sistema de layout automatico - HStack e ZStack. Por exemplo, aqui uma maneira que podemos agrupar nossos nomes e preço labels em um HStack para renderizá-los lado a lado, em vez de empilhá-los verticalmente
```Swift
struct ProductView: View {
    var product: Product

    var body: some View {
        VStack {
            Image(uiImage: product.image)
        
            HStack {
                Text(product.name)
                Text(product.price)
            }
        }
    }
}
```
  Finalmente, o tipo ZStack pode ser usado para empilhar views em profundidade - o que é muito útil ao adicionar algum plano de fundo a sua visualização. Por exemplo, veja como podemos dar ao nosso ProductView um plano de fundo gradiente, colocando um LinearGradient em cima do nosso VStack anterior e, em seguida, envolvendo ambos em um ZStack
  
```Swift
struct ProductView: View {
    var product: Product

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red, .blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(uiImage: product.image)
            
                HStack {
                    Text(product.name)
                    Text(product.price)
                }
            }
        }
    }
}
```
  
  Embora seja muito conveniente poder adicionar rapidamente todas as nossas visualizações em um só lugar, isso tende a ficar um pouco confuso quando atingimos um certo número de visualizações ou níveis de recuo. Felizmente, como o SwiftUI trata da construção de visualizações como blocos de construções semelhantes a componentes separados, extair parte de uma view em seu próprio tipo geralmente é bastante trivial.
  Vamos fazer exatamente isso e dividir nosso ProductView em duas subViews - uma para nosso gradiente e a outra para exibir nossas informações de produto
  
```Swift
struct ProductGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.red, .blue]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).edgesIgnoringSafeArea(.all)
    }
}

struct ProductInfoView: View {
    var product: Product

    var body: some View {
        VStack {
            Image(uiImage: product.image)
        
            HStack {
                Text(product.name)
                Text(product.price)
            }
        }
    }
}
```

  
  Com essas duas novas views funcionando, nos podemos agora simplesmente fazer com que o ProductView as componha em nossa interface do usuário final, tornando nosso código muito mais fácil de ler: 
  
```Swift
struct ProductView: View {
    var product: Product

    var body: some View {
        ZStack {
            ProductGradientView()
            ProductInfoView(product: product)
        }
    }
}
```
  
  Outra maneira que o SwiftUI nos permite criar custons views é aplicando modificadores já existenes. Por exemplo, veja como podemos usar modificadores para deixar o rótulo do nosso produtoem negrito, além de limitar o texto a duas linhas - e também alterar a cor do texto do rótudo de preço
  
  ```Swift
HStack {
    Text(product.name).bold().lineLimit(2)
    Text(product.price).foregroundColor(.white)
}
  ```
  Alem de definir como nossas views se parecerão em termos visuais, outro aspecto importante de qualquer tipo de desenvolvimento UI é acompanhar o estado - tanto quando se trata de lidar com entrada de usuário quando para garantir que nossa interface do usuário seja atualizada adequadamente a medida que nosso estado muda. Embora exploraremos todas as várias APIs de manipulação de estado do SwiftUI com muito mais detalhes nos próximos artigos, vamos começar dando uma olhada em como o novo grupo de propriedades @State pode ser usado para gerenciar o estado local em uma view.
  Digamos que queremos adicionar um stepper a nossa view de produtos que permita o usuario pegar o numero de itens a ser pedido. Para fazer isso, nos precisamos exibir a quantidade atual de itens e também modificá-la sempre que o usuário interagir com nosso stepper -
  em outras palavras, precisamos estabelecer uma ligação bidirecional entre nossa interface do usuário e o estado (a quantidade de itens) que isso depende.
  Como nosso estado só será lido e modificado por nossa view, vamos definir que ele usa a propriedade @State, que nos permitirá estabelecer essa ligação bidirecional entre nossa nova propriedade e o stepper que irá renderizá-la e modificá-la
  
 ```swift
 struct ProductView: View {
    var product: Product

    // Using the '@State' property wrapper we can define pieces
    // of state that are local (private) to the current view:
    @State private var quantity = 1

    var body: some View {
        ZStack {
            ProductGradientView()

            VStack {
                ProductInfoView(product: product)

                // Here we can both directly interpolate our value
                // into the stepper's label, and also bind it to
                // the stepper itself, enabling it to be modified:
                Stepper("Quantity: \(quantity)",
                    value: $quantity,
                    in: 1...99
                ).padding()
            }
        }
    }
}
 ```
  <Code> O motivo que usamos o prefixo $ na propriedade quantidade é que quando colocamos um valor no stepper. Precisamos passar a referencia ao @State</code>
  Está bem claro que o SwiftUI não é apenas uma nova estrutura UI - é uma mudança substancial de paradigma em termos de como os aplicativos são criados para as plataformas da Apple. Definitivamente, levará um tempo para se acostumar e também levará um tempo para que padrões de boas praticas comuns e melhores surjam, já que muitos dos padrões que pode ter usado no passado não será diretamente compativel com o SwiftUI declarativo.
  Mas é realmente excitante trabalhar com desenvolvimento apple nesse momento, não é?
  . 
