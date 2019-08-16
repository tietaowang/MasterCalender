//
//  JXCalenderView.m
//  ReadRecord
//
//  Created by apple on 2019/8/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "JXCalenderView.h"
#import "NSDate+Extension.h"
#import "JXGridView.h"

@interface JXCalenderView()

//@property (nonatomic,strong) QMUIGridView* gridView;

@property (nonatomic,strong) NSMutableArray* datas;
@property (nonatomic,strong) UICollectionView* collectionView;

@end

@implementation JXCalenderView

- (instancetype)initWithFrame:(CGRect)frame startYear:(NSString*) startYear{
    if (self = [super initWithFrame:frame]) {
        [self initGridView:startYear];
    }
    return self;
}

// 7 列 5行
- (void) initGridView:(NSString*)startYear{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.year  = [startYear integerValue];
    //循环12个月
    QMUIGridView*  gridView = [[QMUIGridView alloc] initWithColumn:2 rowHeight:[JXGridView getCompleteCalenderHeight]];
    gridView.userInteractionEnabled = YES;
//    gridView.separatorWidth = 10;
    gridView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    for( int i = 1 ; i <= 12 ; i++ ){
        //传入天数 和 月份
        components.month = i;
        NSDate     *nextDate = [calendar dateFromComponents:components];
        NSInteger daysInThisMonth = [NSDate totaldaysInMonth:nextDate];
        JXGridView* mounthView = [[JXGridView alloc]initWithFrame:CGRectMake(0, 0, XC_RATIO_WIDTH(200 - 30) , [JXGridView getCompleteCalenderHeight]) dayNum:daysInThisMonth startYear:components.year currentMonth:i ];
        
        [gridView addSubview:mounthView];
    }
    [self addSubview:gridView];
    
}

- (void)reLoad:(NSString*) startYear{
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self initGridView:startYear];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  12;
}
//
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    JXCalenderCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JXCalenderCollectionViewCell" forIndexPath:indexPath];
//    return cell;
//}
//
//
//- (UICollectionView*) collectionView{
//    if(_collectionView){
//        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
//        [_collectionView registerClass:[JXCalenderCollectionViewCell class] forCellWithReuseIdentifier:@"JXCalenderCollectionViewCell"];
////        _collectionView.delegate = self;
////        _collectionView.dataSource = self;
//    }
//    return _collectionView;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
