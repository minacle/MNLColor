#import "MNLColorInternal.h"


@interface MNLColorPalette ()

@property (retain, setter=_setDictionary:) NSDictionary *_dictionary;

@end


@implementation MNLColorPalette

{
    NSDictionary *_dictionary;
    uint64_t _revision;
}

@synthesize _dictionary;

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (NSArray *)allKeys {
    return [[self _dictionary] allKeys];
}

- (NSArray *)allColors {
    return [[self _dictionary] allValues];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        NSArray *allKeys = [coder decodeObjectForKey:@"__allKeys"];
        NSMutableDictionary *dictionary = [NSMutableDictionary new];
        for (NSString *key in allKeys)
            [dictionary setObject:[coder decodeObjectOfClass:[MNLColor class] forKey:key] forKey:key];
        _dictionary = [[NSDictionary alloc] initWithDictionary:dictionary];
        [dictionary release];
    }
    return self;
}

- (instancetype)initWithColorPalette:(MNLColorPalette *)colorPalette {
    if (self = [super init])
        _dictionary = [[NSDictionary alloc] initWithDictionary:[colorPalette _dictionary]];
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

- (void)encodeWithCoder:(NSCoder *)coder {
    NSDictionary *dictionary = [[self _dictionary] retain];
    NSArray *allKeys = [dictionary allKeys];
    [coder encodeObject:allKeys forKey:@"__allKeys"];
    for (NSString *key in allKeys)
        [coder encodeObject:[dictionary objectForKey:key] forKey:key];
    [dictionary release];
}

- (MNLColor *)colorForKey:(NSString *)key {
    return [[self _dictionary] objectForKey:key];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *restrict)state objects:(id *)buffer count:(NSUInteger)len {
    const CFDictionaryRef restrict dictionary = [self _dictionary];
    CFIndex count = CFDictionaryGetCount(dictionary);
    if (state->state >= count) {
        memset(state, 0, sizeof(NSFastEnumerationState));
        memset(buffer, 0, sizeof(id) * len);
        return 0;
    }
    CFStringRef *keys = malloc(count * sizeof(CFStringRef));
    CFDictionaryGetKeysAndValues(dictionary, keys, NULL);
    CFIndex s = state->state;
    for (CFIndex i = 0; s < count && i < len; i++, s++)
        buffer[i] = keys[s];
    free(keys);
    state->state = s;
    state->itemsPtr = buffer;
    state->mutationsPtr = &_revision;
    return count;
}

- (void)dealloc {
    [_dictionary release];
    [super dealloc];
}

@end


#pragma mark -


@interface MNLMutableColorPalette ()

@property (retain, setter=_setMutableDictionary:) NSMutableDictionary *_mutableDictionary;

@end


@implementation MNLMutableColorPalette

{
    uint64_t _revision;
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
        [dictionary release];
        _revision = 0;
    }
    return self;
}

- (instancetype)initWithColorPalette:(MNLColorPalette *)colorPalette {
    if (self = [super init]) {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:[colorPalette _dictionary]];
        [self _setMutableDictionary:dictionary];
        [dictionary release];
        _revision = 0;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)colorTable {
    if (self = [super init]) {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:colorTable];
        [self _setMutableDictionary:dictionary];
        [dictionary release];
        _revision = 0;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[MNLColorPalette allocWithZone:zone] initWithColorPalette:self];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithColorPalette:self];
}

- (void)setColor:(MNLColor *)color forKey:(NSString *)key {
    _revision++;
    [[self _mutableDictionary] setObject:color forKey:key];
}

- (void)removeColorForKey:(NSString *)key {
    _revision++;
    [[self _mutableDictionary] removeObjectForKey:key];
}

- (void)removeAllColors {
    _revision++;
    [[self _mutableDictionary] removeAllObjects];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *restrict)state objects:(id __unsafe_unretained *)buffer count:(NSUInteger)len {
    const CFDictionaryRef restrict dictionary = [self _mutableDictionary];
    CFIndex count = CFDictionaryGetCount(dictionary);
    if (state->state >= count) {
        memset(state, 0, sizeof(NSFastEnumerationState));
        memset(buffer, 0, sizeof(id) * len);
        return 0;
    }
    CFStringRef *keys = malloc(count * sizeof(CFStringRef));
    CFDictionaryGetKeysAndValues(dictionary, keys, NULL);
    CFIndex s = state->state;
    for (CFIndex i = 0; s < count && i < len; i++, s++)
        buffer[i] = keys[s];
    free(keys);
    state->state = s;
    state->itemsPtr = buffer;
    state->mutationsPtr = &_revision;
    return count;
}

@end
