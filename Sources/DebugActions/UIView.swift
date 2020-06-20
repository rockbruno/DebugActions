import Foundation
import UIKit

extension UIView {
    public func enableDebugActionsInteraction(delegate: DebugActionsInteractionDelegate) {
        disableDebugActionsInteraction(delegate: delegate)
        let debugInteraction = DebugActionsInteraction(delegate: delegate)
        addInteraction(debugInteraction)
    }

    public func disableDebugActionsInteraction(delegate: DebugActionsInteractionDelegate) {
        for case let interaction as DebugActionsInteraction in interactions {
            removeInteraction(interaction)
        }
    }
}

extension DebugActionsInteractionDelegate where Self: UIView {
    public func enableDebugActionsInteraction() {
        enableDebugActionsInteraction(delegate: self)
    }

    public func disableDebugActionsInteraction() {
        disableDebugActionsInteraction(delegate: self)
    }
}
