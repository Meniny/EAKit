
import Foundation

public typealias Dispatcher = Dispatch.DispatchQueue

public enum DispatchQueueType {
    case main, global, interactive, initiated, utility, background, custom(Dispatch.DispatchQueue)
}

private func getQueue(_ queueType: DispatchQueueType = .main) -> Dispatch.DispatchQueue {
    let queue: Dispatcher
    
    switch queueType {
    case .main:
        queue = Dispatcher.main
    case .global:
        if #available(OSX 10.10, iOS 8.0, *) {
            queue = Dispatcher.global(qos: DispatchQoS.QoSClass.default)
        } else {
            queue = Dispatcher.global(priority: DispatchQueue.GlobalQueuePriority.default)
        }
    case .interactive:
        if #available(OSX 10.10, iOS 8.0, *) {
            queue = Dispatcher.global(qos: DispatchQoS.QoSClass.userInteractive)
        } else {
            queue = Dispatcher.global(priority: DispatchQueue.GlobalQueuePriority.high)
        }
    case .initiated:
        if #available(OSX 10.10, iOS 8.0, *) {
            queue = Dispatcher.global(qos: DispatchQoS.QoSClass.userInitiated)
        } else {
            queue = Dispatcher.global(priority: DispatchQueue.GlobalQueuePriority.high)
        }
    case .utility:
        if #available(OSX 10.10, iOS 8.0, *) {
            queue = Dispatcher.global(qos: DispatchQoS.QoSClass.utility)
        } else {
            queue = Dispatcher.global(priority: DispatchQueue.GlobalQueuePriority.low)
        }
    case .background:
        if #available(OSX 10.10, iOS 8.0, *) {
            queue = Dispatcher.global(qos: DispatchQoS.QoSClass.background)
        } else {
            queue = Dispatcher.global(priority: DispatchQueue.GlobalQueuePriority.background)
        }
    case .custom(let userQueue):
        queue = userQueue
    }
    
    return queue
}

public func delay(_ delay: TimeInterval, queue queueType: DispatchQueueType = .main, closure: @escaping () -> Void) {
    getQueue(queueType).asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: closure
    )
}

public func dispatch(queue queueType: DispatchQueueType = .main, closure: @escaping () -> Void) {
    getQueue(queueType).async(execute: {
        closure()
    })
}
