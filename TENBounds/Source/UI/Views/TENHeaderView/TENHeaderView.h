//
//  TENHeaderView.h
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENHeaderView : UIView
@property (nonatomic, weak)     IBOutlet NSLayoutConstraint *imageViewHeight;
@property (nonatomic, weak)     IBOutlet NSLayoutConstraint *lessImageViewHeight;
@property (nonatomic, weak)     IBOutlet NSLayoutConstraint *imageViewVerticalOffset;
@property (nonatomic, weak)     IBOutlet UIImageView        *imageView;

- (void)updateFrame;

@end
