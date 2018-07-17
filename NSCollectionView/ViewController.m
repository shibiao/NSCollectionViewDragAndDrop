//
//  ViewController.m
//  NSCollectionView
//
//  Created by ShiBiao on 2018/7/10.
//  Copyright © 2018年 ShiBiao. All rights reserved.
//

#import "ViewController.h"
#import "CustomItem.h"
#define MyDragType @"(__bridge NSString *)kUTTypeContent"

@implementation ViewController{
    NSSet<NSIndexPath *> *currentIndexPaths;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.selectable = YES;
    
    [self.collectionView registerForDraggedTypes:@[NSPasteboardTypeString]];
    [self.collectionView setDraggingSourceOperationMask:NSDragOperationEvery forLocal:YES];
    [self.collectionView setDraggingSourceOperationMask:NSDragOperationEvery forLocal:NO];
    [self addDatas];

}
-(void)addDatas {
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSLocalDomainMask, YES).firstObject;
//    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager]enumeratorAtPath:path];
//    for (NSString *str in enumerator) {
//
//        NSLog(@"%@",str);
//    }
}
//FIXME: NSCollectionViewDataSource
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    CustomItem *item = [collectionView makeItemWithIdentifier:@"CustomItem" forIndexPath:indexPath];
//    [item.imgView unregisterDraggedTypes];
    
    item.imgView.image = [NSImage imageNamed:[NSString stringWithFormat:@"%ld",1 + indexPath.item]];
    return item;
}

- (void)collectionView:(NSCollectionView *)collectionView draggingSession:(NSDraggingSession *)session willBeginAtPoint:(NSPoint)screenPoint forItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths {
    NSLog(@"%s",__func__);
    currentIndexPaths = indexPaths;
//    session.draggingFormation = NSDraggingFormationList;
}
-(void)collectionView:(NSCollectionView *)collectionView draggingSession:(NSDraggingSession *)session endedAtPoint:(NSPoint)screenPoint dragOperation:(NSDragOperation)operation {
    NSLog(@"%s",__func__);
//    [collectionView reloadData];
//    NSLog(@"%@",NSStringFromPoint(screenPoint));
//    NSIndexPath *indexPath = [collectionView indexPathForItemAtPoint:screenPoint];
//    [collectionView moveItemAtIndexPath:currentIndexPath toIndexPath:indexPath];
//    NSLog(@"%d",indexPath.item);
}

-(BOOL)collectionView:(NSCollectionView *)collectionView writeItemsAtIndexes:(NSIndexSet *)indexes toPasteboard:(NSPasteboard *)pasteboard {
    
    NSLog(@"%s",__func__);

    return YES;
}
-(BOOL)collectionView:(NSCollectionView *)collectionView canDragItemsAtIndexes:(NSIndexSet *)indexes withEvent:(NSEvent *)event {
    
     NSLog(@"%s",__func__);
    return YES;
}

-(id<NSPasteboardWriting>)collectionView:(NSCollectionView *)collectionView pasteboardWriterForItemAtIndex:(NSUInteger)index {
    NSLog(@"%s",__func__);
    
    NSPasteboardItem *item = [[NSPasteboardItem alloc]init];
    NSString *imageName = [NSString stringWithFormat:@"%ld",(long)index];

    [item setString:imageName forType:NSPasteboardTypeString];
    
    return item;

}
-(BOOL)collectionView:(NSCollectionView *)collectionView acceptDrop:(id<NSDraggingInfo>)draggingInfo index:(NSInteger)index dropOperation:(NSCollectionViewDropOperation)dropOperation {
    NSLog(@"%s",__func__);
    return YES;
}
//-(NSDragOperation)collectionView:(NSCollectionView *)collectionView validateDrop:(id<NSDraggingInfo>)draggingInfo proposedIndex:(NSInteger *)proposedDropIndex dropOperation:(NSCollectionViewDropOperation *)proposedDropOperation {
//    NSLog(@"%s",__func__);
//    if (proposedDropOperation == NSCollectionViewDropOn) {
////        proposedDropOperation = NSCollectionViewDropBefore;
//    }
//    return NSDragOperationMove;
//}
- (NSDragOperation)collectionView:(NSCollectionView *)collectionView validateDrop:(id <NSDraggingInfo>)draggingInfo proposedIndexPath:(NSIndexPath * __nonnull * __nonnull)proposedDropIndexPath dropOperation:(NSCollectionViewDropOperation *)proposedDropOperation {
//    NSIndexPath * currentIndex = currentIndexPaths.allObjects.firstObject;


    if (*proposedDropOperation == NSCollectionViewDropBefore) {
        *proposedDropOperation = NSCollectionViewDropOn;
        return NSDragOperationNone;
    }
    NSIndexPath *proposedIndexPath = *proposedDropIndexPath;
    for (NSIndexPath *tmpIndexPath in currentIndexPaths.allObjects) {
        [collectionView moveItemAtIndexPath:tmpIndexPath toIndexPath: proposedIndexPath];
//        if (tmpIndexPath.item < proposedIndexPath.item) {
//            [self.dataArr removeObjectAtIndex:proposedIndexPath.item];
//        }else {
//            [self.dataArr removeObjectAtIndex:proposedIndexPath.item + 1];
//        }
//        [collectionView reloadData];
//        self.dataArr insertObject:<#(nonnull id)#> atIndex:<#(NSUInteger)#>
    }
    return NSDragOperationMove;
}
//-(void)collectionView:(NSCollectionView *)collectionView updateDraggingItemsForDrag:(id<NSDraggingInfo>)draggingInfo {
//    NSLog(@"%s",__func__);
//}

@end
