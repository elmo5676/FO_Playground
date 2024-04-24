
import SwiftUI

public struct OpenUrlView: View {
    
    @State var urlPath: String = ""
    @State var pasteBoard: String = ""
    
    let width: CGFloat
    
    public init(width: CGFloat = 300) {
        self.width = width
    }
    
    func openJeppFD() {
        guard let jepp = AppUrl.jeppFdPro.urlScheme else { return }
        UIApplication.shared.open(jepp)
        
    }
    
    func openWSI() {
        guard let wsi = AppUrl.wsi.urlScheme else { return }
        UIApplication.shared.open(wsi)
        
    }
    
    func openOtherAndCopyText(_ path: String, copy: String) {
        UIPasteboard.general.string = copy
        guard let path = AppUrl.other(path).urlScheme else { return }
        UIApplication.shared.open(path)
    }
    
    var buttonLabel: some View {
        Text("OPEN PATH and COPY TEXT")
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            TextField(text: $urlPath) { Text("Input URL Path here") }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
            TextField(text: $pasteBoard) { Text("Copy this text to PasteBoard") }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
            Button(action: { openOtherAndCopyText(urlPath, copy: pasteBoard) },
                   label: { buttonLabel })
            }
        .frame(width: width)
    }
}
