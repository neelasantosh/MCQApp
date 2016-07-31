//
//  ViewController.m
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseHelper.h"
#import "subject.h"
#import "questions.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize arraySubjectList,textSubject,pickerView1,selectedSubject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arraySubjectList=[[NSMutableArray alloc]init];
    arraySubjectList=[DatabaseHelper getAllSubject];
    
    pickerView1.dataSource=self;
    pickerView1.delegate=self;
    
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arraySubjectList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    subject *c=[arraySubjectList objectAtIndex:row];
    return c.subject_title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    subject *c=[arraySubjectList objectAtIndex:row];
    
    textSubject.text=[NSString stringWithFormat:@"%@",c.subject_title] ;
    
    selectedSubject=[arraySubjectList objectAtIndex:row];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ActionStartTest:(id)sender {
}
@end
