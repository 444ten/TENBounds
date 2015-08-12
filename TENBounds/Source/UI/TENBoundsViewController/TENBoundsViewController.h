//
//  TENBoundsViewController.h
//  TENBounds
//
//  Created by 444ten on 8/10/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "UIViewController+TENExtensions.h"

@class TENHeaderView;

@interface TENBoundsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;

@property (nonatomic, readonly) TENHeaderView   *headerView;

@end
