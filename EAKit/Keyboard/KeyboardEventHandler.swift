
#if os(iOS)
    import UIKit

    public protocol KeyboardEventHandler {  
        func willShow(_ info: KeyboardInfo)
        func willHide(_ info: KeyboardInfo)
    }
#endif
