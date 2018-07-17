//
//  ViewController.h
//  NSCollectionView
//
//  Created by ShiBiao on 2018/7/10.
//  Copyright © 2018年 ShiBiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSCollectionViewDelegate,NSCollectionViewDataSource>

@property (weak) IBOutlet NSCollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *dataArr;
@end

