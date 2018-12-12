//
//  SDTableViewController.m
//  SDPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDTableViewController.h"
#import "SDDemoCell.h"

static NSString *ID = @"photo";

@interface SDTableViewController ()

@property (nonatomic, strong) NSArray *srcStringArray;

@end

@implementation SDTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 200;
    
    self.title = @"图片浏览(GSD)";
    [self.tableView registerClass:[SDDemoCell class] forCellReuseIdentifier:ID];
    _srcStringArray = @[@"http://ww2.sinaimg.cn/bmiddle/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                        @"http://ww2.sinaimg.cn/bmiddle/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                        @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                        @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                        @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww1.sinaimg.cn/bmiddle/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                        ];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SDDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.photosGroup.photoItemArray = _srcStringArray;
    return cell;
}

@end
