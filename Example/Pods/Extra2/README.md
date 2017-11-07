
[![CI Status](https://img.shields.io/travis/rust-lang/rust.svg)]()
[![CI Status](https://img.shields.io/badge/Swift-3.1-orange.svg)](https://swift.org/)
[![Version](https://img.shields.io/cocoapods/v/Extra2.svg?style=flat)](http://cocoapods.org/pods/Extra)
[![Carthage compatible](https://img.shields.io/badge/Carthage-unCompatible-flat.svg)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Extra.svg?style=flat)](http://cocoapods.org/pods/Extra)
[![Platform](https://img.shields.io/cocoapods/p/Extra.svg?style=flat)](http://cocoapods.org/pods/Extra)

## Sumamary
类似Android的界面传值工具Extra.

## Example

For a detailed example, see the [Example](https://github.com/roshanman/Extra/tree/master/Example)!
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Example Code
```swift
class ViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        
        dest.extra.put(key: "title", value: "ViewController2")
        dest.extra.put(key: "textView", value: "Created by morenotepad@163.com")
        dest.extra.put(key: "button", value: "BackButton")
        dest.extra.put(key: "imageView", value: #imageLiteral(resourceName: "button.png"))
        dest.extra.put(key: "progressView", value: Float(0.8))
        dest.extra.put(key: "switch", value: false)
        dest.extra.put(key: "backgroundColor", value: UIColor.white)
        dest.extra.put(key: "progressTintColor", value: UIColor.red)
    }
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var `switch`: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title                   = extra.get(key: "title")
        textView.text           = extra.get(key: "textView")
        imageView.image         = extra.get(key: "imageView")
        `switch`.isOn           = extra.get(key: "switch") ?? true
        view.backgroundColor    = extra.get(key: "backgroundColor")
        progressView.progress   = extra.get(key: "progressView") ?? 0.1
        progressView.progressTintColor = extra.get(key: "progressTintColor")

        button.setTitle(extra.get(key: "button"), for: .normal)
    }
}
```

![""](https://github.com/roshanman/Extra/blob/master/ScreenShot.gif)

## Requirements

* Xcode 8.x
* Swift 3.x

## Installation

### CocoaPods

```ruby
pod 'Extra'
```

### Carthage

```ruby
github "roshanman/Extra"
```

## Author

morenotepad@163.com

## License

Extra is available under the MIT license. See the LICENSE file for more info.
