//
//  JsonTableViewController.h
//  Jsonparsing3
//
//  Created by Rajesh on 17/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonTableViewController : UITableViewController
@property NSMutableArray *arrayData;
@property NSMutableDictionary *dicData;
- (IBAction)actionRefresh:(id)sender;

@end
