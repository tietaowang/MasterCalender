//
//  JXCalenderViewController.m
//  ReadRecord
//
//  Created by apple on 2019/8/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "JXCalenderViewController.h"
#import "JXCalenderView.h"
#import "JXGridView.h"
#import "JXPrickerView.h"

@interface JXCalenderViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic,strong) UIView* headerView;
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic,strong) UIButton* selectYeayButton;
@property (nonatomic,strong) UIView* prickerView;
@property (nonatomic,strong) JXCalenderView* calenderView;
@end

@implementation JXCalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self makeUI];

}

- (void) makeUI{
    _calenderView = [[JXCalenderView alloc] initWithFrame:CGRectMake(0,XC_Height_NavBar , XC_SCREE_W,  [JXGridView getCompleteCalenderHeight] *6 ) startYear:@"2018"];
    [self.scrollView addSubview:_calenderView];
    [_calenderView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.bottom.equalTo(self.scrollView);
        make.height.mas_offset([JXGridView getCompleteCalenderHeight] *6);
        make.width.mas_offset(XC_SCREE_W);
    }];
    [self selectYeayButton];
}

- (UIView*) headerView{
    if(!_headerView){
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = UIColor.redColor;
        [self.view addSubview:_headerView];
        [_headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(40));
            make.top.equalTo(@(XC_Height_NavBar));
            make.left.right.equalTo(self.view);
        }];
    }
    return _headerView;
}

- (UIView*) scrollView{
    if(!_scrollView){
        _scrollView  = [[UIScrollView alloc]init];
        [self.view addSubview:_scrollView];
        [_scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.headerView.mas_bottom);
        }];
    }
    return _scrollView;
}

- (UIButton*) selectYeayButton{
    if(!_selectYeayButton){
        _selectYeayButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_selectYeayButton addTarget:self action:@selector(showSelectYearAlert) forControlEvents:UIControlEventTouchUpInside];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
        [_selectYeayButton setTitle:[NSString stringWithFormat:@"%ld",components.year] forState:UIControlStateNormal];
        [self.headerView addSubview:_selectYeayButton];
        [_selectYeayButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.headerView.mas_right).mas_offset(-10);
            make.centerY.equalTo(self.headerView);
        }];
    }
    return _selectYeayButton;
}

- (void) showSelectYearAlert{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSMutableArray* yearArr = [NSMutableArray new];
    for(NSInteger i = (components.year - 5) ; i <= components.year ; i++){
        [yearArr addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    WEAKSELF
    [JXPrickerView showData:yearArr].selectedRowCallBack = ^(NSString* result){
        [weakSelf.selectYeayButton setTitle:result forState:UIControlStateNormal];
        [weakSelf.calenderView reLoad:result];
    };

//    JXPrickerView* pv = [[JXPrickerView alloc]initWithFrame:CGRectMake(0, 0, 350, 800)];
//    pv.datas = yearArr;
//    UIWindow* window = [UIApplication sharedApplication].keyWindow;
//    [self.view addSubview:pv];
//    //    [pv mas_remakeConstraints:^(MASConstraintMaker *make) {
//    //        make.top.right.bottom.left.equalTo(window);
//    //    }];
//    [pv makeUI];
    
    
//    UIPickerView *pickerView = [[UIPickerView alloc] init];
////    _prickerView = pickerView;
//    pickerView.backgroundColor = [UIColor whiteColor];
//    pickerView.dataSource = self;
//    pickerView.delegate = self;
//    [self.view addSubview:pickerView];
    
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"asdfasdf";
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return XC_SCREE_W;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
