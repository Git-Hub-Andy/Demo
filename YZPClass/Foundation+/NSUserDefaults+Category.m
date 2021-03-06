
#import "NSUserDefaults+Category.h"

@implementation NSUserDefaults (Category)

+ (void)setObject:(nullable id)value forKey:(NSString * _Nullable )defaultName{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (nullable id)objectForKey:(NSString * _Nullable )defaultName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)removeObjectForKey:(NSString * _Nullable )defaultName{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)removeAllObject{
    NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [defatluts dictionaryRepresentation];    
    for(NSString *key in [dictionary allKeys]){
        
        [defatluts removeObjectForKey:key];
        
        [defatluts synchronize];
        
    }
}
@end
