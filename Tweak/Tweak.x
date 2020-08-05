// Aeolus
// Copyright (c) ajaidan0 2020

// Imports UITableView for ease of access
#import <UIKit/UITableView.h>

// Hook UITableView
%hook UITableView

-(void)setSeparatorStyle:(long long)arg1
{   
    // Return 0
	%orig(0);
}

%end

%ctor {

    /* 
     * Credits to Nepeta for process exclusion code
     * I do this because on some devices, there is a crash when you use 3D touch on a notification with this tweak installed.
    */

    // Creates Blacklist array to stop crashes
    NSArray *blacklist = @[
        @"SpringBoard",
    ];

    // Check process and if process is on blacklist, return and don't run the tweak
    NSString *processName = [NSProcessInfo processInfo].processName;
    for (NSString *process in blacklist) {
        if ([process isEqualToString:processName]) {
            return;
        }
    }
}