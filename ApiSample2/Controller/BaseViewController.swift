//
//  BaseViewController.swift
//  ApiSample2
//
//  Created by 本橋淳哉 on 2021/01/09.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        defaultSelectedIndex = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func segementSlideHeaderView() -> UIView? {
        let headerView = UIImageView()
        // タップなどのイベントを有効にするかどうかのプロパティ
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "header")
        /**このプロパティはAuto Layout以前に使われていた、Autosizingのレイアウトの仕組みをAuto Layoutに変換するかどうかを設定するフラグ
           デフォルトではオンになっていて、オンのままだと期待通りのAuto Layout設定ができない場合があるのでオフにする。
         */
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerHeight : CGFloat
        if #available(iOS 11.0, *) {
            headerHeight = view.bounds.height/4 + view.safeAreaInsets.top
        } else {
            headerHeight = view.bounds.height/4 + topLayoutGuide.length
        }
        
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        
        return headerView
    }
    
    override var titlesInSwitcher: [String] {
        return ["tab1", "tab2", "tab3", "tab4", "tab5", "tab6"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return Page1ViewController()
        case 1:
            return Page2ViewController()
        case 2:
            return Page3ViewController()
        case 3:
            return Page4ViewController()
        case 4:
            return Page5ViewController()
        case 5:
            return Page6ViewController()
        default:
            return Page1ViewController()
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
