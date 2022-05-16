//
//  SbSEquality.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 16/05/22.
//

import SwiftUI

struct TesteStruct1 : Equatable{
    var a : Int
    var b : Int
}
protocol TesteProtocol1 : Equatable{
    var a : String { get set }
}
struct TestStruct2: TesteProtocol1{
    var a: String
    var i : String
}

func testStruct2Func() -> String{
    var test1 = TestStruct2(a: "abc", i: "cde")
    var test2 = TestStruct2(a: "abc", i: "cde")
    var test3 = TestStruct2(a: "abc", i: "cde")
    var test4 = TestStruct2(a: "abc", i: "cdef")
    
    var palavra = "test1 e test2 é "
    palavra = (test1 == test2) ? palavra+"igual" : palavra+"diferente"
    palavra = palavra + "\n test3 e test4 é "
    palavra = (test3 == test4) ? palavra + "igual" : palavra + "diferente"
    return palavra
}
func testStruct1Func() -> String{
    var test1 = TesteStruct1(a: 1, b: 2)
    var test2 = TesteStruct1(a: 1, b: 2)
    
    if(test1 == test2){
        return "é igual"
    }
    else{
        return "não é igual"
    }
}
struct Article: Equatable {
    var title: String
    var body: String
}
extension Array where Element: Equatable {
    
}
struct Group<Value> {
    var label: String
    var values: [Value]
}

extension Group: Equatable where Value: Equatable {}
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
func testGroup() -> String{
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
        return "lastestArticles é igual basicsArticles"
    }
    else{
        return "lastestArticles é diferente de basicsArticles"
    }
}

func testArticle() -> String{
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
        return "lastestArticles é igual basicsArticles"
    }
    else{
        return "lastestArticles é diferente de basicsArticles"
    }
}
struct SbSEquality: View {
    var body: some View {
        ZStack{
            VStack{
                Text(testStruct1Func())
                Text(testStruct2Func())
                Text(testArticle())
                Text(testGroup())
            }
        }
        
    }
}

struct SbSEquality_Previews: PreviewProvider {
    static var previews: some View {
        SbSEquality()
    }
}
