//
//  TENHeaderView.m
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENHeaderView.h"

@implementation TENHeaderView

- (void)awakeFromNib {
    self.imageView.image = [UIImage imageNamed:@"map.jpg"];    
}


#pragma mark -
#pragma mark Public

- (void)updateFrame {
    CGRect frame = self.frame;
    CGFloat imageHeight =self.imageViewHeight.constant;
    frame.size.height = imageHeight;
    
    self.frame = frame;
    
    [self layoutIfNeeded];
    [self updateConstraintsIfNeeded];
}


@end
