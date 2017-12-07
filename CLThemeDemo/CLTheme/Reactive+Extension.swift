//
//  Reactive+Extension.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

///自定义 UIView 背景颜色监听者
extension Reactive where Base: UIView {
    var backgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { view, color in
            view.backgroundColor = color
        }
    }
    
    var alpha: UIBindingObserver<Base, CGFloat> {
        return UIBindingObserver(UIElement: base) { view, alpha in
            view.alpha = alpha
        }
    }
}

///自定义 UILabel 文字颜色监听者
extension Reactive where Base: UILabel {
    var textColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { label, result in
            label.textColor = result
        }
    }
}

///自定义 UIImageView 图片属性监听者
extension Reactive where Base: UIImageView {
    var image: UIBindingObserver<Base, UIImage> {
        return UIBindingObserver(UIElement: base) { imageView, result in
            imageView.image = result
        }
    }
    var imageColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { imageView, result in
            imageView.tintColor = result
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        }
    }
}

extension Reactive where Base: UIButton {
    var normalImage: UIBindingObserver<Base, UIImage?> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setImage(result, for: .normal)
        }
    }
    
    var selectedImage: UIBindingObserver<Base, UIImage> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setImage(result, for: .selected)
        }
    }
    
    var textColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setTitleColor(result, for: .normal)
        }
    }
    var selectTextColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.setTitleColor(result, for: .selected)
        }
    }
    
    var normalImgColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.tintColor = result
            let img = button.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            button.setImage(img, for: .normal)
        }
    }
    var selectImgColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { button, result in
            button.tintColor = result
            let img = button.image(for: .selected)?.withRenderingMode(.alwaysTemplate)
            button.setImage(img, for: .selected)
        }
    }
}

extension Reactive where Base: UICollectionView {
    var backgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { collectionView, result in
            collectionView.backgroundColor = result
        }
    }
}
extension Reactive where Base: UITableView {
    var backgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { tableView, result in
            tableView.backgroundColor = result
        }
    }
}

extension Reactive where Base: UISearchBar {
    var backgroundImg: UIBindingObserver<Base, UIImage> {
        return UIBindingObserver(UIElement: base) { searchBar, result in
            searchBar.backgroundImage = result
        }
    }
}
extension Reactive where Base: UIActivityIndicatorView {
    var style: UIBindingObserver<Base, UIActivityIndicatorViewStyle> {
        return UIBindingObserver(UIElement: base) { activite, result in
            activite.activityIndicatorViewStyle = result
        }
    }
}
extension Reactive where Base: UIToolbar {
    var style: UIBindingObserver<Base, UIBarStyle> {
        return UIBindingObserver(UIElement: base) { toobar, result in
            toobar.barStyle = result
        }
    }
}

extension Reactive where Base: UITextField {
    var textColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { textF, result in
            textF.textColor = result
        }
    }
}
extension Reactive where Base: UIProgressView {
    var trackTintColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: base) { progress, result in
            progress.trackTintColor = result
        }
    }
}



