//
//  SnapCarouselHelper.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 16/9/2023.
//

import SwiftUI

// retrieving embedded UIScrollView from SwiftUI ScrollView
struct SnapCarouselHelper: UIViewRepresentable {
    
    // retrieve needed properties from ScrollView with @Binding
    var pageWidth: CGFloat
    var pageCount: Int
    @Binding var index: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            if let scrollView = uiView.superview?.superview?.superview as? UIScrollView {
                scrollView.decelerationRate = .fast
                scrollView.delegate = context.coordinator
                context.coordinator.pageCount = pageCount
                context.coordinator.pageWidth = pageWidth
            }
        }
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: SnapCarouselHelper
        var pageCount: Int = 0
        var pageWidth: CGFloat = 0
        init(parent: SnapCarouselHelper) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
        }
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            // adding velocity for desired scroll animation
            let targetEnd = scrollView.contentOffset.x + (velocity.x * 60)
            let targetIndex = (targetEnd / parent.pageWidth).rounded()
            
            // updating current index
            let index = min(max(Int(targetIndex), 0), pageCount - 1)
            parent.index = index
            
            targetContentOffset.pointee.x = targetIndex * pageWidth
        }
    }
}

//struct SnapCarouselHelper_Previews: PreviewProvider {
//    static var previews: some View {
//        SnapCarouselHelper(pageWidth: 1179, pageCount: 3)
//    }
//}
