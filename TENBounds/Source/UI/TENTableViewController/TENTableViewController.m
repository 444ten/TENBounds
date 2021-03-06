//
//  TENTableViewController.m
//  TENBounds
//
//  Created by 444ten on 8/11/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENTableViewController.h"

#import "NSBundle+THSExtensions.h"

#import "TENHeaderView.h"

@interface TENTableViewController ()
@property (nonatomic, assign)   CGFloat headerViewHeight;

@end

@implementation TENTableViewController

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect bounds = self.view.bounds;
    CGFloat height = bounds.size.height / 2;
    
    self.headerViewHeight = height;
    
    TENHeaderView *headerView = self.headerView;
    headerView.imageViewHeight.constant = height;
    headerView.lessImageViewHeight.constant = height;
    [headerView updateConstraintsIfNeeded];

    [headerView updateFrame];
//    [headerView layoutIfNeeded];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
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
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UITableView *)tableView {
    TENHeaderView *headerView = (TENHeaderView *)tableView.tableHeaderView;
    CGFloat offsetY = tableView.contentOffset.y;
    
    if (offsetY < 0) {
        headerView.imageViewHeight.active = YES;
        headerView.lessImageViewHeight.active = NO;
    } else {
        headerView.imageViewHeight.active = NO;
        headerView.lessImageViewHeight.active = YES;
    }

    if (offsetY < self.headerViewHeight / 2) {
        headerView.imageViewVerticalOffset.constant = tableView.contentOffset.y;
        [headerView updateConstraintsIfNeeded];
        [headerView layoutIfNeeded];
    }
}

- (void)scrollViewDidEndDragging:(UITableView *)tableView willDecelerate:(BOOL)decelerate {
    CGFloat offsetY = tableView.contentOffset.y;
    
    if (offsetY > 0 && offsetY < self.headerViewHeight / 2) {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.contentOffset = CGPointZero;
        }];
    }
}

@end
