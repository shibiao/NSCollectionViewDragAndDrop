//
//  CustomItem.m
//  NSCollectionView
//
//  Created by ShiBiao on 2018/7/17.
//  Copyright © 2018年 ShiBiao. All rights reserved.
//

#import "CustomItem.h"

@interface CustomItem ()

@end

@implementation CustomItem

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
//    [self.view registerForDraggedTypes:@[NSPasteboardTypeString]];
//    NSString *UTTypeString =  (__bridge NSString *)kUTTypeContent;
//    [self.view registerForDraggedTypes:[NSArray arrayWithObject:UTTypeString]];
}
-(NSArray<NSDraggingImageComponent *> *)draggingImageComponents {
//    [super draggingImageComponents];
    NSDraggingImageComponent *component = [NSDraggingImageComponent draggingImageComponentWithKey:NSDraggingImageComponentIconKey];
    component.frame = NSMakeRect(self.view.bounds.origin.x - 30, self.view.bounds.origin.y - 30, self.view.bounds.size.width + 60, self.view.bounds.size.height + 60);
    component.contents = self.imgView.image;
    return @[component];
}
-(void)setSelected:(BOOL)selected {
    if (selected) {
        self.view.layer.borderColor = [NSColor redColor].CGColor;
        self.view.layer.borderWidth = 1;
    }else{
        self.view.layer.borderWidth = 0;
    }
}
//-(void)setHighlightState:(NSCollectionViewItemHighlightState)highlightState {
//    if (highlightState == NSCollectionViewItemHighlightNone) {
//        self.view.layer.borderWidth = 0;
//    }else{
//        
//        self.view.layer.borderColor = [NSColor redColor].CGColor;
//        self.view.layer.borderWidth = 1;
//    }
//}
@end
