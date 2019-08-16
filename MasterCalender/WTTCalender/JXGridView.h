//
//  JXGridView.h
//  ReadRecord
//
//  Created by apple on 2019/8/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXGridView : UIView

- (instancetype)initWithFrame:(CGRect)frame dayNum:(NSInteger) dayNum  startYear:(NSInteger)startYear  currentMonth:(NSInteger) currentMonth;

//包含title日历高度
+ (CGFloat) getCompleteCalenderHeight;

//@property ()

@end

NS_ASSUME_NONNULL_END
