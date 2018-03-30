//
//  ViewController1.m
//  Akshay Demo
//
//  Created by Mac on 22/03/18.
//  Copyright © 2018 Mac. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    _nlabel.text=_namestr;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)savebutton:(id)sender {
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Title" message:@"Button is clicked.." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesbutton=[UIAlertAction actionWithTitle:@"Yes Please" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Yes Button Clicked");
    }];
    [alert addAction:yesbutton];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
