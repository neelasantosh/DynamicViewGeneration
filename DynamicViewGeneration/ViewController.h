//
//  ViewController.h
//  DynamicViewGeneration
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textName;

- (IBAction)add:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *nameListView;

@property int count;

-(IBAction)removeCurrentRow:(id)sender;


@end

