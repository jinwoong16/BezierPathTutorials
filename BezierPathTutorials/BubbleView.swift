//
//  BubbleView.swift
//  BezierPathTutorials
//
//  Created by jinwoong Kim on 2022/11/22.
//

import UIKit

final class MessageBubbleLabel: UILabel {
    private var topInset: CGFloat = 30.0
    private var bottomInset: CGFloat = 30.0
    private var leftInset: CGFloat = 15.0
    private var rightInset: CGFloat = 10.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
        text = "hello world!"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawText(in rect: CGRect) {

        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)

        let bezierPath = UIBezierPath()
        let width = rect.width
        let height = rect.height
        let spacing: CGFloat = 5.0

        bezierPath.move(to: CGPoint(x: spacing, y: height - 15))
        bezierPath.addLine(to: CGPoint(x: spacing, y: 20))
        bezierPath.addQuadCurve(to: CGPoint(x: 20, y: 0),
                                controlPoint: CGPoint(x: spacing, y: 0))


        bezierPath.addLine(to: CGPoint(x: width - 20, y: 0))
        bezierPath.addQuadCurve(to: CGPoint(x: width, y: 20),
                                controlPoint: CGPoint(x: width, y: 0))

        bezierPath.addLine(to: CGPoint(x: width, y: height - 20))
        bezierPath.addQuadCurve(to: CGPoint(x: width - 20, y: height),
                                controlPoint: CGPoint(x: width, y: height))

        bezierPath.addLine(to: CGPoint(x: 20, y: height))
        bezierPath.addCurve(to: CGPoint(x: spacing, y: height - 5),
                            controlPoint1: CGPoint(x: 7, y: height),
                            controlPoint2: CGPoint(x: 5, y: height - 3))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height),
                            controlPoint1: CGPoint(x: 8, y: height - 3),
                            controlPoint2: CGPoint(x: 4, y: height - 2))


        UIColor.init(named: "MyYellow")?.setFill()
        bezierPath.fill()
        bezierPath.close()

        super.drawText(in: rect.inset(by: insets))

        print("drawText")
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MessageBubblePreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let bubble = MessageBubbleLabel(frame: .zero)
            
            return bubble
        }
        .previewLayout(.fixed(width: 550, height: 100))
    }
}
#endif


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> UIView {
        return view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif
