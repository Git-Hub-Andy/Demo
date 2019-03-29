
#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
@interface UITableView (EmptyData)

//添加一个方法
- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

- (void)noMoreDataFootView:(NSUInteger)rowCount message:(NSString *)message;
@end
