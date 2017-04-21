//
//  ViewController.h
//  SampleCocoapod
//
//  Created by Anveshak on 4/20/17.
//  Copyright © 2017 Anveshak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    dispatch_queue_t queue;
}

- (IBAction)btnclick:(id)sender;
@property(nonatomic,retain)NSMutableArray *namearr,*imgarr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

