import Foundation
import UIKit

public struct DebugAction {
    public let title: String
    public let handler: UIActionHandler

    public init(
        title: String,
        handler: @escaping UIActionHandler
    ) {
        self.title = title
        self.handler = handler
    }
}
