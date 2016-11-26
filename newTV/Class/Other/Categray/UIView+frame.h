//
//  UIView+frame.h
//  newTV
//
//  Created by henghao.jiao on 16/9/14.
//  Copyright © 2016年 menhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)
@property (nonatomic, assign) CGFloat mh_x;
@property (nonatomic, assign) CGFloat mh_y;
@property (nonatomic, assign) CGFloat mh_width;
@property (nonatomic, assign) CGFloat mh_height;

@property (nonatomic, assign) CGPoint mh_origin;
@property (nonatomic, assign) CGSize  mh_size;
@end
