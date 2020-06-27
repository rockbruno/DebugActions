import Foundation
import UIKit

public protocol DebugActionsInteractionDelegate: AnyObject {
    func debugActions() -> [UIMenuElement]
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
            let debugActions = debugDelegate?.debugMenuElements() ?? []
            guard debugActions.isEmpty == false else {
                return nil
            }
            return UIContextMenuConfiguration(
                identifier: DebugActionsInteraction.identifier,
                previewProvider: nil
            ) { _ in
                return UIMenu(title: Self.title, children: debugActions)
            }
        }
    }
}
