//
//  NextViewController.m
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"
#import "DatabaseHelper.h"
#import "subject.h"
#import "questions.h"

@interface NextViewController ()

@end

@implementation NextViewController

@synthesize textOption1,textOption2,textoption3,textOption4,textViewQueText,labelQNO,segMent,arrayQuestions,currentPos,viewData,totalQuestion,attempted,right,marks,notattempted,rtAnswer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    UIBarButtonItem *buttonList=[[UIBarButtonItem alloc]initWithTitle:@"Result" style:UIBarButtonItemStylePlain target:self action:@selector(showResult)];
    //to add button to right
    self.navigationItem.rightBarButtonItem=buttonList;
    
    
    ViewController *viewCon=[[self.navigationController viewControllers]objectAtIndex:0];
    subject *sub=viewCon.selectedSubject;
      self.navigationItem.title=[NSString stringWithFormat: @"%@",sub.subject_title];
    
    arrayQuestions=[[NSMutableArray alloc]init];
    
    
    arrayQuestions=[DatabaseHelper getQusetionsOfSubject:sub];
    
    [textOption4 setEnabled:false];
    [textoption3 setEnabled:false];
    [textOption2 setEnabled:false];
    [textOption1 setEnabled:false];
    [textViewQueText setEditable:false];
   
    questions *q=[arrayQuestions objectAtIndex:currentPos];
    textViewQueText.text=q.que_text;
    textOption1.text=q.option1;
    textOption2.text=q.option2;
    textoption3.text=q.option3;
    textOption4.text=q.option4;
    labelQNO.text=[NSString stringWithFormat:@"QNo:%d",q.que_no];
   
    
    
    
    
    UISwipeGestureRecognizer *swipeRecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onSwipe:)];
    
    swipeRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
    [viewData addGestureRecognizer:swipeRecognizer];
    [viewData setUserInteractionEnabled:true];

    
    totalQuestion=arrayQuestions.count;
    attempted=0;
    right=0;
    marks=0;
    notattempted=0;
    NSString *rtAnswer=@"";
    
    segMent.selectedSegmentIndex=4;
    
}


-(void)onSwipe:(UISwipeGestureRecognizer *)gesture
{
    
    if ( gesture.state==UIGestureRecognizerStateRecognized)
    {
        NSLog(@"Swipe Done");
        attempted++;
        currentPos ++;
        if (currentPos>=arrayQuestions.count) {
            currentPos=0;
        }
        
        
        questions *q=[arrayQuestions objectAtIndex:currentPos];
        textViewQueText.text=q.que_text;
        textOption1.text=q.option1;
        textOption2.text=q.option2;
        textoption3.text=q.option3;
        textOption4.text=q.option4;
        labelQNO.text=[NSString stringWithFormat:@"QNo:%d",q.que_no];
       
         rtAnswer=q.right_option;
       // NSLog(@"%@",rtAnswer);
        
    }
    
    
}

- (IBAction)ActionSegmentChanged:(id)sender {
    
    switch (segMent.selectedSegmentIndex) {
        case 0:
        {
            
            NSString *selectedanswer=[NSString stringWithFormat:@"%@",textOption1.text];
            if ([selectedanswer isEqualToString:rtAnswer]) {
                right++;
                
                            }
            
            
            
        }
            break;
        
        case 1:
        {
                        NSString *selectedanswer=[NSString stringWithFormat:@"%@",textOption2.text];
            if ([selectedanswer isEqualToString:rtAnswer]) {
                right++;
            }
                               }
            break;
        case 2:
        {
            
            NSString *selectedanswer=[NSString stringWithFormat:@"%@",textoption3.text];
            if ([selectedanswer isEqualToString:rtAnswer]) {
                right++;
            }
            
        }
            break;
        case 3:
        {
            
            NSString *selectedanswer=[NSString stringWithFormat:@"%@",textOption4.text];
            if ([selectedanswer isEqualToString:rtAnswer]) {
                right++;
            }
            
        }
            break;
        case 4:
        {
            notattempted++;
            
        }
            break;

        default:
            break;
    }
    
    
    
    
    
}




-(void)showResult
{
    NSString *res=[NSString stringWithFormat:@"Total Questions=%d\nAttempted=%d\nNot Attempted=%d\nRight=%d\nMarks=%d/%d",totalQuestion,attempted,notattempted,right,right,6];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Result" message:res delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
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

@end
