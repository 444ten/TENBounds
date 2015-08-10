//
//  TENBoundsViewController.m
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENBoundsViewController.h"

static const NSTimeInterval TENAnimateDuration  = 0.5;
static const CGFloat        TENTableOffset      = 100;

@interface TENBoundsViewController ()

@end

@implementation TENBoundsViewController

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
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell number %ld", indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UITableView *tableView = self.tableView;
    
    NSLog(@"offset = %f", tableView.contentOffset.y);
}

@end
