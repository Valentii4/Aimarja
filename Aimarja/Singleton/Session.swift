//
//  Session.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import Foundation
import SwiftKeychainWrapper
class Session{
    static let shared = Session()
    private init(){}
    
    //MARK: - KeyChain
    private let sessionName = "Session"
    private let tokenKey = "token"
    var token: String?{
        get {
            return KeychainWrapper(serviceName: sessionName).string(forKey: tokenKey)
        }
        set {
            guard let token = newValue else {
                print("Error: Session: token equal nil")
                return
            }
            KeychainWrapper(serviceName: sessionName).set(token, forKey: tokenKey)
        }
    }
    
    //MARK: UserDefault
    let accountTypeKey = "AccountType"
    let userDefault = UserDefaults.standard
    var accountType: AccountType? {
        get {
            if let type = userDefault.object(forKey: accountTypeKey) as? Data {
                let decoder = JSONDecoder()
                if let accountType = try? decoder.decode(AccountType.self, from: type) {
                    print("Session: accountType save in userDefault")
                    return accountType
                }
            }
            
            print("Session: Get ERROR: accountType not save in userDefault")
            return nil
        }
        set {
            do {
                let res = try JSONEncoder().encode(newValue)
                userDefault.set(res, forKey: accountTypeKey)
            } catch {
                print("Session: Set ERROR: accountType not save in userDefault")
            }
        }
    }
    
    enum AccountType: String, Codable {
        case provider = "Провайдер"
        case seller = "Продавец"
        case buyer = "Покупатель"
    }
}
