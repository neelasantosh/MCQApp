//
//  questions.h
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface questions : NSObject

//CREATE TABLE questions (sub_code integer,que_no integer,que_text text,option1 text,option2 text,option3 text,option4 text,right_option text);
@property int sub_code,que_no;
@property NSString *que_text,*option1,*option2,*option3,*option4,*right_option;
@property int notAttempted;

@end
