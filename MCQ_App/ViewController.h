//
//  ViewController.h
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "subject.h"


@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView1;
@property (strong, nonatomic) IBOutlet UITextField *textSubject;


- (IBAction)ActionStartTest:(id)sender;


@property NSMutableArray *arraySubjectList;

@property subject* selectedSubject;




@end

