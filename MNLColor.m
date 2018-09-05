#import "MNLColorInternal.h"
#import <CoreGraphics/CGColorSpace.h>


static MNLColor *MNLClearColor;
static MNLColorSpace MNLDefaultMonochromeColorSpace = MNLColorSpaceGenericGrayGamma2_2;
static MNLColorSpace MNLDefaultRGBColorSpace = MNLColorSpaceSRGB;
static MNLColorSpace MNLDefaultCMYKColorSpace = MNLColorSpaceGenericCMYK;


CFStringRef CGColorSpaceNameForMNLColorSpace(MNLColorSpace);
MNLColorSpace MNLColorSpaceForCGColorSpaceName(CFStringRef);


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
    return [(MNLColor *)[self alloc] initWithWhite:white alpha:alpha colorSpace:colorSpace];
}

+ (MNLColor *)colorWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithWhite:white colorSpace:colorSpace];
}

+ (MNLColor *)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha {
    return [(MNLColor *)[self alloc] initWithWhite:white alpha:alpha];
}

+ (MNLColor *)colorWithWhite:(CGFloat)white {
    return [(MNLColor *)[self alloc] initWithWhite:white];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithHexadecimalWhite:white alpha:alpha colorSpace:colorSpace];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithHexadecimalWhite:white colorSpace:colorSpace];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha {
    return [(MNLColor *)[self alloc] initWithHexadecimalWhite:white alpha:alpha];
}

+ (MNLColor *)colorWithHexadecimalWhite:(NSInteger)white {
    return [(MNLColor *)[self alloc] initWithHexadecimalWhite:white];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithRed:red green:green blue:blue alpha:alpha colorSpace:colorSpace];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithRed:red green:green blue:blue colorSpace:colorSpace];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [(MNLColor *)[self alloc] initWithRed:red green:green blue:blue alpha:alpha];
}

+ (MNLColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [(MNLColor *)[self alloc] initWithRed:red green:green blue:blue];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue alpha:alpha colorSpace:colorSpace];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue colorSpace:colorSpace];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue alpha:alpha];
}

+ (MNLColor *)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [(MNLColor *)[self alloc] initWithHexadecimalRed:red green:green blue:blue];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha colorSpace:colorSpace];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace {
    return [(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black colorSpace:colorSpace];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    return [(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha];
}

+ (MNLColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black {
    return [(MNLColor *)[self alloc] initWithCyan:cyan magenta:magenta yellow:yellow black:black];
}

+ (MNLColor *)colorWithCGColor:(CGColorRef)cgColor {
    return [(MNLColor *)[self alloc] initWithCGColor:cgColor];
}

- (CGColorRef)CGColor {
    return CGColorCreateCopy(_color);
}

- (BOOL)isMonochrome {
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorSpaceModel cgColorSpaceModel = CGColorSpaceGetModel(cgColorSpace);
    CGColorSpaceRelease(cgColorSpace);
    return cgColorSpaceModel == kCGColorSpaceModelMonochrome;
}

- (BOOL)isRGB {
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorSpaceModel cgColorSpaceModel = CGColorSpaceGetModel(cgColorSpace);
    CGColorSpaceRelease(cgColorSpace);
    return cgColorSpaceModel == kCGColorSpaceModelRGB;
}

- (BOOL)isCMYK {
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CGColorSpaceModel cgColorSpaceModel = CGColorSpaceGetModel(cgColorSpace);
    CGColorSpaceRelease(cgColorSpace);
    return cgColorSpaceModel == kCGColorSpaceModelCMYK;
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
                return self = nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelMonochrome) {
        CGColorSpaceRelease(cgColorSpace);
        return self = nil;
    }
    CGFloat components[] = {white, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace {
    return self = [self initWithWhite:white alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha {
    return self = [self initWithWhite:white alpha:alpha colorSpace:[[self class] defaultMonochromeColorSpace]];
}

- (instancetype)initWithWhite:(CGFloat)white {
    return self = [self initWithWhite:white alpha:1 colorSpace:[[self class] defaultMonochromeColorSpace]];
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
                return self = nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelMonochrome) {
        CGColorSpaceRelease(cgColorSpace);
        return self = nil;
    }
    CGFloat components[] = {white / (CGFloat)255, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace {
    return self = [self initWithHexadecimalWhite:white alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha {
    return self = [self initWithHexadecimalWhite:white alpha:alpha colorSpace:[[self class] defaultMonochromeColorSpace]];
}

- (instancetype)initWithHexadecimalWhite:(NSInteger)white {
    return self = [self initWithHexadecimalWhite:white alpha:1 colorSpace:[[self class] defaultMonochromeColorSpace]];
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
                return self = nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelRGB) {
        CGColorSpaceRelease(cgColorSpace);
        return self = nil;
    }
    CGFloat components[] = {red, green, blue, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace {
    return self = [self initWithRed:red green:green blue:blue alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return self = [self initWithRed:red green:green blue:blue alpha:alpha colorSpace:[[self class] defaultRGBColorSpace]];
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return self = [self initWithRed:red green:green blue:blue alpha:1 colorSpace:[[self class] defaultRGBColorSpace]];
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
                return self = nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelRGB) {
        CGColorSpaceRelease(cgColorSpace);
        return self = nil;
    }
    CGFloat components[] = {red / (CGFloat)255, green / (CGFloat)255, blue / (CGFloat)255, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace {
    return self = [self initWithHexadecimalRed:red green:green blue:blue alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return self = [self initWithHexadecimalRed:red green:green blue:blue alpha:alpha colorSpace:[[self class] defaultRGBColorSpace]];
}

- (instancetype)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return self = [self initWithHexadecimalRed:red green:green blue:blue alpha:1 colorSpace:[[self class] defaultRGBColorSpace]];
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
                return self = nil;
        }
    if (CGColorSpaceGetModel(cgColorSpace) != kCGColorSpaceModelCMYK) {
        CGColorSpaceRelease(cgColorSpace);
        return self = nil;
    }
    CGFloat components[] = {cyan, magenta, yellow, black, alpha};
    if (self = [super init])
        _color = CGColorCreate(cgColorSpace, components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace {
    return self = [self initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:1 colorSpace:colorSpace];
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    return self = [self initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:alpha colorSpace:[[self class] defaultCMYKColorSpace]];
}

- (instancetype)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black {
    return self = [self initWithCyan:cyan magenta:magenta yellow:yellow black:black alpha:1 colorSpace:[[self class] defaultCMYKColorSpace]];
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
                return self = nil;
        }
    const size_t componentsCapacityStep = 9;
    size_t componentsCapacity = componentsCapacityStep;
    CGFloat *components = calloc(componentsCapacity, sizeof(CGFloat));
    if (!components) {
        CGColorSpaceRelease(cgColorSpace);
        return self = nil;
    }
    CGFloat *component = components;
    va_list args;
    va_start(args, colorSpace);
    for (int i = 0; i <= CGColorSpaceGetNumberOfComponents(cgColorSpace); i++) {
        if (component >= components + componentsCapacity) {
            componentsCapacity += componentsCapacityStep;
            void *temp = realloc(components, sizeof(CGFloat) * componentsCapacity);
            if (!temp) {
                free(components);
                CGColorSpaceRelease(cgColorSpace);
                return self = nil;
            }
            component = (components = temp) + i;
        }
        *component++ = va_arg(args, CGFloat);
    }
    va_end(args);
    if (self = [super init])
        if (!(_color = CGColorCreate(cgColorSpace, components))) {
            free(components);
            CGColorSpaceRelease(cgColorSpace);
            return self = nil;
        }
    free(components);
    CGColorSpaceRelease(cgColorSpace);
    return self;
}

- (instancetype)initWithCGColor:(CGColorRef)cgColor {
    if (self = [super init])
        _color = CGColorCreateCopy(cgColor);
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        NSUInteger len;
        const void *temp;
        MNLColorSpace colorSpace = [coder decodeIntegerForKey:@"colorSpace"];
        CFStringRef cgColorSpaceName = CGColorSpaceNameForMNLColorSpace(colorSpace);
        CGColorSpaceRef cgColorSpace = CGColorSpaceCreateWithName(cgColorSpaceName);
        if (!cgColorSpace)
            return self = nil;
        temp = [coder decodeBytesForKey:@"components" returnedLength:&len];
        _color = CGColorCreate(cgColorSpace, (CGFloat *)temp);
        CGColorSpaceRelease(cgColorSpace);
        if (!_color)
            return self = nil;
    }
    return self;
}

- (void)dealloc {
    CGColorRelease(_color);
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithCGColor:_color];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    CGColorSpaceRef cgColorSpace = CGColorGetColorSpace(_color);
    CFStringRef cgColorSpaceName = CGColorSpaceCopyName(cgColorSpace);
    MNLColorSpace colorSpace = MNLColorSpaceForCGColorSpaceName(cgColorSpaceName);
    CFRelease(cgColorSpaceName);
    size_t len = sizeof(CGFloat) * CGColorGetNumberOfComponents(_color);
    const void *components = CGColorGetComponents(_color);
    [coder encodeInteger:colorSpace forKey:@"colorSpace"];
    [coder encodeBytes:components length:len forKey:@"components"];
}

- (BOOL)monochromeColorComponents:(MNLMonochromeColorComponents *)components {
    if (![self isMonochrome])
        return NO;
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * CGColorGetNumberOfComponents(_color));
    return YES;
}

- (BOOL)RGBColorComponents:(MNLRGBColorComponents *)components {
    if (![self isRGB])
        return NO;
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * CGColorGetNumberOfComponents(_color));
    return YES;
}

- (BOOL)CMYKColorComponents:(MNLCMYKColorComponents *)components {
    if (![self isCMYK])
        return NO;
    const CGFloat *cgComponents = CGColorGetComponents(_color);
    memcpy(components, cgComponents, sizeof(CGFloat) * CGColorGetNumberOfComponents(_color));
    return YES;
}

@end


@implementation MNLColor (CIColor)

+ (MNLColor *)colorWithCIColor:(CIColor *)ciColor {
    return [[MNLColor alloc] initWithCIColor:ciColor];
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


#if TARGET_OS_IPHONE  // TARGET_OS_IOS | TARGET_OS_TV | TARGET_OS_WATCH

@implementation MNLColor (UIColor)

+ (MNLColor *)colorWithUIColor:(UIColor *)uiColor {
    return [[MNLColor alloc] initWithUIColor:uiColor];
}

- (UIColor *)UIColor {
    return [UIColor colorWithCGColor:_color];
}

- (instancetype)initWithUIColor:(UIColor *)uiColor {
    if (self = [super init])
        _color = [uiColor CGColor];
    return self;
}

@end

#endif


#if TARGET_OS_OSX

@implementation MNLColor (NSColor)

+ (MNLColor *)colorWithNSColor:(NSColor *)nsColor {
    return [[MNLColor alloc] initWithNSColor:nsColor];
}

- (NSColor *)NSColor {
    return [NSColor colorWithCGColor:_color];
}

- (instancetype )initWithNSColor:(NSColor *)nsColor {
    if (self = [super init])
        _color = [nsColor CGColor];
    return self;
}

@end

#endif


CFStringRef CGColorSpaceNameForMNLColorSpace(MNLColorSpace cs) {
    switch (cs) {
        case MNLColorSpaceGenericGray:
            return kCGColorSpaceGenericGray;
        case MNLColorSpaceGenericRGB:
            return kCGColorSpaceGenericRGB;
        case MNLColorSpaceGenericCMYK:
            return kCGColorSpaceGenericCMYK;
        case MNLColorSpaceGenericRGBLinear:
            return kCGColorSpaceGenericRGBLinear;
        case MNLColorSpaceAdobeRGB1998:
            return kCGColorSpaceAdobeRGB1998;
        case MNLColorSpaceSRGB:
            return kCGColorSpaceSRGB;
        case MNLColorSpaceGenericGrayGamma2_2:
            return kCGColorSpaceGenericGrayGamma2_2;
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
        case MNLColorSpaceDisplayP3:
            return kCGColorSpaceDisplayP3;
        case MNLColorSpaceLinearGray:
            return kCGColorSpaceLinearGray;
        case MNLColorSpaceExtendedSRGB:
            return kCGColorSpaceExtendedSRGB;
        case MNLColorSpaceExtendedLinearSRGB:
            return kCGColorSpaceExtendedLinearSRGB;
        case MNLColorSpaceExtendedGray:
            return kCGColorSpaceExtendedGray;
        case MNLColorSpaceExtendedLinearGray:
            return kCGColorSpaceExtendedLinearGray;
        default:
            return NULL;
    }
}

MNLColorSpace MNLColorSpaceForCGColorSpaceName(CFStringRef s) {
    if (CFStringCompare(s, kCGColorSpaceGenericGray, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceGenericGray;
    if (CFStringCompare(s, kCGColorSpaceGenericRGB, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceGenericRGB;
    if (CFStringCompare(s, kCGColorSpaceGenericCMYK, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceGenericCMYK;
    if (CFStringCompare(s, kCGColorSpaceGenericRGBLinear, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceGenericRGBLinear;
    if (CFStringCompare(s, kCGColorSpaceAdobeRGB1998, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceAdobeRGB1998;
    if (CFStringCompare(s, kCGColorSpaceSRGB, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceSRGB;
    if (CFStringCompare(s, kCGColorSpaceGenericGrayGamma2_2, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceGenericGrayGamma2_2;
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
    if (CFStringCompare(s, kCGColorSpaceDisplayP3, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceDisplayP3;
    if (CFStringCompare(s, kCGColorSpaceLinearGray, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceLinearGray;
    if (CFStringCompare(s, kCGColorSpaceExtendedSRGB, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceExtendedSRGB;
    if (CFStringCompare(s, kCGColorSpaceExtendedLinearSRGB, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceExtendedLinearSRGB;
    if (CFStringCompare(s, kCGColorSpaceExtendedGray, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceExtendedGray;
    if (CFStringCompare(s, kCGColorSpaceExtendedLinearGray, kNilOptions) == kCFCompareEqualTo)
        return MNLColorSpaceExtendedLinearGray;
    return MNLColorSpaceUnknown;
}
