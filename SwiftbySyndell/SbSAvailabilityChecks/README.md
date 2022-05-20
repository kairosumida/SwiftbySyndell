<h1>Availability Checks</h1> <a href="https://www.swiftbysundell.com/basics/availability/"> Veja aqui </a>
<p>Availability checks serve para rodar de formas diferentes em sistemas operacionais apples diferentes ou desatualiados.</p>
<p>No exemplo abaixo, usamos o WidgedKit para dar reload em toda a pagina principal, mas apenas em ioS 14 para isso usamos o comando @available</p>

```Swift
import WidgetKit

@available(iOS 14, *)
func reloadWidgets() {
    WidgetCenter.shared.reloadAllTimelines()
}
```

<p>No caso acima, usamos o * para informar que todas as versões futuras também estão inclusas</p>
<p>Agora se o iOS for abaixo do 14 usamos o #available.</p>

```Swift
if #available(iOS 14, *) {
    reloadWidgets()
}
```

<p>Obviamente que se colocarmos um if e um else já englobaria todos os dispositivos</p>

```Swift
if #available(iOS 14, *) {
    reloadWidgets()
} else {
    updateTodayViewData()
}
```

<p>Tambem podemos incluir outros SOs simultaneamente usando o codigo</p>

```Swift
func reloadWidgets() {
    if #available(iOS 14, macOS 11, *) {
        WidgetCenter.shared.reloadAllTimelines()
    } else {
        updateTodayViewWidgetData()
    }
}
```

<p> O availability check pode validar uma extensao inteira, o que é bem util, para quando queremos usar UIs e algumas não funciona apartir de uma determinada versão</p>

```Swift
@available(iOS 15, *)
extension UIButton {
    func applyRoundedStyling() {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .systemBlue
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 10, leading: 8, bottom: 10, trailing: 8
        )
        configuration = config
    }

    func applyPrimaryStyling() {
        ...
    }

    func applySecondaryStyling() {
        ...
    }
}
```

