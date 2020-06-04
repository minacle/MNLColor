#import "MNLColorInternal.h"
#import <CoreGraphics/CGColorSpace.h>


static MNLColor *MNLClearColor;
static MNLColorSpace MNLDefaultMonochromeColorSpace = MNLColorSpaceGenericGrayGamma2_2;
static MNLColorSpace MNLDefaultRGBColorSpace = MNLColorSpaceSRGB;
static MNLColorSpace MNLDefaultCMYKColorSpace = MNLColorSpaceGenericCMYK;


const CFStringRef CGColorSpaceNameForMNLColorSpace(MNLColorSpace);
MNLColorSpace MNLColorSpaceForCGColorSpaceName(const CFStringRef);


@implementation MNLColor

{
    CGColorRef _color;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (MNLColorSpace)defaultMonochromeColorSpace {
    return MNLDefaultMonochromeColorSpace;
}

+ (void)setDefaultMonochromeColorSpace:(MNLColorSpace)defaultMonochromeColorSpace {
    MNLDefaultMonochromeColorSpace = defaultMonochromeColorSpace;
}

+ (MNLColorSpace)defaultRGBColorSpace {
    return MNLDefaultRGBColorSpace;
}

+ (void)setDefaultRGBColorSpace:(MNLColorSpace)defaultRGBColorSpace {
    MNLDefaultRGBColorSpace = defaultRGBColorSpace;
}

+ (MNLColorSpace)defaultCMYKColorSpace {
    return MNLDefaultCMYKColorSpace;
}

+ (void)setDefaultCMYKColorSpace:(MNLColorSpace)defaultCMYKColorSpace {
    MNLDefaultCMYKColorSpace = defaultCMYKColorSpace;
}

+ (MNLColor *)clearColor {
    MNLReturnSingletonColor([[MNLColor alloc] init], MNLClearColor);
}

+ (MNLColor *)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithWhite:white alpha:alpha colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithWhite:white colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha {
    return [[(MNLColor *)[self alloc] initWithWhite:white alpha:alpha] autorelease];
}

+ (MNLColor *)colorWithWhite:(CGFloat)white {
    return [[(MNLColor *)[self alloc] initWithWhite:white] autorelease];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithHexadecimalWhite:white alpha:alpha colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithHexadecimalWhite:white colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha {
    return [[(MNLColor *)[self alloc] initWithHexadecimalWhite:white alpha:alpha] autorelease];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white {
    return [[(MNLColor *)[self alloc] initWithHexadecimalWhite:white] autorelease];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithRed:red green:green blue:blue alpha:alpha colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithRed:red green:green blue:blue colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [[(MNLColor *)[self alloc] initWithRed:red green:green blue:blue alpha:alpha] autorelease];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [[(MNLColor *)[self alloc] initWithRed:red green:green blue:blue] autorelease];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue alpha:alpha colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [[(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue alpha:alpha] autorelease];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [[(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue] autorelease];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace {
    return [[(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black colorSpace:colorSpace] autorelease];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    return [[(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha] autorelease];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black {
    return [[(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black] autorelease];
}

+ (MNLColor *)colorWithCGColor:(CGColorRef)cgColor {
    return [[(MNLColor *)[self alloc] initWithCGColor:cgColor] autorelease];
}

+ (MNLColor *)colorWithColor:(MNLColor *)color {
    return [[color retain] autorelease];
}

- (CGColorRef)CGColor {
    return _color;
}

- (BOOL)isMonochrome {
    CGColorRetain(_color);
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorRelease(_color);
    CGColorSpaceModel cgColorSpaceModel = CGColorSpaceGetModel(cgColorSpace);
    return cgColorSpaceModel == kCGColorSpaceModelMonochrome;
}

- (BOOL)isRGB {
    CGColorRetain(_color);
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorRelease(_color);
    CGColorSpaceModel cgColorSpaceModel = CGColorSpaceGetModel(cgColorSpace);
    return cgColorSpaceModel == kCGColorSpaceModelRGB;
}

- (BOOL)isCMYK {
    CGColorRetain(_color);
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorRelease(_color);
    CGColorSpaceModel cgColorSpaceModel = CGColorSpaceGetModel(cgColorSpace);
    return cgColorSpaceModel == kCGColorSpaceModelCMYK;
}

- (MNLColorSpace)colorSpace {
    CGColorRetain(_color);
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorRelease(_color);
    CFStringRef colorSpaceName = CGColorSpaceCopyName(cgColorSpace);
    MNLColorSpace colorSpace;
    if (colorSpaceName) {
        colorSpace = MNLColorSpaceForCGColorSpaceName(colorSpaceName);
        CFRelease(colorSpaceName);
    }
    else
        colorSpace = MNLColorSpaceUnknown;
    return colorSpace;
}

- (NSUInteger)numberOfComponents {
    CGColorRetain(_color);
    size_t numberOfComponents = CGColorGetNumberOfComponents(_color) + (/* alpha */ 1);
    CGColorRelease(_color);
    return numberOfComponents;
}

- (instancetype)init {
    CGColorSpaceRef cgColorSpace = CGColorSpaceCreateDeviceGray();
    CGFloat components[] = {0, 0};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    const CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
    CGColorSpaceRef cgColorSpace;
    if (cgColorSpaceName)
        cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
    else
        switch (colorSpace) {
        case MNLColorSpaceDeviceGray:
            cgColorSpace = CGColorSpaceCreateDeviceGray();
            break;
        case MNLColorSpaceDeviceRGB:
            cgColorSpace = CGColorSpaceCreateDeviceRGB();
            break;
        case MNLColorSpaceDeviceCMYK:
            cgColorSpace = CGColorSpaceCreateDeviceCMYK();
            break;
        default:
            [self release];
            return nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelMonochrome) {
        CGColorSpaceRelease(cgColorSpace);
        [self release];
        return nil;
    }
    CGFloat components[] = {white, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace {
    return [self initWithWhite:white alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha {
    return [self initWithWhite:white alpha:alpha colorSpace:[[self class] defaultMonochromeColorSpace]];
}

- (instancetype)initWithWhite:(CGFloat)white {
    return [self initWithWhite:white alpha:1 colorSpace:[[self class] defaultMonochromeColorSpace]];
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
    CGColorSpaceRef cgColorSpace;
    if (cgColorSpaceName)
        cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
    else
        switch (colorSpace) {
        case MNLColorSpaceDeviceGray:
            cgColorSpace = CGColorSpaceCreateDeviceGray();
            break;
        case MNLColorSpaceDeviceRGB:
            cgColorSpace = CGColorSpaceCreateDeviceRGB();
            break;
        case MNLColorSpaceDeviceCMYK:
            cgColorSpace = CGColorSpaceCreateDeviceCMYK();
            break;
        default:
            [self release];
            return nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelMonochrome) {
        CGColorSpaceRelease(cgColorSpace);
        [self release];
        return nil;
    }
    CGFloat components[] = {white / (CGFloat)255, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace {
    return [self initWithHexadecimalWhite:white alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha {
    return [self initWithHexadecimalWhite:white alpha:alpha colorSpace:[[self class] defaultMonochromeColorSpace]];
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white {
    return [self initWithHexadecimalWhite:white alpha:1 colorSpace:[[self class] defaultMonochromeColorSpace]];
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
    CGColorSpaceRef cgColorSpace;
    if (cgColorSpaceName)
        cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
    else
        switch (colorSpace) {
        case MNLColorSpaceDeviceGray:
            cgColorSpace = CGColorSpaceCreateDeviceGray();
            break;
        case MNLColorSpaceDeviceRGB:
            cgColorSpace = CGColorSpaceCreateDeviceRGB();
            break;
        case MNLColorSpaceDeviceCMYK:
            cgColorSpace = CGColorSpaceCreateDeviceCMYK();
            break;
        default:
            [self release];
            return nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelRGB) {
        CGColorSpaceRelease(cgColorSpace);
        [self release];
        return nil;
    }
    CGFloat components[] = {red, green, blue, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace {
    return [self initWithRed:red green:green blue:blue alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self initWithRed:red green:green blue:blue alpha:alpha colorSpace:[[self class] defaultRGBColorSpace]];
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [self initWithRed:red green:green blue:blue alpha:1 colorSpace:[[self class] defaultRGBColorSpace]];
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
    CGColorSpaceRef cgColorSpace;
    if (cgColorSpaceName)
        cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
    else
        switch (colorSpace) {
        case MNLColorSpaceDeviceGray:
            cgColorSpace = CGColorSpaceCreateDeviceGray();
            break;
        case MNLColorSpaceDeviceRGB:
            cgColorSpace = CGColorSpaceCreateDeviceRGB();
            break;
        case MNLColorSpaceDeviceCMYK:
            cgColorSpace = CGColorSpaceCreateDeviceCMYK();
            break;
        default:
            [self release];
            return nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelRGB) {
        CGColorSpaceRelease(cgColorSpace);
        [self release];
        return nil;
    }
    CGFloat components[] = {red / (CGFloat)255, green / (CGFloat)255, blue / (CGFloat)255, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace {
    return [self initWithHexadecimalRed:red green:green blue:blue alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [self initWithHexadecimalRed:red green:green blue:blue alpha:alpha colorSpace:[[self class] defaultRGBColorSpace]];
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [self initWithHexadecimalRed:red green:green blue:blue alpha:1 colorSpace:[[self class] defaultRGBColorSpace]];
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
    CGColorSpaceRef cgColorSpace;
    if (cgColorSpaceName)
        cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
    else
        switch (colorSpace) {
        case MNLColorSpaceDeviceGray:
            cgColorSpace = CGColorSpaceCreateDeviceGray();
            break;
        case MNLColorSpaceDeviceRGB:
            cgColorSpace = CGColorSpaceCreateDeviceRGB();
            break;
        case MNLColorSpaceDeviceCMYK:
            cgColorSpace = CGColorSpaceCreateDeviceCMYK();
            break;
        default:
            [self release];
            return nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelCMYK) {
        CGColorSpaceRelease(cgColorSpace);
        [self release];
        return nil;
    }
    CGFloat components[] = {cyan, magenta, yellow, black, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace {
    return [self initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    return [self initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha colorSpace:[[self class] defaultCMYKColorSpace]];
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black {
    return [self initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:1 colorSpace:[[self class] defaultCMYKColorSpace]];
}

- (instancetype)initWithColorSpace:(MNLColorSpace)colorSpace, ... {
    CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
    CGColorSpaceRef cgColorSpace;
    if (cgColorSpaceName)
        cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
    else
        switch (colorSpace) {
        case MNLColorSpaceDeviceGray:
            cgColorSpace = CGColorSpaceCreateDeviceGray();
            break;
        case MNLColorSpaceDeviceRGB:
            cgColorSpace = CGColorSpaceCreateDeviceRGB();
            break;
        case MNLColorSpaceDeviceCMYK:
            cgColorSpace = CGColorSpaceCreateDeviceCMYK();
            break;
        default:
            [self release];
            return nil;
        }
    size_t numberOfComponents = CGColorSpaceGetNumberOfComponents(cgColorSpace);
    CGFloat *components = calloc(numberOfComponents, sizeof(CGFloat));
    if (!components) {
        CGColorSpaceRelease(cgColorSpace);
        [self release];
        return nil;
    }
    CGFloat *component = components;
    va_list args;
    va_start(args, colorSpace);
    for (int i = 0; i <= numberOfComponents; i++)
        *component++ = va_arg(args, CGFloat);
    va_end(args);
    if (self = [super init])
        if (!(_color = CGColorCreate(cgColorSpace, components))) {
            free(components);
            CGColorSpaceRelease(cgColorSpace);
            [self release];
            return nil;
        }
    free(components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithCGColor:(CGColorRef)cgColor {
    if (self = [super init])
        _color = CGColorRetain(cgColor);
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        MNLColorSpace colorSpace = [coder decodeIntegerForKey:@"colorSpace"];
        CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
        CGColorSpaceRef cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
        if (!cgColorSpace) {
            [self release];
            return nil;
        }
        CFArrayRef componentsArray = [coder decodeObjectOfClass:[NSArray class] forKey:@"components"];
        CFIndex componentsCount = CFArrayGetCount(componentsArray);
        CFNumberRef *componentNumbers = malloc(componentsCount * sizeof(CFNumberRef));
        CGFloat *cgColorComponents = malloc(componentsCount * sizeof(CGFloat));
        CFArrayGetValues(componentsArray, CFRangeMake(0, componentsCount), componentNumbers);
        CFIndex i;
        for (i = 0; i < componentsCount; i++)
            CFNumberGetValue(componentNumbers[i], kCFNumberCGFloatType, cgColorComponents + i);
        free(componentNumbers);
        _color = CGColorCreate(cgColorSpace, cgColorComponents);
        CGColorSpaceRelease(cgColorSpace);
        free(cgColorComponents);
        if (!_color) {
            [self release];
            return nil;
        }
    }
    return self;
}

- (void)dealloc {
    CGColorRelease(_color);
    [super dealloc];
}

- (id)copyWithZone:(NSZone *)zone {
    if (zone) {
        CGColorRetain(_color);
        id copy = [[[self class] allocWithZone:zone] initWithCGColor:_color];
        CGColorRelease(_color);
        return copy;
    }
    else
        return [self retain];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder retain];
    CGColorRetain(_color);
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CFStringRef cgColorSpaceName = CGColorSpaceCopyName(cgColorSpace);
    MNLColorSpace colorSpace = MNLColorSpaceForCGColorSpaceName(cgColorSpaceName);
    CFRelease(cgColorSpaceName);
    size_t numberOfComponents = CGColorGetNumberOfComponents(_color) + (/* alpha */ 1);
    const CGFloat *cgColorComponents = CGColorGetComponents(_color);
    [coder encodeInteger:colorSpace forKey:@"colorSpace"];
    CFMutableArrayRef componentsArray = CFArrayCreateMutable(kCFAllocatorDefault, numberOfComponents, &kCFTypeArrayCallBacks);
    while (numberOfComponents-- > 0) {
        CFNumberRef componentNumber = CFNumberCreate(kCFAllocatorDefault, kCFNumberCGFloatType, cgColorComponents++);
        CFArrayAppendValue(componentsArray, &componentNumber);
    }
    CGColorRelease(_color);
    [coder encodeObject:componentsArray forKey:@"components"];
    CFRelease(componentsArray);
    [coder release];
}

- (BOOL)monochromeColorComponents:(MNLMonochromeColorComponents *)components {
    if (![self isMonochrome])
        return NO;
    CGColorRetain(_color);
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * (CGColorGetNumberOfComponents(_color) + (/* alpha */ 1)));
    CGColorRelease(_color);
    return YES;
}

- (BOOL)RGBColorComponents:(MNLRGBColorComponents *)components {
    if (![self isRGB])
        return NO;
    CGColorRetain(_color);
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * (CGColorGetNumberOfComponents(_color) + (/* alpha */ 1)));
    CGColorRelease(_color);
    return YES;
}

- (BOOL)CMYKColorComponents:(MNLCMYKColorComponents *)components {
    if (![self isCMYK])
        return NO;
    CGColorRetain(_color);
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * (CGColorGetNumberOfComponents(_color) + (/* alpha */ 1)));
    CGColorRelease(_color);
    return YES;
}

- (instancetype)colorWithAlpha:(CGFloat)alpha {
    CGColorRetain(_color);
    CGColorRef cgColor = CGColorCreateCopyWithAlpha(_color, alpha);
    CGColorRelease(_color);
    id color = [[[self class] alloc] initWithCGColor:cgColor];
    CGColorRelease(cgColor);
    return [color autorelease];
}

- (instancetype)colorWithColorSpace:(MNLColorSpace)colorSpace renderingIntent:(MNLColorRenderingIntent)renderingIntent {
    CGColorSpaceRef cgColorSpace = CGColorSpaceCreateWithName(CGColorSpaceNameForMNLColorSpace(colorSpace));
    CGColorRenderingIntent cgColorRenderingIntent;
    switch (renderingIntent) {
    case MNLColorRenderingIntentDefault:
        cgColorRenderingIntent = kCGRenderingIntentDefault;
        break;
    case MNLColorRenderingIntentAbsoluteColorimetric:
        cgColorRenderingIntent = kCGRenderingIntentAbsoluteColorimetric;
        break;
    case MNLColorRenderingIntentRelativeColorimetric:
        cgColorRenderingIntent = kCGRenderingIntentRelativeColorimetric;
        break;
    case MNLColorRenderingIntentPerceptual:
        cgColorRenderingIntent = kCGRenderingIntentPerceptual;
        break;
    case MNLColorRenderingIntentSaturation:
        cgColorRenderingIntent = kCGRenderingIntentSaturation;
    }
    CGColorRetain(_color);
    CGColorRef cgColor = CGColorCreateCopyByMatchingToColorSpace(cgColorSpace, cgColorRenderingIntent, _color, NULL);
    CGColorRelease(_color);
    CGColorSpaceRelease(cgColorSpace);
    id color = [[[self class] alloc] initWithCGColor:cgColor];
    CGColorRelease(cgColor);
    return [color autorelease];
}

- (void)getMonochromeColorComponents:(MNLMonochromeColorComponents *)components {
    static MNLMonochromeColorComponents nac = {NAN, NAN};
    if (![self isMonochrome]) {
        *components = nac;
        return;
    }
    CGColorRetain(_color);
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * 2);
    CGColorRelease(_color);
}

- (void)getRGBColorComponents:(MNLRGBColorComponents *)components {
    static MNLRGBColorComponents nac = {NAN, NAN, NAN, NAN};
    if (![self isRGB]) {
        *components = nac;
        return;
    }
    CGColorRetain(_color);
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * 4);
    CGColorRelease(_color);
}

- (void)getCMYKColorComponents:(MNLCMYKColorComponents *)components {
    static MNLCMYKColorComponents nac = {NAN, NAN, NAN, NAN, NAN};
    if (![self isCMYK]) {
        *components = nac;
        return;
    }
    CGColorRetain(_color);
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * 5);
    CGColorRelease(_color);
}

- (void)getColorComponents:(CGFloat *)components {
    CGColorRetain(_color);
    size_t numberOfComponents = CGColorGetNumberOfComponents(_color) + (/* alpha */ 1);
    const CGFloat *cgColorComponents = CGColorGetComponents(_color);
    memcpy(components, cgColorComponents, numberOfComponents * sizeof(CGFloat));
    CGColorRelease(_color);
}

@end


#if !TARGET_OS_WATCH

@implementation MNLColor (CIColor)

+ (MNLColor *)colorWithCIColor:(CIColor *)ciColor {
    return [[[MNLColor alloc] initWithCIColor:ciColor] autorelease];
}

- (CIColor *)CIColor {
    return [CIColor colorWithCGColor:_color];
}

- (instancetype)initWithCIColor:(CIColor *)ciColor {
    if (self = [super init])
        _color = CGColorCreate([ciColor colorSpace], [ciColor components]);
    return self;
}

@end

#endif


#if TARGET_OS_IPHONE  // TARGET_OS_IOS | TARGET_OS_TV | TARGET_OS_WATCH

@implementation MNLColor (UIColor)

+ (MNLColor *)colorWithUIColor:(UIColor *)uiColor {
    return [[[MNLColor alloc] initWithUIColor:uiColor] autorelease];
}

- (UIColor *)UIColor {
    return [UIColor colorWithCGColor:_color];
}

- (instancetype)initWithUIColor:(UIColor *)uiColor {
    if (self = [super init])
        _color = CGColorCreateCopy([uiColor CGColor]);
    return self;
}

@end

#endif


#if TARGET_OS_OSX

@implementation MNLColor (NSColor)

+ (MNLColor *)colorWithNSColor:(NSColor *)nsColor {
    return [[[MNLColor alloc] initWithNSColor:nsColor] autorelease];
}

- (NSColor *)NSColor {
    return [NSColor colorWithCGColor:_color];
}

- (instancetype )initWithNSColor:(NSColor *)nsColor {
    if (self = [super init])
        _color = CGColorCreateCopy([nsColor CGColor]);
    return self;
}

@end

#endif


const CFStringRef CGColorSpaceNameForMNLColorSpace(MNLColorSpace cs) {
    if (@available(iOS 9.0, macOS 10.4, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceGenericGray:
            return kCGColorSpaceGenericGray;
        case MNLColorSpaceGenericRGB:
            return kCGColorSpaceGenericRGB;
        case MNLColorSpaceGenericCMYK:
            return kCGColorSpaceGenericCMYK;
        }
    if (@available(iOS 9.0, macOS 10.5, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceGenericRGBLinear:
            return kCGColorSpaceGenericRGBLinear;
        case MNLColorSpaceAdobeRGB1998:
            return kCGColorSpaceAdobeRGB1998;
        case MNLColorSpaceSRGB:
            return kCGColorSpaceSRGB;
        }
    if (@available(iOS 9.0, macOS 10.6, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceGenericGrayGamma2_2:
            return kCGColorSpaceGenericGrayGamma2_2;
        }
    if (@available(iOS 9.0, macOS 10.11, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceGenericXYZ:
            return kCGColorSpaceGenericXYZ;
        case MNLColorSpaceACESCGLinear:
            return kCGColorSpaceACESCGLinear;
        case MNLColorSpaceITUR_709:
            return kCGColorSpaceITUR_709;
        case MNLColorSpaceITUR_2020:
            return kCGColorSpaceITUR_2020;
        case MNLColorSpaceROMMRGB:
            return kCGColorSpaceROMMRGB;
        case MNLColorSpaceDCIP3:
            return kCGColorSpaceDCIP3;
        }
    if (@available(iOS 9.3, macOS 10.11.2, tvOS 9.3, watchOS 2.3, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceDisplayP3:
            return kCGColorSpaceDisplayP3;
        }
    if (@available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceLinearGray:
            return kCGColorSpaceLinearGray;
        case MNLColorSpaceExtendedSRGB:
            return kCGColorSpaceExtendedSRGB;
        case MNLColorSpaceLinearSRGB:
            return kCGColorSpaceLinearSRGB;
        case MNLColorSpaceExtendedLinearSRGB:
            return kCGColorSpaceExtendedLinearSRGB;
        case MNLColorSpaceExtendedGray:
            return kCGColorSpaceExtendedGray;
        case MNLColorSpaceExtendedLinearGray:
            return kCGColorSpaceExtendedLinearGray;
        }
    if (@available(iOS 12.3, macOS 10.14.3, tvOS 12.3, watchOS 5.3, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceExtendedLinearDisplayP3:
            return kCGColorSpaceExtendedLinearDisplayP3;
        case MNLColorSpaceExtendedLinearITUR_2020:
            return kCGColorSpaceExtendedLinearITUR_2020;
        }
    if (@available(iOS 13.0, macOS 10.14.6, tvOS 13.0, watchOS 6.0, macCatalyst 13.0, *))
        switch (cs) {
        case MNLColorSpaceDisplayP3_PQ_EOTF:
            return kCGColorSpaceDisplayP3_PQ_EOTF;
        case MNLColorSpaceDisplayP3_HLG:
            return kCGColorSpaceDisplayP3_HLG;
        case MNLColorSpaceITUR_2020_PQ_EOTF:
            return kCGColorSpaceITUR_2020_PQ_EOTF;
        case MNLColorSpaceITUR_2020_HLG:
            return kCGColorSpaceITUR_2020_HLG;
        }
    return NULL;
}

MNLColorSpace MNLColorSpaceForCGColorSpaceName(const CFStringRef s) {
    if (@available(iOS 9.0, macOS 10.4, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceGenericGray, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceGenericGray;
        if (CFStringCompare(s, kCGColorSpaceGenericRGB, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceGenericRGB;
        if (CFStringCompare(s, kCGColorSpaceGenericCMYK, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceGenericCMYK;
    }
    if (@available(iOS 9.0, macOS 10.5, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceGenericRGBLinear, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceGenericRGBLinear;
        if (CFStringCompare(s, kCGColorSpaceAdobeRGB1998, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceAdobeRGB1998;
        if (CFStringCompare(s, kCGColorSpaceSRGB, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceSRGB;
    }
    if (@available(iOS 9.0, macOS 10.6, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceGenericGrayGamma2_2, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceGenericGrayGamma2_2;
    }
    if (@available(iOS 9.0, macOS 10.11, tvOS 9.0, watchOS 2.0, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceGenericXYZ, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceGenericXYZ;
        if (CFStringCompare(s, kCGColorSpaceACESCGLinear, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceACESCGLinear;
        if (CFStringCompare(s, kCGColorSpaceITUR_709, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceITUR_709;
        if (CFStringCompare(s, kCGColorSpaceITUR_2020, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceITUR_2020;
        if (CFStringCompare(s, kCGColorSpaceROMMRGB, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceROMMRGB;
        if (CFStringCompare(s, kCGColorSpaceDCIP3, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceDCIP3;
    }
    if (@available(iOS 9.3, macOS 10.11.2, tvOS 9.3, watchOS 2.3, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceDisplayP3, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceDisplayP3;
    }
    if (@available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceLinearGray, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceLinearGray;
        if (CFStringCompare(s, kCGColorSpaceExtendedSRGB, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceExtendedSRGB;
        if (CFStringCompare(s, kCGColorSpaceLinearSRGB, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceLinearSRGB;
        if (CFStringCompare(s, kCGColorSpaceExtendedLinearSRGB, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceExtendedLinearSRGB;
        if (CFStringCompare(s, kCGColorSpaceExtendedGray, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceExtendedGray;
        if (CFStringCompare(s, kCGColorSpaceExtendedLinearGray, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceExtendedLinearGray;
    }
    if (@available(iOS 12.3, macOS 10.14.3, tvOS 12.3, watchOS 5.3, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceExtendedLinearDisplayP3, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceExtendedLinearDisplayP3;
        if (CFStringCompare(s, kCGColorSpaceExtendedLinearITUR_2020, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceExtendedLinearITUR_2020;
    }
    if (@available(iOS 13.0, macOS 10.14.6, tvOS 13.0, watchOS 6.0, macCatalyst 13.0, *)) {
        if (CFStringCompare(s, kCGColorSpaceDisplayP3_PQ_EOTF, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceDisplayP3_PQ_EOTF;
        if (CFStringCompare(s, kCGColorSpaceDisplayP3_HLG, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceDisplayP3_HLG;
        if (CFStringCompare(s, kCGColorSpaceITUR_2020_PQ_EOTF, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceITUR_2020_PQ_EOTF;
        if (CFStringCompare(s, kCGColorSpaceITUR_2020_HLG, kNilOptions) == kCFCompareEqualTo)
            return MNLColorSpaceITUR_2020_HLG;
    }
    return MNLColorSpaceUnknown;
}
