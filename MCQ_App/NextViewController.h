//
//  NextViewController.h
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController


-(void)showResult;

@property (strong, nonatomic) IBOutlet UILabel *labelQNO;
@property (strong, nonatomic) IBOutlet UITextView *textViewQueText;
@property (strong, nonatomic) IBOutlet UITextField *textOption1;

@property (strong, nonatomic) IBOutlet UITextField *textOption2;

@property (strong, nonatomic) IBOutlet UITextField *textoption3;
@property (strong, nonatomic) IBOutlet UITextField *textOption4;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segMent;

@property NSMutableArray *arrayQuestions;

@property (strong, nonatomic) IBOutlet UIView *viewData;


@property int currentPos;

-(void)onSwipe :(UISwipeGestureRecognizer *)gesture;

- (IBAction)ActionSegmentChanged:(id)sender;

@property int totalQuestion,attempted,right,marks,notattempted;

@property NSString *rtAnswer;
@end
