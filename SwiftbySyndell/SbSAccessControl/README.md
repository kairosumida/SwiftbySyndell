<h1>Access Control</h1>
<p>access control serve para garantir como tipos, funções e outras declarações são acessadas por outros codigos. Swift oferece diferentes leveis de controle de acesso.
  E saber usar bem isso garante uma clareza e uma robusta estrutura do programa a ser criado</p>
  <p>quando definimos qualquer tipo, propriedade ou função ela recebe o acesso padrão (internal). Isso significa que ela só é visivel para outros codigos que vivem no mesmo módulo - como um app, uma extensão do sistema, um framewrok ou um pacote swift.</p>
  <p>Um exemplo, vamos dizer que criamos um shopping app, e definimos uma classe chamada PriceCalculator. Vamos calcular o total do preço dos produtos contidos em uma array</p>
  
  ```Swift
  class PriceCalculator {
    func calculatePrice(for products: [Product]) -> Int {
        // The reduce function enables us to reduce a collection,
        // in this case an array of products, into a single value:
        products.reduce(into: 0) { totalPrice, product in
            totalPrice += product.price
        }
    }
}
  ```
  
  <p>No exemplo acima, não especificamos o access level nem da classe e nem da função. Ou seja ela estará disponivel para todo o app. Porem, se estiver tentando acessar por outro modulo ou implementando como um framework, ai precisaria colocar como public</p>
  
  ```Swift
  public class PriceCalculator {
    public func calculatePrice(for products: [Product]) -> Int {
        products.reduce(into: 0) { totalPrice, product in
            totalPrice += product.price
        }
    }
}
  ```
  
  <p> Entretanto, o exemplo acima apenas não basta, podemos ver a classe em qualquer outro modulo, porem não podemos instancia-la. Para isso devemos colocar o construtor como public tambem</p>
  
  ```Swift
  public class PriceCalculator {
    public init() {}
    ...
}
  ```
  
  <p> Agora digamos que queremos criar uma subclass e modifica-la. É possivel dentro do seu módulo, porem não é possivel fora do modulo. Para isso declaramos como open</p>
  
  ```Swift
  open class PriceCalculator {
    ...
}
```

<p> Agora podemos criar subclasses customizadas de PriceCalculator em qualquer lugar. Abaixo uma implementação de DiscountedPriceCalculator. que aplica-se um disconto para todo o preço</p>

```Swift
class DiscountedPriceCalculator: PriceCalculator {
    let discount: Int

    init(discount: Int) {
        self.discount = discount
        super.init()
    }

    func calculateDiscountedPrice(for products: [Product]) -> Int {
        let price = calculatePrice(for: products)
        return price - discount
    }
}
```

<p>Apesar de termos criado o metodo, talvez fosse mais apropriado modificarmos o método calculatePrice. Para evitar de ter duas funções parecidas, e acabar causando confusão na hora de usa-las.
  Por isso usamos a inherited da nossa classe base. Vamos reescrever o metodo. Mas para isso, primeiro devemos declarar o metodo como open</p>
  
  ```Swift
  open class PriceCalculator {
    public init() {}

    open func calculatePrice(for products: [Product]) -> Int {
        ...
    }
}
  ```

<p>Agora estamos livres para sobrescrever o calculatePrice.</p>

```Swift
class DiscountedPriceCalculator: PriceCalculator {
    let discount: Int

    init(discount: Int) {
        self.discount = discount
        super.init()
    }

    override func calculatePrice(for products: [Product]) -> Int {
        let price = super.calculatePrice(for: products)
        return price - discount
    }
}
```

<p>Usando o internal, public e open, vamos abrindo o accesso cada vez mais. Porem podemos usar modificadores que escondem. E oara isso usamos o private. Que fica visivel apenas na sua propria estrutura. Como no exemplo abaixo. a variavel fica assessivel apenas dentro da classe</p>

```Swift
class DiscountedPriceCalculator: PriceCalculator {
    private let discount: Int
    ...
}
```
<p>Deixar a variavel privada, talvez não mude muita coisa, porem se queremos que uma variavel seja usada por quem a implementa e apenas dentro do seu bloco. Usamos o fileprivate, Por que deixar private não mostrará para uma classe que herda dessa e queira usar aquela variavel</p>

```Swift
class DiscountedPriceCalculator: PriceCalculator {
    fileprivate let discount: Int
    ...
}
```


