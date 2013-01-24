//
//  ViewController.h
//  ActionSheetWithSwitchDemo
//
//  Created by zhenby on 13-1-24.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionSheetWithSwitch.h"

@interface ViewController : UIViewController<UIActionSheetDelegate, SwitchDelegate>
{
    UIButton *_button;
    ActionSheetWithSwitch *_actionSheet;
}

@end
