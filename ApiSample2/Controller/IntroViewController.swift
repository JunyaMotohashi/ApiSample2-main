//
//  IntroViewController.swift
//  ApiSample2
//
//  Created by 本橋淳哉 on 2021/01/08.
//

import UIKit
import Lottie

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var onboradArray = ["1", "2", "3", "4", "5"]
    var onboradStringArray = ["オンボード１", "オンボード2", "オンボード3", "オンボード4", "オンボード5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ページング可能にする
        scrollView.isPagingEnabled = true
        setupScroll()
        for i in 0...4 {
            let animationView = AnimationView()
            let animation = Animation.named(onboradArray[i])
            animationView.frame = CGRect(x: CGFloat(Double(CGFloat(i)*view.frame.size.width)), y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupScroll() {
        scrollView.delegate = self
        // 横のサイズはscrollviewに表示する画像分にする
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height)
        for i in 0...4 {
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(Double(CGFloat(i)*view.frame.size.width)), y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboradStringArray[i]
            scrollView.addSubview(onboardLabel)
        }
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
