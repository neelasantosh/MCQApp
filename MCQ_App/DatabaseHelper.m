//
//  DatabaseHelper.m
//  MCQ_App
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "DatabaseHelper.h"
#import "subject.h"
#import "questions.h"
#import <sqlite3.h>

@implementation DatabaseHelper

+(NSString *)dbpath
{
    
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *dbFilePath=[bundle pathForResource:@"mcqapp" ofType:@"sqlite"];
    NSLog(@"Path :%@",dbFilePath);
    
    //move db file from bundle to document dir
    
    NSArray *arrayPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *appDocDirPath=[arrayPath objectAtIndex:0];
    
    NSString *dbPathInDocDir=[NSString stringWithFormat:@"%@/%@",appDocDirPath,@"mcqapp.sqlite"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL exist=[fileManager fileExistsAtPath:dbPathInDocDir];
    if (!exist) {
        [fileManager copyItemAtPath:dbFilePath toPath:dbPathInDocDir error:nil];
    }
    
    NSLog(@"The New Path :%@",dbPathInDocDir);
    
    return dbPathInDocDir;
}

+(NSMutableArray *)getAllSubject
{
    
    NSMutableArray *arrayData=[[NSMutableArray alloc]init];
    //execute sql on database to get student table records
    NSString *query=@"Select * from subject";
    
    //open database file
    sqlite3 *database;
    
    int result=sqlite3_open([[DatabaseHelper dbpath] UTF8String], &database);
    if (result==SQLITE_OK)//success
    {
        sqlite3_stmt *stmt;//sqlite3_stmt hold select query result
        //execute query
        
        int selectResult=sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, NULL);//for select query
        if (selectResult ==SQLITE_OK)//success
        {
            //read one row at a time from statement
            
            
            while(sqlite3_step(stmt)==SQLITE_ROW)//success in moving to next row
            {
                //read data of current row
                int sub_code=sqlite3_column_int(stmt, 0);
                const unsigned char *sub_title=sqlite3_column_text(stmt, 1);
                
                subject *s1=[[subject alloc]init];
                s1.subject_code=sub_code;
                s1.subject_title=[NSString stringWithUTF8String:sub_title];
                
              
                [arrayData  addObject:s1];
                NSLog(@"%d:%s",sub_code,sub_title);
                
            }//eof while
        }//eof if
    }//eof if
    
    sqlite3_close(database);
    
    return arrayData;
    
}


+(NSMutableArray *)getAllQusetions
{
    
    
    NSMutableArray *arrayData=[[NSMutableArray alloc]init];
    //execute sql on database to get student table records
    NSString *query=@"Select * from questions";
    
    //open database file
    sqlite3 *database;
    
    int result=sqlite3_open([[DatabaseHelper dbpath] UTF8String], &database);
    if (result==SQLITE_OK)//success
    {
        sqlite3_stmt *stmt;//sqlite3_stmt hold select query result
        //execute query
        
        int selectResult=sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, NULL);//for select query
        if (selectResult ==SQLITE_OK)//success
        {
            //read one row at a time from statement
            
            
            while(sqlite3_step(stmt)==SQLITE_ROW)//success in moving to next row
            {
                //read data of current row
                int sub_code=sqlite3_column_int(stmt, 0);
                int que_no=sqlite3_column_int(stmt, 1);
                const unsigned char *que_text=sqlite3_column_text(stmt, 2);
                const unsigned char *option1=sqlite3_column_text(stmt, 3);
                const unsigned char *option2=sqlite3_column_text(stmt, 4);
                const unsigned char *option3=sqlite3_column_text(stmt, 5);
                const unsigned char *option4=sqlite3_column_text(stmt, 6);
                const unsigned char *right_option=sqlite3_column_text(stmt, 7);
                
                questions *s1=[[questions alloc]init];
                
                s1.sub_code=sub_code;
                s1.que_no=que_no;
                s1.que_text=[NSString stringWithUTF8String:que_text];
                s1.option1=[NSString stringWithUTF8String:option1];
                s1.option2=[NSString stringWithUTF8String:option2];
                s1.option3=[NSString stringWithUTF8String:option3];
                s1.option4=[NSString stringWithUTF8String:option4];
                s1.right_option=[NSString stringWithUTF8String:right_option];
                
                
                
                [arrayData  addObject:s1];
                //NSLog(@"%d:%s:%s",sub_code,que_no,que_text);
                
            }//eof while
        }//eof if
    }//eof if
    
    sqlite3_close(database);
    
    return arrayData;

    
}

+(NSMutableArray *)getQusetionsOfSubject:(subject *)subject
{
    
    
    NSMutableArray *arrayData=[[NSMutableArray alloc]init];
    //execute sql on database to get student table records
    NSString *query=[NSString stringWithFormat:@"Select * from questions where sub_code=%d",subject.subject_code];
    
    //open database file
    sqlite3 *database;
    
    int result=sqlite3_open([[DatabaseHelper dbpath] UTF8String], &database);
    if (result==SQLITE_OK)//success
    {
        sqlite3_stmt *stmt;//sqlite3_stmt hold select query result
        //execute query
        
        int selectResult=sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, NULL);//for select query
        if (selectResult ==SQLITE_OK)//success
        {
            //read one row at a time from statement
            
            
            while(sqlite3_step(stmt)==SQLITE_ROW)//success in moving to next row
            {
                //read data of current row
                int sub_code=sqlite3_column_int(stmt, 0);
                int que_no=sqlite3_column_int(stmt, 1);
                const unsigned char *que_text=sqlite3_column_text(stmt, 2);
                const unsigned char *option1=sqlite3_column_text(stmt, 3);
                const unsigned char *option2=sqlite3_column_text(stmt, 4);
                const unsigned char *option3=sqlite3_column_text(stmt, 5);
                const unsigned char *option4=sqlite3_column_text(stmt, 6);
                const unsigned char *right_option=sqlite3_column_text(stmt, 7);
                
                questions *s1=[[questions alloc]init];
                
                s1.sub_code=sub_code;
                s1.que_no=que_no;
                s1.que_text=[NSString stringWithUTF8String:que_text];
                s1.option1=[NSString stringWithUTF8String:option1];
                s1.option2=[NSString stringWithUTF8String:option2];
                s1.option3=[NSString stringWithUTF8String:option3];
                s1.option4=[NSString stringWithUTF8String:option4];
                s1.right_option=[NSString stringWithUTF8String:right_option];
                
                
                
                [arrayData  addObject:s1];
                //NSLog(@"%d:%s:%s",sub_code,que_no,que_text);
                
            }//eof while
        }//eof if
    }//eof if
    
    sqlite3_close(database);
    
    return arrayData;

    
    
    
    
}

@end
