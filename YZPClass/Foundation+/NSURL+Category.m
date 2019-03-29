
#import "NSURL+Category.h"

@implementation NSURL (Category)

- (NSDictionary *)queryParams{
    if(!self.query) {
        return @{};
    }
    NSMutableDictionary *ret = [NSMutableDictionary dictionary];
    NSArray *keyValuePairs = [self.query componentsSeparatedByString:@"&"];
    for(id kv in keyValuePairs) {
        NSArray *kvPair = [kv componentsSeparatedByString:@"="];
        NSString *key = [NSString stringWithFormat:@"%@",kvPair[0]];
        NSString *value = [NSString stringWithFormat:@"%@",kvPair[1]];
        [ret setValue:value forKey:key];
    }
    return ret;
}

- (NSURL *)urlWithParameters:(NSDictionary *)parameters {
    NSString *prefix = self.query ? @"&" : @"?";    
    NSMutableArray* keyValuePairs = [NSMutableArray array];
    for (NSString* key in [parameters allKeys]) {
        id value = [parameters objectForKey:key];
        if(![value isKindOfClass:[NSString class]]) {
            NSLog(@"warning: %@ is not NSString Class", value);
        }
        [keyValuePairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    NSString *queryStr = [keyValuePairs componentsJoinedByString:@"&"];    
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", self, prefix, queryStr];
    return [NSURL URLWithString:urlString];
}
@end
