
import Foundation
import Security

public struct Keychain {
    
    public static let bundleIdentifier: String = {
        return Bundle.main.bundleIdentifier ?? ""
    }()
    
    public enum Action {
        case insert, fetch, delete
    }
    
    // MARK: - Public methods
    
    public static func password(forAccount account: String, service: String = Keychain.bundleIdentifier, accessGroup: String = "") -> String? {
        guard !service.isEmpty && !account.isEmpty else { return nil }
        
        var query = [
            kSecAttrAccount as String : account,
            kSecAttrService as String : service,
            kSecClass as String : kSecClassGenericPassword] as [String : Any]
        
        if !accessGroup.isEmpty {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
        
        return Keychain.does(.fetch, query as [String : AnyObject]).1
    }
    
    @discardableResult public static func setPassword(_ password: String, forAccount account: String, service: String = bundleIdentifier, accessGroup: String = "") -> Bool {
        guard !service.isEmpty && !account.isEmpty else { return false }
        
        var query = [
            kSecAttrAccount as String : account,
            kSecAttrService as String : service,
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccessible as String : kSecAttrAccessibleAlways] as [String : Any]
        
        if !accessGroup.isEmpty {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
        
        return Keychain.does(.insert, query as [String : AnyObject], password).0 == errSecSuccess
    }
    
    @discardableResult public static func deletePassword(forAccount account: String, service: String = bundleIdentifier) -> Bool {
        return deletePassword(forAccount: account, service: service, accessGroup: "")
    }
    
    @discardableResult public static func deletePassword(forAccount account: String, service: String = bundleIdentifier, accessGroup: String) -> Bool {
        guard !service.isEmpty && !account.isEmpty else { return false }
        
        var query = [
            kSecAttrAccount as String: account,
            kSecAttrService as String : service,
            kSecClass as String : kSecClassGenericPassword
            ] as [String : Any]
        
        if !accessGroup.isEmpty {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
        
        return Keychain.does(.delete, query as [String : AnyObject]).0 == errSecSuccess
    }
    
    // MARK: - Private methods
    
    fileprivate static func does(_ action: Action, _ query: [String : AnyObject], _ password: String = "") -> (OSStatus, String?) {
        let passwordData = password.data(using: String.Encoding.utf8)
        var returnPassword: String?
        var status = SecItemCopyMatching(query as CFDictionary, nil)
        var attributes = [String : AnyObject]()
        
        switch action {
        case .insert:
            switch status {
            case errSecSuccess:
                attributes[kSecValueData as String] = passwordData as AnyObject?
                status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            case errSecItemNotFound:
                var query = query
                query[kSecValueData as String] = passwordData as AnyObject?
                status = SecItemAdd(query as CFDictionary, nil)
            default: break
            }
        case .fetch:
            var query = query
            query[kSecReturnData as String] = true as AnyObject?
            query[kSecMatchLimit as String] = kSecMatchLimitOne
            
            var result: CFTypeRef?
            status = SecItemCopyMatching(query as CFDictionary, &result)
            
            if let result = result as? Data,
                let password = String(data: result, encoding: String.Encoding.utf8) {
                returnPassword = password
            }
        case .delete:
            status = SecItemDelete(query as CFDictionary)
        }
        
        return (status, returnPassword)
    }
}
