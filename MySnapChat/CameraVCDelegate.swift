//
//  CameraVCDelegate.swift
//  MySnapChat
//
//  Created by Zhiyuan Cui on 3/17/17.
//  Copyright © 2017 Zhiyuan Cui. All rights reserved.
//

import Foundation


protocol CameraVCDelegate{
    
    func shouldEnableRecordUI(enabled: Bool)
    func shouldEnableCameraUI(enabled: Bool)
    func setRecordTitle(title: String, comment: String)
    
}
