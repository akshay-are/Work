//
//  TableViewController1.h
//  Akshay Demo
//
//  Created by Mac on 22/03/18.
//  Copyright © 2018 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController1 : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)NSMutableArray *namearray,*useridarr,*idarr,*titlearr,*bodyarr;
@property (strong, nonatomic) IBOutlet UITableView *tableview1;
-(void)dataparsing;
- (IBAction)btnclick:(id)sender;


@end
