//
//  SCNavTabBar.h
//  iHappySleep
//
//  Created by 诺之家 on 15/9/24.
//  Copyright (c) 2015年 诺之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCNavTabBarDelegate <NSObject>

@optional
/**
 *  When NavTabBar Item Is Pressed Call Back
 *
 *  @param index - pressed item's index
 */
- (void)itemDidSelectedWithIndex:(NSInteger)index;

/**
 *  When Arrow Pressed Will Call Back
 *
 *  @param pop    - is needed pop menu
 *  @param height - menu height
 */
- (void)shouldPopNavgationItemMenu:(BOOL)pop height:(CGFloat)height;

@end

@interface SCNavTabBar : UIView

@property (nonatomic, weak)     id          <SCNavTabBarDelegate>delegate;

@property (nonatomic, assign)   NSInteger   currentItemIndex;           // current selected item's index
@property (nonatomic, strong)   NSArray     *itemTitles;                // all items' title

@property (nonatomic, strong)   UIColor     *lineColor;                 // set the underscore color
/**
 *  Initialize Methods
 *
 *  @param frame - SCNavTabBar frame
 *  @param show  - is show Arrow Button
 *
 *  @return Instance
 */
- (id)initWithFrame:(CGRect)frame;

/**
 *  Update Item Data
 */
- (void)updateData;

/**
 *  Refresh All Subview
 */
- (void)refresh;

@end