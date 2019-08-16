//
//  JXPrickerView.h
//  ReadRecord
//
//  Created by apple on 2019/8/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXPrickerView : UIView

@property (nonatomic,copy) void (^selectedRowCallBack)(NSString * result);

+ (JXPrickerView*) showData:(NSArray*) data;

    
@end

NS_ASSUME_NONNULL_END
