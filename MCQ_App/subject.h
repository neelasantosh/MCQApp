//
//  subject.h
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface subject : NSObject


//CREATE TABLE subject (subject_code integer,subject_title text);
//CREATE TABLE questions (sub_code integer,que_no integer,que_text text,option1 text,option2 text,option3 text,option4 text,right_option text);
@property int * subject_code;
@property NSString *subject_title;

@end
