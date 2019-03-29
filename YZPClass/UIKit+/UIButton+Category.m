
#import "UIButton+Category.h"

#import <objc/runtime.h>

@implementation UIButton (Category)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

//objc_setAssociatedObject是一个C语言函数，这个函数被称之为“关联API”，它的作用是把top、right、bottom、left这四个从外界获取到的值与本类(self)关联起来，然后设置一个static char作为能够找到他们的Key
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//objc_getAssociatedObject同样也是一个关联API(c语言函数)，它可以通过刚刚设置的Key找到上个方法中从外界传入的top、right、bottom、left，这个api和obj_setAssociatedObject一起使用就可以达到给已有类扩展属性的效果。最后我们通过self.bounds设置一个新的CGRect，作为扩大后的点按区域，并且返回
- (CGRect) enlargedRect{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge){
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }else{
        return self.bounds;
    }
}

//这个方法UIView的一个实例方法，作用是，捕获当前的UITouch事件中的触摸点，检测它是否在最上层的子视图内，如果不是的话就递归检测其父视图。这样的话，我们就只是将当前某一个触摸的point与某一个rect进行比较，并没有改变Button真实的frame，从而真正的从逻辑上达到了只是扩大点按区域的效果。
- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)){
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (void)setTime:(int)time{
    __weak __typeof(self)weakSelf = self;
    
    __block int timeout = time; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.userInteractionEnabled = YES;
                [weakSelf setTitle:@"重新发送" forState:UIControlStateNormal];
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSString *time = [NSString stringWithFormat:@"(%@秒)",strTime];
                [weakSelf setTitle:time forState:UIControlStateNormal];
                
                weakSelf.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
@end
