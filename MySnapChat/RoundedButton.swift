//
//  RoundedButton.swift
//  MySnapChat
//
//  Created by Zhiyuan Cui on 3/21/17.
//  Copyright © 2017 Zhiyuan Cui. All rights reserved.
//

import UIKit


@IBDesignable
class RoundedButton: UIButton{

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth;
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor;
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet{
            backgroundColor = bgColor;
        }
    }


}
