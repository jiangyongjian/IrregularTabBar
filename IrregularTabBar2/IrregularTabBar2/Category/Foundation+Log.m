
#import <Foundation/Foundation.h>
//#import <objc/runtime.h>

//@implementation NSObject (Log)
//+ (void)load {
//    // 交换两个方法的实现
//    method_exchangeImplementations(class_getInstanceMethod([NSObject class], @selector(description)), class_getInstanceMethod([NSObject class], @selector(pkxDescription)));
//}
///**
// *  该方法是用来自定义模型(直接继承NSObject)的输出格式
// *
// *  @return 格式化后的字符串
// */
//- (NSString *)pkxDescription{
//    Class class = [self class];
//    
//    NSMutableString *resultStr = [NSMutableString stringWithFormat:@"%@ = {\n",[self pkxDescription]];
//    BXLog(@"%@", [class description]);
//    while (class != [NSObject class]) {
//        // 0.如果是UIResponder或CALayer的子类,就使用系统的默认输出格式
//        if ([[class description] hasPrefix:@"NS"] || [[class description] hasPrefix:@"__"]|| [[class description] hasPrefix:@"AV"] || [[class description] hasPrefix:@"_UIFlowLayout"] || [[class description] hasPrefix:@"UITouchesEvent"] || [class isSubclassOfClass:[UIResponder class]] || [class isSubclassOfClass:[CALayer class]] || [class isSubclassOfClass:[UIImage class]])return [self pkxDescription];
//        unsigned int count = 0;
//        //　1.获取类成员变量列表，count为类成员变量数量
//        Ivar *vars = class_copyIvarList(class, &count);
//        for (int index = 0; index < count; index ++) {
//            // 2.根据索引获得指定位置的成员变量
//            Ivar var = vars[index];
//            // 3.获得成员变量名
//            const char *name = ivar_getName(var);
//            // 4.成员变量名转化成oc字符串
//            NSString *varName = [NSString stringWithUTF8String:name];
//            BXLog(@"%@", varName);
//            // 5.获得成员变量对应的值
//            id value = [self valueForKey:varName];
//            [resultStr appendFormat:@"\t%@ = %@;\n", varName, value];
//        }
//        // 6.释放指针
//        free(vars);
//        // 7.获得父类
//        class = class_getSuperclass(class);
//    }
//    [resultStr appendString:@"}\n"];
//    return resultStr;
//}
//
//@end



@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{\n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [str appendString:@"}"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}
@end

@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"[\n"];
    
    // 遍历数组的所有元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [str appendFormat:@"%@,\n", obj];
    }];
    
    [str appendString:@"]"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}
@end
