//
//  LoginViewController.swift
//  ApiSample2
//
//  Created by 本橋淳哉 on 2021/01/09.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController {
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "test", ofType: "mp4") else { return }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1 // ログインボタンを上に持ってきたいため
        view.layer.insertSublayer(playerLayer, at: 0)
        // 動画の無限ループのため
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            self.player.seek(to: .zero)
            self.player.play()
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func login(_ sender: Any) {
        player.pause()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
