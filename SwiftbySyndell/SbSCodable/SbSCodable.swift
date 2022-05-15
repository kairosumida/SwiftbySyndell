//
//  SbSCodable.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 15/05/22.
//

import SwiftUI


struct SbSCodable: View {
    var body: some View {
        ZStack{
            VStack{
                Text(FazAlgo())
                Text(DecodingJSon())
            }
        }
    }
}
extension User {
    struct CodingData: Codable {
        struct Container: Codable {
            var fullName: String
            var userAge: Int
        }

        var userData: Container
    }
}
extension User.CodingData {
    var user: User {
        return User(
            name: userData.fullName,
            age: userData.userAge
        )
    }
}
struct User: Codable{
    var name: String
    var age: Int
}

func FazAlgo() -> String{
    do {
        let user = User(name: "John", age: 31)
        let encoder = JSONEncoder()
        let data = try encoder.encode(user)
        
        let decoder = JSONDecoder()
        let secondUser = try decoder.decode(User.self, from: data)

        return "First:\(user) \n Secound: \(secondUser)"
    } catch {
        return "Whoops, an error occured: \(error)"
    }
}

func DecodingJSon() -> String{
    do {
        let json = """
        {
            "user_data": {
                "full_name": "John Sundell",
                "user_age": 31
            }
        }
        """

        let data = Data(json.utf8)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let codingData = try decoder.decode(User.CodingData.self, from: data)
        let user = codingData.user

        return "Third: \(user)"
    } catch {
        return "Whoops, an error occured: \(error)"
    }
}




struct SbSCodable_Previews: PreviewProvider {
    static var previews: some View {
        SbSCodable()
    }
}
