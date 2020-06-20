import Foundation
import UIKit

public protocol DebugActionsInteractionDelegate: AnyObject {
    func debugActions() -> [DebugAction]
}

public final class DebugActionsInteraction: UIContextMenuInteraction {

    static let identifier: NSString = "__debugInteractionSDK"
    private let contextMenuDelegateProxy: _Delegate

    public init(delegate: DebugActionsInteractionDelegate) {
        let contextMenuDelegateProxy = _Delegate()
        contextMenuDelegateProxy.debugDelegate = delegate
        self.contextMenuDelegateProxy = contextMenuDelegateProxy
        super.init(delegate: contextMenuDelegateProxy)
    }
}

extension DebugActionsInteraction {
    class _Delegate: NSObject, UIContextMenuInteractionDelegate {
        weak var debugDelegate: DebugActionsInteractionDelegate?
        static let title = "Debug Actions"

        public func contextMenuInteraction(
            _ interaction: UIContextMenuInteraction,
            configurationForMenuAtLocation location: CGPoint
        ) -> UIContextMenuConfiguration? {
            let debugActions: [DebugAction] = debugDelegate?.debugActions() ?? []
            guard debugActions.isEmpty == false else {
                return nil
            }
            let actions: [UIAction] = debugActions.map {
                return UIAction(title: $0.title, handler: $0.handler)
            }
            return UIContextMenuConfiguration(
                identifier: DebugActionsInteraction.identifier,
                previewProvider: nil
            ) { _ in
                return UIMenu(title: Self.title, children: actions)
            }
        }
    }
}
