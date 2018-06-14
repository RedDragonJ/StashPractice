//
//  ZeplinLevelTableViewCell.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class ZeplinLevelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView?
    @IBOutlet weak var levelContainerView: UIView!
    @IBOutlet weak var levelTitleLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var currentPointLabel: UILabel!
    @IBOutlet weak var maxPointLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let spinnerView = IndicatorView()
    
    var progress: Float = 0 {
        didSet {
            self.calculateProgress()
        }
    }
    
    var accessible: Bool = false {
        didSet {
            self.hideShowLevel()
        }
    }
    
    var imageUrl: String? {
        didSet {
            self.downloadImage()
        }
    }

    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundImageView?.layer.cornerRadius = 10
        self.levelContainerView.layer.cornerRadius = self.levelContainerView.frame.size.width/2
        
        self.needHideAll(state: true)
    }
    
    func calculateProgress() {
        self.progressView.progress = self.progress
    }
    
    func hideShowLevel() {
        self.isUserInteractionEnabled = self.accessible
        if self.accessible == false {
            let whiteLayer = UIView()
            whiteLayer.backgroundColor = UIColor.white
            whiteLayer.alpha = 0.5
            whiteLayer.center = self.center
            whiteLayer.frame = self.frame
            self.addSubview(whiteLayer)
        }
    }
    
    func downloadImage() {
        if let url = self.imageUrl {
            self.spinnerView.startSpinner(view: self)
            self.backgroundImageView?.downloadImageWith(Url: url, completion: { (error) in
                self.spinnerView.removeSpinner()
                if let err = error {
                    print(err)
                }
                else {
                    UIView.animate(withDuration: 1.5, animations: {
                        self.needHideAll(state: false)
                    })
                }
            })
        }
    }
    
    func needHideAll(state: Bool) {
        var stateValue = 0.0
        
        if state == false {
            stateValue = 1.0
        }
        self.backgroundImageView?.alpha = CGFloat(stateValue)
        self.levelContainerView.alpha = CGFloat(stateValue)
        self.levelTitleLabel.alpha = CGFloat(stateValue)
        self.levelLabel.alpha = CGFloat(stateValue)
        self.currentPointLabel.alpha = CGFloat(stateValue)
        self.maxPointLabel.alpha = CGFloat(stateValue)
        self.progressView.alpha = CGFloat(stateValue)
    }
}

//MARK: - UIImageView Extension
extension UIImageView {
    func downloadImageWith(Url: String, completion: @escaping (_ error: String?) -> Void) {
        guard let url = URL(string: Url) else {
            DispatchQueue.main.async {
                completion("Error: Failed to get URL")
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion("Failed to download image \(error!.localizedDescription)")
                }
                
            }
            else {
                if let downloadedImage = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.image = downloadedImage
                        completion(nil)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion("Failed to convert data into image")
                    }
                }
            }
            }.resume()
    }
}
