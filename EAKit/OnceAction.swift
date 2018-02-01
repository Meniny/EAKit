
import Foundation

public class OnceAction {
    
    private static var tracker: [String] = []
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter closure: A closure to execute once
     */
    public static func once(token: String, closure: () -> Swift.Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        if OnceAction.tracker.contains(token) {
            return
        }
        
        OnceAction.tracker.append(token)
        closure()
    }
}
