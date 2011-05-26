//
//  PopOverAppDelegate.h
//  PopOver
//
//  Created by jack young on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopOverViewController;

@interface PopOverAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PopOverViewController *viewController;

@end
