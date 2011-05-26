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

@interface FcalendarViewController : TKCalendarMonthTableViewController {
    NSMutableArray *dataArray; 
	NSMutableDictionary *dataDictionary;
}

@property (retain,nonatomic) NSMutableArray *dataArray;
@property (retain,nonatomic) NSMutableDictionary *dataDictionary;

- (void) generateRandomDataForStartDate:(NSDate*)start endDate:(NSDate*)end;

@end
