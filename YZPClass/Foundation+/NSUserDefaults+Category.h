
#import <Foundation/Foundation.h>

@interface NSUserDefaults (Category)

+ (void)setObject:(nullable id)value forKey:(NSString *_Nullable)defaultName;

+ (nullable id)objectForKey:(NSString *_Nullable)defaultName;

+ (void)removeObjectForKey:(NSString *_Nullable)defaultName;

+ (void)removeAllObject;

@end
