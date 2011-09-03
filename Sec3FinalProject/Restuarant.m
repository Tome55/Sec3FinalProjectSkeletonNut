//
//  Restuarant.m
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Restuarant.h"
#import "Sec3FinalProjectAppDelegate.h"
#import <sqlite3.h>

static sqlite3* database;
static sqlite3_stmt *addStmt = nil;

@implementation Restuarant
@synthesize restuarantID;
@synthesize title;
@synthesize subtitle;
@synthesize review;
@synthesize coordinate;
@synthesize isDirty;
@synthesize isDetailViewHydrated;

- (void)dealloc
{
    [super dealloc];
}

// Constructor with primary key
- (id)initWithPrimaryKey:(NSInteger)key
{
    if( (self = [super init])) {
        restuarantID = key;
        isDetailViewHydrated = NO;
    }
    return self;
}

#pragma mark - Instance Methods
- (void) addSelfToDatabase
{   NSLog(@"addSelfToDatabase");
    if( !addStmt )
    {
        const char *sql = "insert into Restuarant(Title,Subtitle,Latitude,Longitude,Review) VALUES(?, ?, ?, ?, ?)";
        if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK) 
        {
            NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
        }
    }
    
    // Bind corresponding variable to the statement here
    // ------------------> TO DO <-------------------
  
	sqlite3_bind_text(addStmt, 1, [self.title UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 2, [self.subtitle UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_double(addStmt, 3, self.coordinate.latitude) ;
    sqlite3_bind_double(addStmt, 4,  self.coordinate.longitude );
    sqlite3_bind_text(addStmt,5, [self.review UTF8String], -1, SQLITE_TRANSIENT);
    
    /// OK
    
    
    if( SQLITE_DONE != sqlite3_step(addStmt) )
    {
        NSAssert1(0, @"Error while inserting data '%s'", sqlite3_errmsg(database));
    }else
    {
        // Get row ID to assign to restuarant
        restuarantID = sqlite3_last_insert_rowid(database);
    }
    sqlite3_reset(addStmt);
}

// For a better NSLog message
- (NSString*)description
{
    return [NSString stringWithFormat:@"title:%@, subtitle:%@, coordinate:(%f,%f) review:%@",self.title,self.subtitle,self.coordinate.latitude,self.coordinate.longitude, self.review];
}

#pragma mark - Class Methods
// This is for populating all the Restuarants from the database the first time
+ (void)getInitialDataToDisplayFromDatabase:(NSString *)dbPath
{
    Sec3FinalProjectAppDelegate* appDelegate = (Sec3FinalProjectAppDelegate*)[[UIApplication sharedApplication] delegate];
    if( sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
    {
        const char *sql = "SELECT * FROM Restuarant";
        sqlite3_stmt *selectstmt;
        if( sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK )
        {
            NSInteger errCode;
            while ( (errCode = sqlite3_step(selectstmt)) == SQLITE_ROW) {
                NSLog(@"SQLite3 Statement Error Code = %i", errCode);
                // Create an instance of a restuarant from database here
                // Add them to restuarant array as well
                // ------------------> TO DO <-------------------
                Restuarant *_rest = [[ Restuarant alloc] init];
                _rest.title =  [NSString stringWithUTF8String:(char*) sqlite3_column_text(selectstmt,1)];
                 _rest.subtitle =  [NSString stringWithUTF8String:(char*) sqlite3_column_text(selectstmt,2)];
                _rest.coordinate =  CLLocationCoordinate2DMake( sqlite3_column_double(selectstmt, 3)  , sqlite3_column_double(selectstmt, 4) );
         
                 _rest.review   =  [NSString stringWithUTF8String:(char*) sqlite3_column_text(selectstmt, 5)];
                    [[appDelegate restuarantArray ] addObject:_rest];
                [_rest release];
                
                // OK
                
            }
            NSLog(@"SQLite3 Statement Error Code = %i", errCode);            
        }
    }
    else
    {
        sqlite3_close(database);
    }
}

// For adding a Restuarant to the database
+ (void) addRestuarantToDatabase:(Restuarant *)restuarant
{
    // Add a restuarant to sqlite database
    [restuarant addSelfToDatabase];
    
    // Add a restuarant to our main restuarant array
    // ------------------> TO DO <-------------------
    Sec3FinalProjectAppDelegate* appDelegate = (Sec3FinalProjectAppDelegate*)[[UIApplication sharedApplication] delegate];
    [[appDelegate restuarantArray ] addObject:restuarant];
   // OK

    
}

// For adding a Restuarant to the database
+ (void) finalizeStatements
{
    if(addStmt) sqlite3_finalize(addStmt);    
    if(database) sqlite3_close(database);
}
@end
