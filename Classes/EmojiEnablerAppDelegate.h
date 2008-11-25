//
//  EmojiEnablerAppDelegate.h
//  EmojiEnabler
//
//  Created by Nicolas Haunold on 23.11.08.
//  Copyright Nicolas Haunold 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmojiEnablerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	NSMutableDictionary *dict;
	IBOutlet UIButton *enableButton;
	IBOutlet UIButton *disableButton;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)enableEmoji:(id)sender;
- (IBAction)disableEmoji:(id)sender;
- (void)update;

@end

