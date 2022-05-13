<h1> Swift clip: SwiftUI stacks and spacers</h1> <a href="https://www.swiftbysundell.com/clips/3/">Veja no site </a>


Vamos dar uma olhada em como as stacks e spacers do SwiftUI podem ser usados para obter muitos tipos de layouts flexiveis e adaptáveis com muito pouco codigo.
Embora o SwiftUI inclua várias APIs de laout mais avançadas, stacks e spacers são um otimo ponto de partida para a maiora das interfaces

<h2> Sample Code </h2>

Uma simples SwiftUI view que renderiza um texto no centro do seus parentes conteiners

```Swift
struct ContentView: View {
    var body: some View {
        Text("SwiftUI")
    }
}
```
Adicionando um novo texto, e envelopamos em uma VStack para renderizar uma sobre a outra pelo eixo Y

```Swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
            Text("Layout")
        }
    }
}
```
Empurrando os 2 testos para o topo da tela usando o Spacer

```Swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
            Text("Layout")
            Spacer()
        }
    }
}
```
Movendo nossos textos para o canto superior esquerdo(ou tecnicamente, canto superior), usando um HStack e outro Spacer
```Swift
struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("SwiftUI")
                Text("Layout")
                Spacer()
            }
            Spacer()
        }
    }
}
```

Adicionando padding na sua view usando o modificador .padding() 

```Swift
struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("SwiftUI")
                Text("Layout")
                Spacer()
            }
            Spacer()
        }.padding()
    }
}
```

Adicionando uma imagem para renderizar ao topo esquerdo da tela
```Swift
struct ContentView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Text("SwiftUI")
                Text("Layout")
                Spacer()
            }
            Spacer()
            Image(systemName: "star")
        }.padding()
    }
}
```
Extraindo a sua view atual em uma nova view
```Swift
struct TopView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Text("SwiftUI")
                Text("Layout")
            }
            Spacer()
            Image(systemName: "star")
        }
    }
}
```

Use uma composição para formar um novo content view, em vez de conter todo o nosso codigo de layout

```Swift
struct ContentView: View {
    var body: some View {
        VStack {
            TopView()
            Spacer()
        }.padding()
    }
}
```
Adicionando uma nova layer na nossa view hierarquica use a ZStack

```Swift
struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                TopView()
                Spacer()
            }
            Text("A new layer")
        }.padding()
    }
}
```
