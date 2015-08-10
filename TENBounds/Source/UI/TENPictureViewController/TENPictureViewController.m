//
//  TENPictureViewController.m
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENPictureViewController.h"

NS_ENUM(NSUInteger, TENDirection) {
    TENDirectionUp = 1,
    TENDirectionDown = 2,
    TENDirectionLeft = 3,
    TENDirectionRight = 4
};

static const CGFloat TENDefaultOffset   = 100;

@interface TENPictureViewController ()

- (void)changeBoundsX:(CGFloat)offsetX boundsY:(CGFloat)offsetY;

@end

@implementation TENPictureViewController

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onNavigationButton:(UIButton *)sender {
    NSLog(@"%ld", (long)sender.tag);
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    switch (sender.tag) {
        case TENDirectionUp:
            offsetY += TENDefaultOffset;
            break;
        case TENDirectionDown:
            offsetY -= TENDefaultOffset;
            break;
        case TENDirectionLeft:
            offsetX += TENDefaultOffset;
            break;
        case TENDirectionRight:
            offsetX -= TENDefaultOffset;
            break;
            
        default:
            break;
    }
    
    [self changeBoundsX:offsetX boundsY:offsetY];
}

- (IBAction)onZoomButton:(UIButton *)sender {
    UIView *view = self.yellowView;
    
    NSLog(@"before %@", NSStringFromCGRect(self.yellowView.bounds));
    
    CGRect bounds = view.bounds;
    bounds.size.height *= 0.8;
    bounds.size.width *= 0.8;

    [UIView animateWithDuration:0.3
                     animations:^{
                         self.yellowView.bounds = bounds;
                     }];

    NSLog(@"after %@", NSStringFromCGRect(self.yellowView.bounds));

}

#pragma mark -
#pragma mark Private

- (void)changeBoundsX:(CGFloat)offsetX boundsY:(CGFloat)offsetY {
    UIView *view = self.yellowView;
    
    CGRect bounds = view.bounds;
    bounds.origin.x += offsetX;
    bounds.origin.y += offsetY;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.yellowView.bounds = bounds;
                     }];
}

@end
