//
//  TENPictureViewController.m
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENPictureViewController.h"

static const CGFloat TENDefaultOffset   = 100;

@interface TENPictureViewController ()

- (void)changeBoundsX:(CGFloat)offsetX boundsY:(CGFloat)offsetY;

@end

@implementation TENPictureViewController

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onUpButton:(id)sender {
    [self changeBoundsX:0 boundsY:TENDefaultOffset];
}

- (IBAction)onDownButton:(id)sender {
    [self changeBoundsX:0 boundsY:-TENDefaultOffset];
}

#pragma mark -
#pragma mark Private

- (void)changeBoundsX:(CGFloat)offsetX boundsY:(CGFloat)offsetY {
    UIView *view = self.yellowView;
    
//    CGRect frame = view.frame;
    CGRect bounds = view.bounds;

    bounds.origin.x += offsetX;
    bounds.origin.y += offsetY;
    self.yellowView.bounds = bounds;
    
    NSLog(@"frame = %@", NSStringFromCGRect(self.yellowView.frame));
    NSLog(@"bounds = %@", NSStringFromCGRect(self.yellowView.bounds));
    
}

@end
