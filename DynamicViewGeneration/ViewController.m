//
//  ViewController.m
//  DynamicViewGeneration
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textName,count,nameListView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)add:(id)sender {
    
    CGPoint labelPoint = CGPointMake(20, 20+(60*count));
    //CGSize labelSize = CGSizeMake(150, 50);
    CGRect labelRect = CGRectMake(20,labelPoint.y,150,50);
    if(labelPoint.y<370){
    //create the label
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:labelRect];
    [nameLabel setBackgroundColor:[UIColor greenColor]];
    [nameListView addSubview:nameLabel];
    nameLabel.text = textName.text;
    
    //add button
    CGRect buttonRect = CGRectMake(180, 20+(60*count), 50, 50);
    UIButton *buttonClose = [[UIButton alloc]initWithFrame:buttonRect];
    
    buttonClose.backgroundColor = [UIColor greenColor];
    buttonClose.tintColor =[UIColor blackColor];
    [buttonClose setTitle:@"X" forState:UIControlStateNormal];
    
    [nameListView addSubview:buttonClose];
    count++;
    
    //add action for close button
    [buttonClose addTarget:self action:@selector(removeCurrentRow:) forControlEvents:UIControlEventTouchUpInside];
    
    nameLabel.tag = count;//assign a number to the label
    buttonClose.tag = count;
}
}
-(IBAction)removeCurrentRow:(id)sender
{
    
    NSLog(@"clicked on close button");
    long labelTag = [sender tag];//find tag of button,which is equal to tag of label
     [sender removeFromSuperview];//removes current button from view
    //find object of label using its tag
    UILabel *label = (UILabel *)[nameListView viewWithTag:labelTag];
    [label removeFromSuperview];
}


@end
