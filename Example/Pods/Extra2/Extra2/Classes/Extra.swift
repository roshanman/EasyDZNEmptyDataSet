//
//  Extra.swift
//  Pods
//
//  Created by morenotepad@163.com on 11/02/2017.
//  Copyright (c) 2017 morenotepad@163.com. All rights reserved.
//
//

import Foundation
import UIKit

public protocol Extra: NSObjectProtocol {
    var extra: ExtraBox { get }
}

public class ExtraBox: CustomStringConvertible, CustomDebugStringConvertible {
    
    private var box = [String: Any]()
    
    public func put(key: String, value: Any) {
        box[key] = value
    }
    
    public func get<T>(key: String) -> T? {
        return box[key] as? T
    }
    
    public func merge(other: Extra, `override`: Bool = false) {
        for (key, value) in other.extra.box {
            if override || box[key] == nil {
                box[key] = value
            }
        }
    }
    
    public func removeAll() {
        box.removeAll()
    }
    
    public func remove(key: String) {
        box.removeValue(forKey: key)
    }
    
    public var count: Int {
        return box.count
    }
    
    public var isEmpty: Bool {
        return box.isEmpty
    }
    
    public func makeIterator() -> DictionaryIterator<String, Any> {
        return box.makeIterator()
    }
    
    public var description: String {
        return box.description
    }
    
    public var debugDescription: String {
        return box.debugDescription
    }
}

fileprivate struct AssociatedKeys {
    static var extra = "AssociatedKeys_Extra"
}

extension Extra {
    
    public var extra: ExtraBox {
        if let box = objc_getAssociatedObject(self, &AssociatedKeys.extra) as? ExtraBox {
            return box
        }
        
        let box = ExtraBox()
        
        objc_setAssociatedObject(
            self,
            &AssociatedKeys.extra,
            box,
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        
        return box
    }
}

extension UIViewController: Extra { }
extension UIApplication: Extra { }
