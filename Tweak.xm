#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>


//static NSString* const filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Preferences/"] stringByAppendingPathComponent:[NSString stringWithFormat: @"com.ridan.camdisable.plist"]];
static NSString* const filePath = @"/var/mobile/Library/Preferences/com.ridan.statuscolor.plist";
static NSMutableDictionary* plist = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
static float red = [[plist objectForKey:@"R"]floatValue];
static float green = [[plist objectForKey:@"G"]floatValue];
static float blue = [[plist objectForKey:@"B"]floatValue];
static BOOL isDir = NO;

%hook UIStatusBar
- (id)activeTintColor
{
	if([[NSFileManager defaultManager] fileExistsAtPath: filePath isDirectory: &isDir] && !isDir) 
		return [UIColor colorWithRed:red green:green blue:blue alpha:1];
  	else
  		return %orig;	
}
- (void)setTintColor:(id)arg1
{
	%orig([self activeTintColor]);          
}
%end
%hook UIApplication
- (void)setStatusBarStyle:(int)arg1 animated:(BOOL)arg2
{
	%orig(0,arg2);
}
- (int)statusBarStyle
{
   return 0;
}

- (void)setStatusBarStyle:(int)arg1 duration:(double)arg2
{
   %orig(0,arg2);
}
%end
%hook SBAwayController
- (int)statusBarStyle
{
   return 0;
}
%end

static void refreshStatusBar(CFNotificationCenterRef center,void *observer,CFStringRef name,const void *object,CFDictionaryRef userInfo) {
	plist = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
	red = [[plist objectForKey:@"R"]floatValue];
	green = [[plist objectForKey:@"G"]floatValue];
	blue = [[plist objectForKey:@"B"]floatValue];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault duration:0.2];

	}
%ctor
{
	%init();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, refreshStatusBar, CFSTR("com.ridan.statuscolor/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}