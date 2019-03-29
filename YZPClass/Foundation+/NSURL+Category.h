
#import <Foundation/Foundation.h>

@interface NSURL (Category)

- (NSDictionary *)queryParams;

- (NSURL *)urlWithParameters:(NSDictionary *)parameters;

@end
