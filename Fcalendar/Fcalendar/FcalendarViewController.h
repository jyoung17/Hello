//
//  FcalendarViewController.h
//  Fcalendar
//
//  Created by jack young on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKCalendarMonthTableViewController.h"
#import "NSDate+TKCategory.h"

//@class EventCalendarViewController;
@class EventList;

@interface FcalendarViewController : TKCalendarMonthTableViewController {
    NSMutableArray *dataArray; 
	NSMutableDictionary *dataDictionary;
    
   // IBOutlet EventCalendarViewController *eventcalendarviewcontrollerVC;
    IBOutlet EventList *eventlistVC;
}

@property (retain,nonatomic) NSMutableArray *dataArray;
@property (retain,nonatomic) NSMutableDictionary *dataDictionary;

- (void) generateRandomDataForStartDate:(NSDate*)start endDate:(NSDate*)end;

//@property (nonatomic, retain) IBOutlet EventCalendarViewController *eventcalendarviewcontrollerVC;
//-(IBAction) eventButton;

@property (nonatomic, retain) IBOutlet EventList *eventlistVC;
- (IBAction) eventButton;

@end
