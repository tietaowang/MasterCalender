//
//  JXGridView.m
//  ReadRecord
//
//  Created by apple on 2019/8/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "JXGridView.h"
@interface JXGridView()
@property (nonatomic,strong) UILabel* title;

@end

@implementation JXGridView

- (instancetype)initWithFrame:(CGRect)frame dayNum:(NSInteger) dayNum  startYear:(NSInteger)startYear  currentMonth:(NSInteger) currentMonth {
    if (self = [super initWithFrame:frame]) {
        [self initGridView:startYear dayNum:dayNum currentMonth:currentMonth];
    }
    return self;
}


// 7 列 5行
- (void) initGridView:(NSInteger)startYear  dayNum:(NSInteger)dayNum currentMonth:(NSInteger)currentMonth {
        //循环单个月
        CGFloat rowHeight = XC_RATIO_WIDTH(20);
        QMUIGridView*  gridView = [[QMUIGridView alloc] initWithColumn:7 rowHeight:rowHeight];
        gridView.frame = CGRectMake(10, 0, CGRectGetWidth(self.frame), rowHeight * 5);
        [gridView addSubview:[[UIView alloc]init]];
        for (int i = 1; i <= dayNum ; i++) {
            [gridView addSubview:[self generateButtonAtIndex:i]];
        }
        [self addSubview:gridView];
    
        [self createMonthView:currentMonth gridView:gridView];
}

- (void) createMonthView:(NSInteger)currentMonth gridView:(QMUIGridView*) gridView{
     _title = [[UILabel alloc]initWithFrame:CGRectMake(15, 0,  CGRectGetWidth(self.frame), 30)];
     NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"月%ld",currentMonth] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Bold" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]}];
     _title.attributedText = string;
     [self addSubview:_title];
     CGRect gridViewFrame = gridView.frame;
     gridViewFrame.origin.y = _title.frame.origin.y + _title.frame.size.height;
     gridView.frame = gridViewFrame;
}

- (UIButton *)generateButtonAtIndex:(NSInteger)index {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.tag = index;
    [button setTitle:[NSString stringWithFormat:@"%ld",index] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor qmui_colorWithHexString:@"#222222"] forState: UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(handleGirdButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void) handleGirdButtonEvent:(UIButton*) button{
    
    
}

//日历高度
+ (CGFloat) getCalenderHeight{
    return  XC_RATIO_WIDTH(20) * 5;
}

//包含title日历高度
+ (CGFloat) getCompleteCalenderHeight{
    return  [self getCalenderHeight] + 50;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
