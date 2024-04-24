// ********************************** MIT License ******************************* //
// Copyright © 2021, Matthew Elmore                                               //
// ------------------------------------------------------------------------------ //
// Permission is hereby granted, free of charge, to any person obtaining a copy   //
// of this software and associated documentation files (the "Software"), to deal  //
// in the Software without restriction, including without limitation the rights   //
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      //
// copies of the Software, and to permit persons to whom the Software is          //
// furnished to do so, subject to the following conditions:                       //
// ------------------------------------------------------------------------------ //
// The above copyright notice and this permission notice shall be included in     //
// all copies or substantial portions of the Software.                            //
// ------------------------------------------------------------------------------ //
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     //
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       //
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    //
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         //
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  //
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN      //
// THE SOFTWARE.                                                                  //
// ********************************* MIT License ******************************** //

import SwiftUI

public struct OpenUrlView: View {
    
    let imageName: String
    let imageSize: CGFloat
    
    public init(imageName: String, imageSize: CGFloat) {
        self.imageName = imageName
        self.imageSize = imageSize
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
