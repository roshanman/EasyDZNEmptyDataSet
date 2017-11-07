//
//  ViewController.swift
//  EasyDZNEmptyDataSet
//
//  Created by morenotepad@163.com on 11/07/2017.
//  Copyright (c) 2017 morenotepad@163.com. All rights reserved.
//

import UIKit
import EasyDZNEmptyDataSet

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.emptyDataSetSource   = self
            scrollView.emptyDataSetDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    func test() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(0)) {
            self.emptyDataReason = .loading
            self.scrollView.reloadEmptyDataSet()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(3)) {
            self.emptyDataReason = .empty
            self.scrollView.reloadEmptyDataSet()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(6)) {
            
            let error = NSError(
                domain: "Demo",
                code: -1,
                userInfo: [
                    NSLocalizedDescriptionKey: "获取数据失败,请检查您的网络是否有问题"
                ]
            )
            
            self.emptyDataReason = .error(error)
            self.scrollView.reloadEmptyDataSet()
        }
    }
    
    override func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
        switch emptyDataReason {
        case .empty:
            return NSAttributedString(string: "空空如也什么也没有呢~")
        case .loading:
            return NSAttributedString(string: "正在拼命加载数据,请稍后")
        case .error(let error as NSError):
            return NSAttributedString(string: error.localizedDescription)
        }
    }

    override func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return nil
    }

    override func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        
        switch emptyDataReason {
        case .empty:
            return #imageLiteral(resourceName: "empty.jpeg")
        case .loading:
            return UIImage.animatedImage(
                with: (1...30).map{UIImage(named: "loading\($0)")!},
                duration: 1
            )
        case .error(_):
            return #imageLiteral(resourceName: "load_failure.png")
        }
    }
    
//    override func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
//        if case .loading = emptyDataReason {
//            let act = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//            act.startAnimating()
//
//            return act
//        }
//
//        return nil
//    }
    
    override func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return .white
    }

    override func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        
        if case .error = emptyDataReason {
            return NSAttributedString(string: "点我重试哦😯~")
        }
        
        return nil
    }
    
    override func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        test()
    }
}

