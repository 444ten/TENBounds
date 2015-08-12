//
//  TENBoundsViewController.m
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENBoundsViewController.h"

#import "NSBundle+TENExtensions.h"
#import "NSBundle+THSExtensions.h"

#import "TENHeaderView.h"

static const NSTimeInterval TENAnimateDuration  = 0.5;
static const CGFloat        TENTableOffset      = 100;

@interface TENBoundsViewController ()

@end

@implementation TENBoundsViewController

@dynamic headerView;

#pragma mark -
#pragma mark Accessors

- (TENHeaderView *)headerView {
    UITableView *table = self.tableView;
    TENHeaderView *result = (TENHeaderView *)table.tableHeaderView;
    if (nil == result) {
        result = [NSBundle loadNibWithClass:[TENHeaderView class]];
        table.tableHeaderView = result;
    }
    
    return result;
}

#pragma mark -
#pragma mark View Controller Life Cycle

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    
//    TENHeaderView *headerView = self.headerView;
//    CGRect bounds = self.view.bounds;
//    CGFloat offsetY = bounds.size.height;
//    headerView.imageViewVerticalOffset.constant = -offsetY;
//    CGFloat originHeight = headerView.imageViewHeight.constant;
//    
//    [headerView updateConstraintsIfNeeded];
//    [headerView layoutIfNeeded];
//    
//    [self.tableView setContentOffset:CGPointMake(0, -offsetY) animated:NO];
//    
//    [UIView animateWithDuration:1.0
//                     animations:^{
//                         headerView.imageViewVerticalOffset.constant = 0;
//                         headerView.imageViewHeight.constant = originHeight;
//                         
//                         [headerView updateConstraintsIfNeeded];
//                         [headerView layoutIfNeeded];
//                         
//                         [self.tableView setContentOffset:CGPointZero animated:NO];
//                     }
//                     completion:^(BOOL finished) {
//                     }];
//    
//}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onUpButton:(id)sender {
    CGRect bounds = self.tableView.bounds;
    bounds.origin.y += TENTableOffset;

    [UIView animateWithDuration:TENAnimateDuration
                     animations:^{
                         self.tableView.bounds = bounds;
                     }];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell number %ld", (long)indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UITableView *)tableView {
    
    NSLog(@"%f", tableView.contentOffset.y);
    
}

@end
