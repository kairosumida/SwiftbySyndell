<h1> Codable</h1>
Codable é atualmente um tipo que combina dois protocolos - Encodable e Decodable
Em conformidade com outros protocolos quando declara um tipo, o compilador tentará sintetizar automaticamente o código necessario para Codificar e Decodificar uma instância desse tipo, o que funcionará desde que estejamos usando propriedades que sejam codificaveis e decodificaveis.
Como ao definir esse usuario

```Swift
struct User: Codable {
    var name: String
    var age: Int
}
```
Ao adicionarmos apenas essa conformidade de protocolo, agora podemos codificar uma instancia de usuario em uma Json data usando o JSONEncoder

```Swift
do {
    let user = User(name: "John", age: 31)
    let encoder = JSONEncoder()
    let data = try encoder.encode(user)
} catch {
    print("Whoops, an error occured: \(error)")
}
```
<h3>Descoberta</h3>
<code>Por algum motivo não consegui converter o Data em String. Talvez seja porque seja seguro. Ou talvez porque a String não consiga converter todo tipo de coisa como em outras linguagens</code>

Como codificar um valor é uma operação em que pode gerar um erro, precisamos chamar o encode() dentro de um try e lidar com qualquer erro que venha a ser encontrado
Agora que codificamos o valor em um dado, vamos ver se podemos decodificar de volta para o User instance. Para isso usamos o JSONDecoder, passando os dados enquanto passamos o tipo que queremos decodificar

<h3>Descoberta</h3>
<code> Chamar uma classe .self Retorna o seu tipo Ex: Int.self, User.self</code>

```Swift
let decoder = JSONDecoder()
let secondUser = try decoder.decode(User.self, from: data)
```

Nosso secondUser agora é exatamente o mesmo que o usuario original, e completamos com sucesso a viagem de ida e volta de codificar e decodificar
Entretanto, algumas vezes o formato Json com o qual estamos lidando não corresponde exatamente com um tipo que o Swift trabalha. Por exemplo, o Json que representa o nosso Usuario e pode ter essa aparência:

```Json
{
    "user_data": {
        "full_name": "John Sundell",
        "user_age": 31
    }
}
```
Existem alguns caminhos diferentes que podemos seguir nessa situação. Uma opção é simplismente fazer com que nosso tipo de usuário corresponda a estrutura Json acima - mas isso tornaria muito mais dificil de usar, e isso faria com que parecesse bastante deslocado entre outros códigos Swift(já que teria que usar propriedades nomes como full_name). Outra opção seria implementar manualmente a conformidade do nosso tipo com Codable, mas isso exigiria muito código extra.
A boa notícia é que existe uma terceira via - e isso é introduzir um novo tipo que usaremos especificamente para codificação e decodificação. Dessa forma, podemos fazer com que esse tipo use a mesma estrutura que nosso Json, sem afetar nosso código de modelo real. Veja como pode ser esse tipo para o formato Json abaixo

```Swift
extension User {
    struct CodingData: Codable {
        struct Container: Codable {
            var fullName: String
            var userAge: Int
        }

        var userData: Container
    }
}
```

Adicionaremos um método de conveniencia ao nosso novo tipo User.CodingData, que nos permitirá converter rapidamente um valor decodificado em uma instancia de User adequada, desse jeito:

```Swift
extension User.CodingData {
    var user: User {
        return User(
            name: userData.fullName,
            age: userData.userAge
        )
    }
}
```
Embora nosso novo tipo corresponda a estrutura Json, as chaves (fullName vs full_name) não correspondem. Felizmente, tanto JSONEncoder quanto JSONDecoder fornecem uma maneira de resolver isso - definindo .keyDecodingStrategy para .convertToSnakeCase. Combinando nosso novo tipo com esse recurso, veja como agora podemos decodificar um valor User, sem precisar fazer nenhuma modificação em nosso tipo original

```Swift
// We'll use the "convertFromSnakeCase" key decoding strategy to
// automatically convert the snake_case keys in our JSON data into
// camelCase, which we're using in our Swift code.
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

// Rather than decoding a User value directly, we instead decode an
// instance of User.CodingData, and then convert that into a user.
let codingData = try decoder.decode(User.CodingData.self, from: data)
let user = codingData.user
```

Usar um tipo especifico para codificar e decodificar, quando nosso tipo original tem uma estrutura completamente diferente do nosso Json, pode ser uma ótima maneira de preencher a lacuna entre os dados serializados e nosso codigo Swift - enquanto ainda podemos aproveitar ao maximo o compilador: implementações geradas de Codable.
Claro, muitas vezes. Não precisaremos fazer isso, especialmente se estivermos apenas codificando e decodificando para dados locais - nesse caso, podemos usar o Codable como está, sem a necessidade de qualquer cliche adicional
