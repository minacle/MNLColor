#import "MNLColorInternal.h"


@interface MNLColorPalette ()

@property (nonatomic, setter=_setDictionary:) NSDictionary *_dictionary;

@end


@implementation MNLColorPalette

{
    NSDictionary *_dictionary;
    CFArrayRef _enumerationArray;
}

@synthesize _dictionary;

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (NSArray *)allKeys {
    return [_dictionary allKeys];
}

- (NSArray *)allColors {
    return [_dictionary allValues];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        NSArray *allKeys = [coder decodeObjectForKey:@"__allKeys"];
        NSMutableDictionary *dictionary = [NSMutableDictionary new];
        for (NSString *key in allKeys)
            [dictionary setObject:[coder decodeObjectOfClass:[MNLColor class] forKey:key] forKey: key];
        _dictionary = [[NSDictionary alloc] initWithDictionary:dictionary];
    }
    return self;
}

- (instancetype)initWithColorPalette:(MNLColorPalette *)colorPalette {
    if (self = [super init]) {
        _dictionary = [[NSDictionary alloc] initWithDictionary:[colorPalette _dictionary]];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)colorTable {
    if (self = [super init])
        _dictionary = [[NSDictionary alloc] initWithDictionary:colorTable];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithColorPalette:self];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[MNLMutableColorPalette allocWithZone:zone] initWithColorPalette:self];
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    NSArray *allKeys = [_dictionary allKeys];
    [coder encodeObject:allKeys forKey:@"__allKeys"];
    for (NSString *key in allKeys)
        [coder encodeObject:[_dictionary objectForKey:key] forKey:key];
}

- (MNLColor *)colorForKey:(NSString *)key {
    return [_dictionary objectForKey:key];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *restrict)state objects:(id __unsafe_unretained *)buffer count:(NSUInteger)len {
    if (!state->state) {
        state->state++;
        NSArray *nsAllKeys = [_dictionary allKeys];
        CFArrayRef cfAllKeys = (__bridge_retained CFArrayRef)nsAllKeys;
        _enumerationArray = cfAllKeys;
        // extra[0]: all keys
        // extra[1]: (unused)
        // extra[2]: items count
        // extra[3]: next index
        // extra[4]: return value
        state->extra[0] = (unsigned long)cfAllKeys;
        state->extra[2] = (unsigned long)CFArrayGetCount(cfAllKeys);
        state->extra[3] = (unsigned long)0;
    }
    else if (state->state != 1)
        return 0;
    state->extra[4] = (unsigned long)0;
    state->itemsPtr = buffer;
    while (state->extra[3] < state->extra[2] && state->extra[4] < len)
        *buffer++ = CFArrayGetValueAtIndex((CFArrayRef)state->extra[0], state->extra[3]++);
    if (state->extra[3] >= state->extra[2] || state->extra[4] >= len) {
        state->state++;
        CFRelease((CFArrayRef)state->extra[0]);
        _enumerationArray = NULL;
    }
    return state->extra[4];
}

@end


#pragma mark -


@interface MNLMutableColorPalette ()

@property (nonatomic, setter=_setMutableDictionary:) NSMutableDictionary *_mutableDictionary;

@end


@implementation MNLMutableColorPalette

{
    CFArrayRef _enumerationArray;
}

- (NSMutableDictionary *)_mutableDictionary {
    return (NSMutableDictionary *)[self _dictionary];
}

- (void)_setMutableDictionary:(NSMutableDictionary *)_mutableDictionary {
    return [self _setDictionary:_mutableDictionary];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        NSArray *allKeys = [coder decodeObjectForKey:@"__allKeys"];
        NSMutableDictionary *dictionary = [NSMutableDictionary new];
        for (NSString *key in allKeys)
            [dictionary setObject:[coder decodeObjectOfClass:[MNLColor class] forKey:key] forKey: key];
        [self _setMutableDictionary:dictionary];
    }
    return self;
}

- (instancetype)initWithColorPalette:(MNLColorPalette *)colorPalette {
    if (self = [super init]) {
        [self _setMutableDictionary:[[NSMutableDictionary alloc] initWithDictionary:[colorPalette _dictionary]]];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)colorTable {
    if (self = [super init])
        [self _setMutableDictionary:[[NSMutableDictionary alloc] initWithDictionary:colorTable]];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithColorPalette:self];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithColorPalette:self];
}

- (void)setColor:(MNLColor *)color forKey:(NSString *)key {
    [[self _mutableDictionary] setObject:color forKey:key];
}

- (void)removeColorForKey:(NSString *)key {
    [[self _mutableDictionary] removeObjectForKey:key];
}

- (void)removeAllColors {
    [[self _mutableDictionary] removeAllObjects];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *restrict)state objects:(id __unsafe_unretained *)buffer count:(NSUInteger)len {
    if (!state->state) {
        state->state++;
        NSArray *nsAllKeys = [[self _mutableDictionary] allKeys];
        CFArrayRef cfAllKeys = (__bridge_retained CFArrayRef)nsAllKeys;
        _enumerationArray = cfAllKeys;
        // extra[0]: all keys
        // extra[1]: dummy
        // extra[2]: items count
        // extra[3]: next index
        // extra[4]: return value
        state->extra[0] = (unsigned long)cfAllKeys;
        state->mutationsPtr = &state->extra[1];
        state->extra[2] = (unsigned long)CFArrayGetCount(cfAllKeys);
        state->extra[3] = (unsigned long)0;
    }
    else if (state->state != 1)
        return 0;
    state->extra[4] = (unsigned long)0;
    state->itemsPtr = buffer;
    while (state->extra[3] < state->extra[2] && state->extra[4] < len)
        *buffer++ = CFArrayGetValueAtIndex((CFArrayRef)state->extra[0], state->extra[3]++);
    if (state->extra[3] >= state->extra[2] || state->extra[4] >= len) {
        state->state++;
        CFRelease((CFArrayRef)state->extra[0]);
        _enumerationArray = NULL;
    }
    return state->extra[4];
}

@end
