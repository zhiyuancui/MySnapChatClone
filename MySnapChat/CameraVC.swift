//
//  ViewController.swift
//  MySnapChat
//
//  Created by Zhiyuan Cui on 3/17/17.
//  Copyright © 2017 Zhiyuan Cui. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: CameraViewController, CameraVCDelegate {

    @IBOutlet weak var previewView: PreviewView!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    override func viewDidLoad() {
        
        super.delegate = self;
        
        self._previewView = previewView;
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        guard FIRAuth.auth()?.currentUser != nil else{
            performSegue(withIdentifier: "goToLogin", sender: nil)
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording();
    }

    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(enabled: Bool) {
        cameraButton.isEnabled = enabled;
    }
    
    func shouldEnableRecordUI(enabled: Bool) {
        recordButton.isEnabled = enabled;
    }
    
    func setRecordTitle(title: String, comment: String) {
        recordButton.setTitle(NSLocalizedString(title, comment: comment), for: [])
    }
}

