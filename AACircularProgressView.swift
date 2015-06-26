//
//  AACircularProgressView.swift
//
//  Created by Ahmet AYGÜN on 25.06.2015.
//  Copyright (c) 2015 Uniborn. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class AACircularProgressView : UIView {
    private var progressTrackLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()

    @IBInspectable var progress: Double = 0.0 {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable var trackWidth: CGFloat = 2 {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable var trackFillColor: UIColor = UIColor.clearColor() {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable var trackStrokeColor: UIColor = UIColor.darkGrayColor() {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable var progressStrokeColor: UIColor = UIColor.lightGrayColor() {
        didSet { setNeedsDisplay() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addLayers()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addLayers()
    }

    private func addLayers() {
        layer.addSublayer(progressTrackLayer)
        layer.addSublayer(progressLayer)
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        let centerPoint = CGPoint(x: bounds.width / 2, y: bounds.width / 2)
        let circleRadius: CGFloat = bounds.width / 2 * 0.83
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise: true)

        progressTrackLayer.path = circlePath.CGPath
        progressTrackLayer.strokeColor = trackStrokeColor.CGColor
        progressTrackLayer.fillColor = trackFillColor.CGColor
        progressTrackLayer.lineWidth = trackWidth

        progressLayer.path = circlePath.CGPath
        progressLayer.strokeColor = progressStrokeColor.CGColor
        progressLayer.fillColor = trackFillColor.CGColor
        progressLayer.lineWidth = trackWidth
        progressLayer.strokeEnd = CGFloat(progress)
    }
}
