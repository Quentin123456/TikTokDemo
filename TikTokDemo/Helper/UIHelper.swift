//
//  UIHelper.swift
//  TikTokDemo
//
//  Created by Quentin Zang on 2020/2/22.
//  Copyright © 2020 臧乾坤. All rights reserved.
//

import UIKit


var layers = [CAShapeLayer]()

@IBDesignable class ClippedView: UIView {
    
}

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    //阴影色
    @IBInspectable public var shadowColor: UIColor {
        get {
            UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    //阴影色的位移
    @IBInspectable public var shadowOffset: CGSize {
        get {
            layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    //阴影的圆角
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    //阴影的透明度
    @IBInspectable public var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false //设置裁边为false
        }
    }
    
    func raiseAnimate(imgName: String, delay: TimeInterval) {
        
        let path = UIBezierPath()
        
        //起点: 在视图的中间
        let beginPoint = CGPoint(x: bounds.midX, y: bounds.minY)
        
        //控制点的位移，随机数
        let a: CGFloat = 2
        let b: CGFloat = 1.5
        let c: CGFloat = 3
        
        let offset1 = [a, b, c]
        let cxOffset = offset1.randomElement()! * bounds.maxX
        let cyOffset = offset1.randomElement()! * bounds.maxY
        
        //终点的位移， 随机数
        let e: CGFloat = 1.5
        let d: CGFloat = 1
        let f: CGFloat = 0.8
        
        let offset2 = [e, d, f]
        
        let g: CGFloat = 2.5
        let h: CGFloat = 3
        let i: CGFloat = 2
        
        let offset3 = [g, h, i]
        
        let exOffset = offset2.randomElement()! * bounds.maxX
        let eyOffset = offset3.randomElement()! * bounds.maxY
        
        //终点
        let endPoint = CGPoint(x: beginPoint.x - exOffset, y: beginPoint.y - eyOffset)
        
        //控制点
        let controlPoint = CGPoint(x: beginPoint.x - cxOffset, y: beginPoint.y - cyOffset)
        path.move(to: beginPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        let group = CAAnimationGroup()
        group.duration = 4
        group.beginTime = CACurrentMediaTime() + delay
        group.repeatCount = .infinity
        group.isRemovedOnCompletion = false
        group.fillMode = .forwards
        group.timingFunction = CAMediaTimingFunction(name: .linear)
        
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.path = path.cgPath
        
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotateAnimation.values = [0, .pi / 2.0, .pi / 1.0]
        
        let alphaAnimation = CAKeyframeAnimation(keyPath: "opacity")
        alphaAnimation.values = [0, 0.3, 1, 0.3, 1]
        
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.values = [1.0, 1.8, 2.0]
        
        group.animations = [pathAnimation, rotateAnimation, alphaAnimation, scaleAnimation]
        
        let layer = CAShapeLayer()
        layer.opacity = 0
        layer.contents = UIImage(named: imgName)?.cgImage
        layer.frame = CGRect(origin: beginPoint, size: CGSize(width: 10, height: 10))
        self.layer.addSublayer(layer)
        layer.add(group, forKey: nil)
        
        layers.append(layer)
        
    }
    
    //清楚层上动画
    func resetViewAnimation() {
        
        for layer in layers {
            layer.removeFromSuperlayer()
        }
        self.layer.removeAllAnimations()
    }
    
    
}
