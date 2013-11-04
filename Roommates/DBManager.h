//
//  DBManager.h
//  Roommates
//
//  Created by Gemma Ferreras on 04/11/13.
//  Copyright (c) 2013 rich and famous. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager*)getSharedInstance;
-(BOOL)createDB;
-(BOOL)saveData: (NSString*)name
       address:(NSString*)address
       phone:(NSString*)phone
       m2:(double)m2
       price_rent:(double)price_rent
       price_water:(double)price_water
       price_light:(double)price_light
       price_internet:(double)price_internet
       price_phone:(double)price_phone
       inhabitants:(NSInteger)inhabitants;
- (NSArray*) findByTelephone:(NSString*)telephone;
@end
