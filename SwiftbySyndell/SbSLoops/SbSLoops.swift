//
//  SbSLoops.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 18/05/22.
//

import SwiftUI

struct SbSLoops: View {
    var body: some View {
        HStack{
            VStack{
                Text(loop1())
                Text(loop2())
                Text(loop3())
                Text(loop4())
                Text(loop5())
            }
            VStack{
                Text(loop6())
                Text(loop7())
                Text(loop8())
                Text(loop9())
                Text(loop10())
            }
            VStack{
                Text(loop11())
                Text(loop12())
                Text(loop13())
                Text(loop14())
                Text(loop15())
            }
        }
    }
}
func loop1() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var retorno = ""
    for name in names{
        retorno += name + "\n"
    }
    return retorno
}
func loop2() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var retorno = ""
    names.forEach{ name in
        retorno += name + "\n"
    }
    return retorno
}
func loop3() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var retorno = ""
    for name in names {
        if name == "Robert"{
            break
        }
        retorno += name + "\n"
    }
    return retorno
}
func loop4() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var retorno = ""
    for index in 0..<names.count{
        retorno += names[index] + "\n"
    }
    return retorno
}
func loop5() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var retorno = ""
    for index in names.indices{
        retorno += names[index] + "\n"
    }
    return retorno
}
func loop6() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var retorno = ""
    for (index, name) in names.enumerated(){
        retorno += String(index) + "- " + name + "\n"
    }
    return retorno
}
func loop7() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var index = 0
    var string = ""
    while(string.count < 8){
        string.append(names[index])
        index += 1
    }
    return string
}
func loop8() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var index = 0
    var string = ""
    repeat{
        string.append(names[index])
        index += 1
    }while string.count < 8
    return string
}
func loop9() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var index = 0
    var string = ""
    while string.count < 8, index < names.count{
        string.append(names[index])
        index += 1
    }
    return string
}
func loop10() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var index = 0
    var string = ""
    while string.count < 8{
        guard index < names.count else {
            break
        }
        string.append(names[index])
        index += 1
    }
    return string
}
func loop11() -> String{
    let names = ["John", "Emma", "Robert", "Julia"]
    var string = ""

    for name in names where string.count < 8 {
        string.append(name)
    }
    return string
}
func loop12() -> String{
    let namesByCategory = [
        "friends": ["John", "Emma"],
        "family": ["Robert", "Julia"]
    ]
    var retorno = ""
    for (category, names) in namesByCategory {
        retorno += category + ": "
        for name in names{
            retorno += name + " "
        }
        retorno += "\n"
    }
    return retorno
}
func loop13() -> String{
    let namesByCategory = [
        "friends": ["John", "Emma"],
        "family": ["Robert", "Julia"]
    ]
    var retorno = ""
    for (category, _) in namesByCategory {
        retorno += category + "\n"
    }
    return retorno
}
func loop14() -> String{
    let namesByCategory = [
        "friends": ["John", "Emma"],
        "family": ["Robert", "Julia"]
    ]
    var retorno = ""
    for category in namesByCategory.keys{
        retorno += category + ", "
    }
    retorno += "\n"
    for names in namesByCategory.values{
        for name in names{
        retorno += name
        }
    }
    return retorno
}
func loop15() -> String{
    let namesByCategory = [
        "friends": ["John", "Emma"],
        "family": ["Robert", "Julia"]
    ]
    var retorno = ""
    for category in namesByCategory.keys.sorted()
    {
        retorno += category + " "
    }
    return retorno
}
struct SbSLoops_Previews: PreviewProvider {
    static var previews: some View {
        SbSLoops()
    }
}
