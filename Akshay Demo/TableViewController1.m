//
//  TableViewController1.m
//  Akshay Demo
//
//  Created by Mac on 22/03/18.
//  Copyright © 2018 Mac. All rights reserved.
//

#import "TableViewController1.h"
#import "TableViewCell1.h"
#import "ViewController1.h"


@interface TableViewController1 ()

@end

@implementation TableViewController1


-(void)viewWillAppear:(BOOL)animated
{
    
    [self dataparsing];
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview1.delegate=self;
    _tableview1.dataSource=self;
    _useridarr=[[NSMutableArray alloc]init];
    _idarr=[[NSMutableArray alloc]init];
    _titlearr=[[NSMutableArray alloc]init];
    _bodyarr=[[NSMutableArray alloc]init];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _titlearr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell1 *cell = [_tableview1 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLabel.text=[_titlearr objectAtIndex:indexPath.row];
    cell.btn.tag=indexPath.row;
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell1 *cell=[_tableview1 cellForRowAtIndexPath:indexPath];
    NSString *tempstr=[[NSString alloc]init];
    tempstr=cell.nameLabel.text;
    NSLog(@"%@",cell.nameLabel.text);
    
    }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"tabletoview"]) {
        NSIndexPath *indexPath = [self.tableview1 indexPathForSelectedRow];
        ViewController1 *vc1 = segue.destinationViewController;
        vc1.namestr=[_titlearr objectAtIndex:indexPath.row];
        //destViewController.namestr = [recipes objectAtIndex:indexPath.row];
    }
}
-(void)dataparsing
{
    NSString *str=@"https://jsonplaceholder.typicode.com/posts";
    NSMutableURLRequest *req=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLSessionConfiguration *conf=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:conf];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"RESPONSE %@",response);
        
        NSArray *outerarr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for(NSDictionary *dic1 in outerarr)
        {
            NSString *useridstr=[[dic1 objectForKey:@"userId"]description];
            NSString *idstr=[[dic1 objectForKey:@"id"]description];
            NSString *titlestr=[dic1 objectForKey:@"title"];
            NSString *bodystr=[dic1 objectForKey:@"body"];
            
          [_useridarr addObject:useridstr];
            [_idarr addObject:idstr];
            [_titlearr addObject:titlestr];
           [_bodyarr addObject:bodystr];
           // NSLog(@"TITLE:---*************%@",titlestr);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });

    }];
    [task resume];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnclick:(id)sender {
    
    UIButton *button=sender;
    NSLog(@"Button Value:-%ld",(long)button.tag);
}
@end
