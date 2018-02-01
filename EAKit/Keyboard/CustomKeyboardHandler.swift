
#if os(iOS)
    import UIKit

    open class CustomKeyboardHandler: KeyboardEventHandler {
        
        public init() {}
        
        open func willShow(_ info: KeyboardInfo) {
            show?(info)
        }
        
        open func willHide(_ info: KeyboardInfo) {
            hide?(info)
        }
        
        open var show: ((_ info: KeyboardInfo) -> Void)?
        open var hide: ((_ info: KeyboardInfo) -> Void)?
    }
#endif
