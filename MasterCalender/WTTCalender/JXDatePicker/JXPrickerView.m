//
//  JXPrickerView.m
//  ReadRecord
//
//  Created by apple on 2019/8/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "JXPrickerView.h"
@interface JXPrickerView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) UIPickerView* pickerView;
@property (nonatomic,strong) NSArray* datas;

@end

@implementation JXPrickerView

- (instancetype)initWithData:(NSArray*)datas{
    if (self = [super initWithFrame:CGRectZero]) {
        _datas = datas;
    }
    return self;
}

+ (JXPrickerView*) showData:(NSArray*) data{
    JXPrickerView* pv = [[JXPrickerView alloc]initWithData:data];
    [[UIApplication sharedApplication].keyWindow addSubview:pv];
    [pv makeUI];
    [pv mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.left.equalTo([UIApplication sharedApplication].keyWindow);
    }];
    return pv;
}

- (void) makeUI{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];

    UIView* popView = [[UIView alloc] init];
    popView.backgroundColor = UIColor.whiteColor;
    popView.layer.masksToBounds = YES;
    popView.userInteractionEnabled = YES;
    popView.layer.cornerRadius = 20;
    [self addSubview:popView];
    [popView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.bottom.equalTo(self.mas_bottom).mas_offset(-15);
        make.right.equalTo(self.mas_right).mas_offset(-15);
//        make.right.bottom.equalTo(self).mas_offset(-15);
        make.height.equalTo(@(350));
    }];
    
    _pickerView = [[UIPickerView alloc]init];
    [_pickerView selectRow:2 inComponent:0 animated:YES];
    _pickerView.userInteractionEnabled = YES;
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [popView addSubview:_pickerView];
    [_pickerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(popView);
        make.height.equalTo(@(285));
    }];
    
    UIButton* confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmSelectDate) forControlEvents:UIControlEventTouchUpInside];
    [popView addSubview:confirmBtn];
    [confirmBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(44));
        make.left.right.bottom.equalTo(popView);
    }];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doHide:)];
    [self addGestureRecognizer:tap];
  

}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _datas.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    return _datas[row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return XC_SCREE_W - 40;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 46;
}

- (void) confirmSelectDate{
    NSInteger row = [_pickerView selectedRowInComponent:0];
    if(self.selectedRowCallBack){
        self.selectedRowCallBack(_datas[row]);
    }
    [self removeFromSuperview];
}



- (void) doHide:(UITapGestureRecognizer*) tapGe{
    [self removeFromSuperview];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    [self removeFromSuperview];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
