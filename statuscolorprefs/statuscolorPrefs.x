#import <Preferences/Preferences.h>
#import <UIKit/UIKit2.h>
//#import <Foundation/Foundation.h>
//#import <notify.h>
//#include <substrate.h>


@interface UIStatusBar (statuscolor)
- (void)setTintColor:(id)color;
- (id)activeTintColor;
@end


@interface statuscolorPrefsListController: PSListController {
}
@end

@implementation statuscolorPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"StatusColor" target:self] retain];
	}
	return _specifiers;
}
- (void)twitter
{
if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:@"r_idn"]]];
	} else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:@"r_idn"]]];
	} else {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:@"r_idn"]]];
	}
}

@end

// vim:ft=objc
