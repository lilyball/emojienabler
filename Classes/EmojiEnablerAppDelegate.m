//
//  EmojiEnablerAppDelegate.m
//  EmojiEnabler
//
//  Created by Nicolas Haunold on 23.11.08.
//  Copyright Nicolas Haunold 2008. All rights reserved.
//  Modified by Kevin Ballard
//

#import "EmojiEnablerAppDelegate.h"
#define PREF_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"../../Library/Preferences/"]

@implementation EmojiEnablerAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[PREF_FOLDER stringByAppendingPathComponent:@"com.apple.Preferences.plist"]];
	[self update];
    [window makeKeyAndVisible];
}

- (void)update {
	NSString *emoji = [dict objectForKey:@"KeyboardEmojiEverywhere"];
	if(![emoji boolValue]) {
		enableButton.enabled = TRUE;
		disableButton.enabled = FALSE;
	} else {
		enableButton.enabled = FALSE;
		disableButton.enabled = TRUE;
	}
}

- (IBAction)enableEmoji:(id)sender {
	[dict setObject:[NSNumber numberWithBool:YES] forKey:@"KeyboardEmojiEverywhere"];
	[dict writeToFile:[PREF_FOLDER stringByAppendingPathComponent:@"com.apple.Preferences.plist"] atomically:NO];
	[self update];
}

- (IBAction)disableEmoji:(id)sender {
	[dict setObject:[NSNumber numberWithBool:NO] forKey:@"KeyboardEmojiEverywhere"];
	[dict writeToFile:[PREF_FOLDER stringByAppendingPathComponent:@"com.apple.Preferences.plist"] atomically:NO];
	[self update];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
