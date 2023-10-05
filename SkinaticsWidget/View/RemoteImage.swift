//
//  RemoteImage.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI
import WidgetKit

struct RemoteImage: View {
  let url: URL?
    var screenWidth: Double?
    @Environment(\.widgetFamily) var widgetFamily: WidgetFamily

  var body: some View {

    Group {
     if let url = url, let imageData = try? Data(contentsOf: url),
       let uiImage = UIImage(data: imageData) {

         switch widgetFamily {
         case .systemSmall:
             Image(uiImage: uiImage)
                   .smallWidgetModifier()
         case .systemMedium:
             Image(uiImage: uiImage)
                   .mediumWidgetModifier(screenWidth: screenWidth ?? 100)
         case .systemLarge:
             Image(uiImage: uiImage)
                   .largeWidgetModifier()
         default:
             Image(uiImage: uiImage)
                   .smallWidgetModifier()
         }
      }
      else {
       Image("placeholder")
      }
    }
  }

}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: URL(string: ""), screenWidth: 100)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
