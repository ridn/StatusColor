#import <Preferences/Preferences.h>
#import <UIKit/UIKit2.h>
#import <Foundation/Foundation.h>
#import <notify.h>
#include <substrate.h>

/*
@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
@end
*/

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
- (void)refreshSBarColor
{
	//I'm crying ;(
	[[[[UIAlertView alloc] initWithTitle:@"StatusColor"
                             message:@"Me no like repsring too. :("
                            delegate:self
                   cancelButtonTitle:@"Cancel"
                   otherButtonTitles:@"Respring",nil] autorelease] show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

	if (buttonIndex == [alertView cancelButtonIndex]) {
		return;
	}else{
		//this is killing me. ugh.
		//[(SpringBoard *)[%c(SpringBoard) sharedApplication] _relaunchSpringBoardNow];
		system("killall -9 lsd SpringBoard");
	}
}
@end

// vim:ft=objc
