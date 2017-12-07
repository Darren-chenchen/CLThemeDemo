//
//  CustomStyle.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CustomStyle<T> {
    
    
    // outPut
    var styleDrive: Driver<T> // 外部输出属性，即呈现给外部的模式样式
    
    fileprivate let disposeBag = DisposeBag() // 监听者自动销毁器
    
    init(themeStyle: T) {
        
        // 默认日间模式
        styleDrive = ListeningThemeAdjuster.listeningTheme.asObservable().flatMapLatest { (dict) -> Observable<T> in
                return Observable.just(themeStyle)
            }
            .asDriver(onErrorJustReturn: themeStyle)
    }
}

