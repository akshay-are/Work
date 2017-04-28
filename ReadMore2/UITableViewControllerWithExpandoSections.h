//
//  UITableViewControllerWithExpandoSections.h
//  ReadMore2
//
//  Created by Anveshak on 27/04/17.
//  Copyright © 2017 Anveshak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewControllerWithExpandoSections : UITableViewController
{
    NSMutableIndexSet *expandedSections;
}

@property(nonatomic,retain)NSMutableArray *arr;

@end
