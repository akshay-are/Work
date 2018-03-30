//
//  ViewController1.h
//  Akshay Demo
//
//  Created by Mac on 22/03/18.
//  Copyright © 2018 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController1 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nlabel;
@property(nonatomic,retain)NSString *namestr;
- (IBAction)savebutton:(id)sender;

@end
