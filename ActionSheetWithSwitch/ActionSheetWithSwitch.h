//
//  ActionSheetWithSwitch.h
//  ActionSheetWithSwitchDemo
//
//  Created by zhenby on 13-1-24.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwitchDelegate

- (void)onSwithValueChange;

@end

@interface ActionSheetWithSwitch : UIActionSheet

@property(retain, nonatomic) NSString *titleOfSwith;
@property(assign, nonatomic) id<SwitchDelegate> switchDelegate;
@property(assign, nonatomic) BOOL isSwitchOn;

@end
