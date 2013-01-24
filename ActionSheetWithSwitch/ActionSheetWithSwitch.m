//
//  ActionSheetWithSwitch.m
//  ActionSheetWithSwitchDemo
//
//  Created by zhenby on 13-1-24.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import "ActionSheetWithSwitch.h"

#define SWITCH_TITLE_FONT_SIZE 18.0
#define SCREEN_WIDTH 320.0
#define SWITCH_WIDTH 79.0
#define SWITCH_HEIGHT 27.0
#define X_SPACE 3.0
#define SPACE_HEIGHT 50.0

@interface ActionSheetWithSwitch ()

@property(retain, nonatomic) UILabel *labelOfSwitchTitle;
@property(retain, nonatomic) UISwitch *theSwitch;

- (NSString *)titleBlank:(NSString *)title;

@end

@implementation ActionSheetWithSwitch

@synthesize titleOfSwith = _titleOfSwith;
@synthesize switchDelegate = _switchDelegate;
@synthesize theSwitch = _theSwitch;
@synthesize labelOfSwitchTitle = _labelOfSwitchTitle;
@synthesize isSwitchOn = _isSwitchOn;

- (void)dealloc
{
    [_titleOfSwith release];
    _titleOfSwith = nil;
    
    [_theSwitch release];
    _theSwitch = nil;
    
    [_labelOfSwitchTitle release];
    _labelOfSwitchTitle = nil;
    
    [super dealloc];
}

- (id)initWithTitle:(NSString *)title
           delegate:(id<UIActionSheetDelegate>)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    NSString *titleBlank = [self titleBlank:title];
    self = [super initWithTitle:titleBlank
                       delegate:delegate
              cancelButtonTitle:nil
         destructiveButtonTitle:destructiveButtonTitle
              otherButtonTitles:nil,
            nil];
    
    if (self)
    {
        va_list argumentList;
        int otherButtonCount = 0;
        if (otherButtonTitles)
        {
            va_start(argumentList, otherButtonTitles);
            while (otherButtonTitles)
            {
                otherButtonCount ++;
                [self addButtonWithTitle:otherButtonTitles];
                otherButtonTitles = va_arg(argumentList, id);
            }
            va_end(argumentList);
            
        }
        [self addButtonWithTitle:cancelButtonTitle];
        self.cancelButtonIndex = otherButtonCount;
        
        _isSwitchOn = NO;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Setter
- (void)setTitleOfSwith:(NSString *)titleOfSwith
{
    if (titleOfSwith.length > 0)
    {
        if (![titleOfSwith isEqualToString:_titleOfSwith])
        {
            _titleOfSwith = titleOfSwith;
            
            
            if (nil == _theSwitch)
            {
                _theSwitch = [[UISwitch alloc] init];
                [_theSwitch addTarget:self
                               action:@selector(onSwitchChange)
                     forControlEvents:UIControlEventValueChanged];
                [self addSubview:_theSwitch];
            }
            CGFloat widthSwitch = _theSwitch.bounds.size.width;
            CGFloat heightSwitch = _theSwitch.bounds.size.height;
            
            
            UIFont *fontLabel = [UIFont boldSystemFontOfSize:SWITCH_TITLE_FONT_SIZE];
            CGSize sizeLabel = [_titleOfSwith sizeWithFont:fontLabel
                                         constrainedToSize:CGSizeMake(SCREEN_WIDTH, 40)];
            CGFloat xLabel = (SCREEN_WIDTH - sizeLabel.width - X_SPACE - widthSwitch) / 2.0;
            CGFloat yLabel = 30 + (SPACE_HEIGHT - sizeLabel.height) / 2.0;
           
            if (nil == _labelOfSwitchTitle)
            {
                _labelOfSwitchTitle = [[UILabel alloc] init];
                _labelOfSwitchTitle.backgroundColor = [UIColor clearColor];
            }
            _labelOfSwitchTitle.textColor = [UIColor whiteColor];
            _labelOfSwitchTitle.font = fontLabel;
            _labelOfSwitchTitle.text = _titleOfSwith;
            _labelOfSwitchTitle.frame = CGRectMake(xLabel, yLabel, sizeLabel.width, sizeLabel.height);
            [self addSubview:_labelOfSwitchTitle];
            
            
            CGFloat xCenterSwitch = xLabel + sizeLabel.width + X_SPACE + widthSwitch / 2;
            CGFloat yCenterSwitch = 30 + (SPACE_HEIGHT - heightSwitch) / 2.0 + heightSwitch / 2;
            _theSwitch.center = CGPointMake(xCenterSwitch, yCenterSwitch);
        }
    }
    else
    {
        [_labelOfSwitchTitle removeFromSuperview];
        [_theSwitch removeFromSuperview];
    }
}

- (void)setIsSwitchOn:(BOOL)isSwitchOn
{
    _isSwitchOn = isSwitchOn;
    self.theSwitch.on = _isSwitchOn;
}

#pragma mark - Getter
- (BOOL)isSwitchOn
{
    _isSwitchOn = _theSwitch.on;
    
    return _isSwitchOn;
}

#pragma mark - Action handle
- (void)onSwitchChange
{
    if (self.switchDelegate)
    {
        [self.switchDelegate onSwithValueChange];
    }
}

#pragma mark - Helper

- (NSString *)titleBlank:(NSString *)title
{
    return [NSString stringWithFormat:@"%@\n\n\n", title];
}

@end
