//
//  DBManager.m
//  Roommates
//
//  Created by Gemma Ferreras on 04/11/13.
//  Copyright (c) 2013 rich and famous. All rights reserved.
//

#import "DBManager.h"
static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent: @"roommates.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "create table if not exists flat (phone text primary key,"
                                                                    "name text,"
                                                                    "address text,"
                                                                    "m2 real,"
                                                                    "price_rent real,"
                                                                    "price_water real,"
                                                                    "price_light real,"
                                                                    "price_internet real,"
                                                                    "price_phone real,"
                                                                    "inhabitants integer)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}


- (BOOL)    saveData: (NSString*)name
            address:(NSString*)address
            phone:(NSString*)phone
            m2:(double)m2
            price_rent:(double)price_rent
            price_water:(double)price_water
            price_light:(double)price_light
            price_internet:(double)price_internet
            price_phone:(double)price_phone
            inhabitants:(NSInteger)inhabitants
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into studentsDetail (phone, name, address, m2, price_rent, price_water, price_light, price_internet, price_phone, inhabitants) values (\"%@\",\"%@\", \"%@\", \"%g\", \"%g\", \"%g\", \"%g\", \"%g\", \"%g\" , \"%ld\")",
                               phone, name, address, m2, price_rent, price_water, price_light, price_internet, price_phone, (long)inhabitants];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else {
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}


- (NSArray*) findByTelephone:(NSString*)phone
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"select phone, name, address from flat where phone=\"%@\"",phone];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *phone = [[NSString alloc] initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:phone];
                NSString *name = [[NSString alloc] initWithUTF8String:
                                        (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:name];
                NSString *address = [[NSString alloc]initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:address];
                return resultArray;
            }
            else
            {
                NSLog(@"Not found");
                return nil;
            }
            sqlite3_reset(statement);
        }
    }
    return nil;
}

@end