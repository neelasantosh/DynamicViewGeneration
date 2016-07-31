//
//  JsonTableViewController.m
//  Jsonparsing3
//
//  Created by Rajesh on 17/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "JsonTableViewController.h"

@interface JsonTableViewController ()

@end

@implementation JsonTableViewController
@synthesize arrayData,dicData;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    dicData=[arrayData objectAtIndex:indexPath.row];
    NSString *name=[dicData objectForKey:@"name"];
    NSNumber *phone=[dicData objectForKey:@"phone"];
    NSMutableDictionary *addressDic=[dicData objectForKey:@"address"];
    NSString *city=[addressDic objectForKey:@"city"];
    cell.textLabel.text=name;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"Phone : %@ City : %@",phone,city];
    
    
    
    return cell;
}



- (IBAction)actionRefresh:(id)sender {
    NSURL *cityUrl=[NSURL URLWithString:@"http://jsonplaceholder.typicode.com/users"];
    NSURLRequest *req=[NSURLRequest requestWithURL:cityUrl];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        {
            NSError *err;
            arrayData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
            
            NSLog(@"%@",arrayData);
            [self.tableView reloadData];
        }
        
    }];

}
@end
