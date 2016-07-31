//
//  DatabaseHelper.h
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "subject.h"
#import "questions.h"


@interface DatabaseHelper : NSObject

+(NSString *)dbpath;
+(NSMutableArray *)getAllSubject;
+(NSMutableArray *)getQusetionsOfSubject:(subject *)subject;


@end
