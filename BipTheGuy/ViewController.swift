//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Jennifer Joseph on 9/21/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(soundName : String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch { print("👺Error: \(error.localizedDescription) could not initialize player") }
        }
        else {
            print("👺Error: could not read file")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func photoOrCameraPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            print("You clikced library!")
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            print("You clikced camera!")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)

    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink : CGFloat = 20
        let imageHeightShrink : CGFloat = 20
        let smallerImageFrame = CGRect(x: imageView.frame.origin.x + imageWidthShrink, y: imageView.frame.origin.y + imageHeightShrink , width: imageView.frame.width - (imageWidthShrink * 2), height: imageView.frame.height - (imageHeightShrink*2))
        
        imageView.frame = smallerImageFrame
        
        playSound(soundName: "punchSound")
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: {self.imageView.frame = originalImageFrame })
    }
}

