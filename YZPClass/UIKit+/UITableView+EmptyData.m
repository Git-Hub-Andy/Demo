
#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)

- (void)tableViewDisplayWitMsg:(NSString *)message ifNecessaryForRowCount:(NSUInteger)rowCount{
    UILabel *messageLabel = [self viewWithTag:88888];
    if (rowCount == 0) {
        if (messageLabel) {
            messageLabel.text = message;
        }else{
            messageLabel = [UILabel new];
            messageLabel.text = message;
            messageLabel.tag = 88888;
            messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
            messageLabel.textColor = [UIColor lightGrayColor];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.center = self.center;
            messageLabel.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
            [self addSubview:messageLabel];
        }
    }else{
        messageLabel.text = @"";
    }
}

- (void)noMoreDataFootView:(NSUInteger)rowCount message:(NSString *)message{
    UILabel *messageLabel = [self viewWithTag:9999];
    if (rowCount == 0) {        
        if (messageLabel) {
            messageLabel.text = message;
        }else{
            messageLabel = [UILabel new];
            messageLabel.text = message;
            messageLabel.tag = 9999;
            messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
            messageLabel.textColor = [UIColor lightGrayColor];
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.center = self.center;
            messageLabel.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
            [self setTableFooterView:messageLabel];
        }
        self.mj_footer = nil;
    }else{
        messageLabel.text = @"";
    }
}
@end
