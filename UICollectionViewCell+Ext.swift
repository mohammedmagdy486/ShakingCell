//
//  UICollectionViewCell+Ext.swift
//  Bahar
//
//  Created by AMN on 1/29/23.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    func shakeAtIndex (indexPath: IndexPath, desiredIndex: IndexPath){
        if desiredIndex == indexPath {
            self.shakeRotation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.stopShaking()
            }
        }
    }
    
    func shakingCellHorizontal(indexPath: IndexPath){
        
        if indexPath.row == indexPath.first {
            self.shakeHorizone()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.stopShaking()
            }
        }
        if indexPath.row == indexPath.last {
            self.shakeHorizone()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.stopShaking()
            }
        }
    }
    func shakingCellRotation(indexPath: IndexPath){
        
        if indexPath.row == indexPath.first {
            self.shakeRotation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.stopShaking()
            }
        }
        if indexPath.row == indexPath.last {
            self.shakeRotation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.stopShaking()
            }
        }
    }
    func shakeRotation(){
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 2
        shakeAnimation.autoreverses = true
        let startAngle: Float = (-2) * 0.74159/180
        let stopAngle = -startAngle
        shakeAnimation.fromValue = NSNumber(value: startAngle as Float)
        shakeAnimation.toValue = NSNumber(value: 3 * stopAngle as Float)
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.15
        shakeAnimation.repeatCount = 10000
        shakeAnimation.timeOffset = 290 * drand48()
        let layer: CALayer = self.layer
        layer.add(shakeAnimation, forKey:"shaking")
    }
    func shakeHorizone() {
        let shakeAnimation = CABasicAnimation(keyPath: "position.x")
      
        shakeAnimation.duration = 0.05
        shakeAnimation.fromValue = self.frame.width / 2
        shakeAnimation.toValue = (self.frame.width / 2) - 10
        shakeAnimation.repeatCount = 3
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.1
        shakeAnimation.repeatCount = 10000
        shakeAnimation.timeOffset = 290 * drand48()
        let layer: CALayer = self.layer
        layer.add(shakeAnimation, forKey:"shaking")
    }
    
    func stopShaking() {
        let layer: CALayer = self.layer
        layer.removeAnimation(forKey: "shaking")
    }
}
