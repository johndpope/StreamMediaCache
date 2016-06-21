//
//  ViewController.swift
//  StreamVideoCaching
//
//  Created by Andrii Kravchenko on 6/17/16.
//  Copyright © 2016 kievkao. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController {

    var playerCache: AVPlayerCache!

    let testVideoURL = NSURL(string:"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
    let testVideoName = "big_buck_bunny.mp4"

    var playerController = AVPlayerViewController()
    @IBOutlet weak var playFromCacheButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setPlayFromCacheButtonVisibility()
    }

    func setPlayFromCacheButtonVisibility() {
        self.playFromCacheButton.enabled = AVPlayerCache.isCachedFileAvailable(fileName: testVideoName)
    }

    @IBAction func playFromCacheAction(sender: UIBarButtonItem) {
        self.startPlayerWithOnlineCaching(false)
    }

    @IBAction func playOnlineAction(sender: UIBarButtonItem) {
        self.startPlayerWithOnlineCaching(true)
    }

    func startPlayerWithOnlineCaching(onlineCaching: Bool) {
        self.playerCache = AVPlayerCache(URL: testVideoURL, onlineCaching: onlineCaching)

        self.playerController.player = self.playerCache.player
        self.presentViewController(self.playerController, animated: true, completion: nil)
        self.playerCache.play()
    }
}

