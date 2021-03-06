//
//  UIView+frame.m
//  newTV
//
//  Created by henghao.jiao on 16/9/14.
//  Copyright © 2016年 menhao. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)
- (void)setMh_x:(CGFloat)mh_x
{
    CGRect frame = self.frame;
    frame.origin.x = mh_x;
    self.frame = frame;
}

- (CGFloat)mh_x
{
    return self.frame.origin.x;
}

- (void)setMh_y:(CGFloat)mh_y
{
    CGRect frame = self.frame;
    frame.origin.y = mh_y;
    self.frame = frame;
}

- (CGFloat)mh_y
{
    return self.frame.origin.y;
}

- (void)setMh_width:(CGFloat)mh_width
{
    CGRect frame = self.frame;
    frame.size.width =mh_width;
    self.frame = frame;
}

- (CGFloat)mh_width
{
    
    
    return self.frame.size.width;
}

- (void)setMh_height:(CGFloat)mh_height
{
    CGRect frame = self.frame;
    frame.size.height = mh_height;
    self.frame = frame;
}

- (CGFloat)mh_height
{
    return self.frame.size.height;
}

- (void)setMh_origin:(CGPoint)mh_origin
{
    CGRect frame = self.frame;
    frame.origin = mh_origin;
    self.frame = frame;
}

- (CGPoint)mh_origin
{
    return self.frame.origin;
}

-(void)setMh_size:(CGSize)mh_size
{
    CGRect frame = self.frame;
    frame.size = mh_size;
    self.frame = frame;
}

-(CGSize)mh_size
{
    return self.frame.size;
}

@end
