//
//  EasyDZNEmptyDataSet.swift
//  EasyDZNEmptyDataSet
//
//  Created by morenotepad@163.com on 11/07/2017.
//  Copyright (c) 2017 morenotepad@163.com. All rights reserved.
//

import DZNEmptyDataSet
import Extra2

public enum EmptyDataReason {
    case loading
    case empty
    case error(Error)
}

extension UIViewController {
    public var emptyDataReason: EmptyDataReason {
        get {
            return extra.get(key: "EasyEmptyDataReason") ?? .loading
        }
        
        set {
            extra.put(key: "EasyEmptyDataReason", value: newValue as Any)
        }
    }
}

extension UIViewController: DZNEmptyDataSetSource {

    @objc open func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return nil
    }

    @objc open func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return nil
    }
    
    @objc open func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return nil
    }

    @objc open func imageTintColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return nil
    }
    
    @objc open func imageAnimation(forEmptyDataSet scrollView: UIScrollView!) -> CAAnimation! {
        return nil
    }
    
    @objc open func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        return nil
    }

    @objc open func buttonImage(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> UIImage! {
        return nil
    }
    
    @objc open func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> UIImage! {
        return nil
    }
    
    @objc open func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return nil
    }
    
    @objc open func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
        return nil
    }
    
    @objc open func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return 0
    }
    
    @objc open func spaceHeight(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return 0
    }
}

extension UIViewController: DZNEmptyDataSetDelegate {
    @objc open func emptyDataSetShouldFade(in scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    @objc open func emptyDataSetShouldBeForced(toDisplay scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    @objc open func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    @objc open func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    @objc open func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    @objc open func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    @objc open func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        
    }
    
    @objc open func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        
    }
    
    @objc open func emptyDataSetWillAppear(_ scrollView: UIScrollView!) {
        
    }
    
    @objc open func emptyDataSetDidAppear(_ scrollView: UIScrollView!) {
        
    }
    
    @objc open func emptyDataSetWillDisappear(_ scrollView: UIScrollView!) {
        
    }
    
    @objc open func emptyDataSetDidDisappear(_ scrollView: UIScrollView!) {
        
    }
}
