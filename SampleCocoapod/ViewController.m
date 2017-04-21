//
//  ViewController.m
//  SampleCocoapod
//
//  Created by Anveshak on 4/20/17.
//  Copyright © 2017 Anveshak. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"HEllo...");
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _namearr=[[NSMutableArray alloc]initWithObjects:@"Akshay",@"Mandar",@"Shantanu",@"Raghu",@"Aditya",@"Gaurav", nil];
    _imgarr=[[NSMutableArray alloc]init];
    [self sampleParsing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _imgarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[_tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.lbl.text=[_namearr objectAtIndex:indexPath.row];
    NSString *tempstr=[_imgarr objectAtIndex:indexPath.row];
    cell.btn.tag=indexPath.row;
    [cell.imgview sd_setImageWithURL:[NSURL URLWithString:tempstr]
                    placeholderImage:[UIImage imageNamed:@"http://sorisomail.com/img/1372027087870.jpg"]];

   // dispatch_async(queue, ^{
        
    
        
      //  dispatch_async(dispatch_get_main_queue(), ^{
        //    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
       // });
        
        
   // });

    
    
    
    
    
        return cell;
}


-(void)sampleParsing
{
    queue=dispatch_queue_create("images", DISPATCH_QUEUE_CONCURRENT);
    queue=dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);

    [_imgarr removeAllObjects];
    NSString *urlstr=@"http://siddhantedu.com/iOSAPI/invited1.php";
    
    //http://siddhantedu.com/iOSAPI/invited.php";
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    
    
    
    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                {
                                    
                                    if(data==nil)
                                    {
                                        NSLog(@"Data is nil");
                                        
                                    }
                                    
                                    else
                                    {
                                        
                                        
                                        NSLog(@"%@",response);
                                        
                                        
                                        NSDictionary *outerdic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                        
                                        NSArray *keyarr=[outerdic objectForKey:@"inviteds"];
                                        
                                        for(NSDictionary *temp in keyarr)
                                        {
                                            NSString *str1=[[temp objectForKey:@"name"]description];
                                            NSString *str2=[[temp objectForKey:@"university"]description];
                                            NSString *str3=[temp objectForKey:@"session_name"];
                                            NSString *str4=[temp objectForKey:@"images"];
                                            NSString *abstractstr=[temp objectForKey:@"abstract"];
                                            
                                            NSLog(@"%@    %@    %@      %@ ",str1,str2,str3,abstractstr);
                                            
                                            NSLog(@"*******IMAGE%@",str4);
                                            [_imgarr addObject:str4];
                                            
                                            [_tableView reloadData];
                                        }
                                        [_tableView reloadData];
                                    }
                                    [_tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
                                }];
    [task resume];
    [_tableView reloadData];
}



- (IBAction)btnclick:(id)sender {
    UIButton *button=sender;
    
    if(button.tag==0)
    {
        NSLog(@"%@",[_namearr objectAtIndex:button.tag]);
    }
    else
    {
    NSLog(@"button tag value...   %ld",(long)button.tag);
    NSLog(@"%@",[_imgarr objectAtIndex:button.tag]);
    }
    
}
@end
