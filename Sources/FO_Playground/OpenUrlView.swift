
import SwiftUI

public struct OpenUrlView: View {
    
    let imageName: String
    let imageSize: CGFloat
    
    public init(imageName: String, imageSize: CGFloat, width: CGFloat) {
        self.imageName = imageName
        self.imageSize = imageSize
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
    
    func openOther(_ path: String) {
        guard let path = AppUrl.other(path).urlScheme else { return }
        UIApplication.shared.open(path)
    }
    
    
    @State var urlPath: String = ""
    let width: CGFloat
    
    public var body: some View {
        VStack(alignment: .center) {
                Text("Open Jepp FD Pro")
                TextField(text: $urlPath) { Text("Input URL Path here") }
                Button(
                    action: {
                        openOther(urlPath)
                    },
                    label: {
                        Label(
                            title: { Text("OPEN PATH") },
                            icon: { Image(systemName: imageName).resizable().aspectRatio(contentMode: .fit).frame(width: imageSize, height: imageSize) }
                        )
                    })
            }
        .frame(width: width)
        
        
    }
}
