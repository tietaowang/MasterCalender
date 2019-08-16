//
//  JXCalenderView.h
//  ReadRecord
//
//  Created by apple on 2019/8/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXCalenderView : UIView

//@property (nonatomic,copy) NSString* startYear;
- (instancetype)initWithFrame:(CGRect)frame startYear:(NSString*) startYear;
- (void)reLoad:(NSString*) startYear;
@end

NS_ASSUME_NONNULL_END
