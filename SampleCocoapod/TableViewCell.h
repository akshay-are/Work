//
//  TableViewCell.h
//  SampleCocoapod
//
//  Created by Anveshak on 4/20/17.
//  Copyright © 2017 Anveshak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
