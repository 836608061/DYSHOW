//
//  UIImage+extension.h
//  newTV
//
//  Created by henghao.jiao on 16/9/26.
//  Copyright © 2016年 menhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (extension)
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;
@end
