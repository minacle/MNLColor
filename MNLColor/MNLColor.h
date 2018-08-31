#import <Foundation/Foundation.h>
#include <CoreGraphics/CGColor.h>

typedef NS_ENUM(NSInteger, MNLColorSpace) {
    // 10.0
    MNLColorSpaceDeviceGray NS_SWIFT_NAME(deviceGray) = NSIntegerMin,
    MNLColorSpaceDeviceRGB NS_SWIFT_NAME(deviceRGB),
    MNLColorSpaceDeviceCMYK NS_SWIFT_NAME(deviceCMYK),
    //
    MNLColorSpaceUnknown NS_SWIFT_NAME(unknown) = -1,
    // 10.4
    MNLColorSpaceGenericGray NS_SWIFT_NAME(gray),
    MNLColorSpaceGenericRGB NS_SWIFT_NAME(rgb),
    MNLColorSpaceGenericCMYK NS_SWIFT_NAME(cmyk),
    // 10.5
    MNLColorSpaceGenericRGBLinear NS_SWIFT_NAME(rgbLinear),
    MNLColorSpaceAdobeRGB1998 NS_SWIFT_NAME(rgb1998),
    MNLColorSpaceSRGB NS_SWIFT_NAME(sRGB),
    // 10.6
    MNLColorSpaceGenericGrayGamma2_2 NS_SWIFT_NAME(genericGrayGamma22),
    // 10.11
    MNLColorSpaceGenericXYZ NS_SWIFT_NAME(genericXYZ),
    MNLColorSpaceACESCGLinear NS_SWIFT_NAME(asescgLinear),
    MNLColorSpaceITUR_709 NS_SWIFT_NAME(itur709),
    MNLColorSpaceITUR_2020 NS_SWIFT_NAME(itur2020),
    MNLColorSpaceROMMRGB NS_SWIFT_NAME(rommRGB),
    MNLColorSpaceDCIP3 NS_SWIFT_NAME(dciP3),
    // 10.11.2
    MNLColorSpaceDisplayP3 NS_SWIFT_NAME(displayP3),
    // 10.12
    MNLColorSpaceLinearGray NS_SWIFT_NAME(linearGray),
    MNLColorSpaceExtendedSRGB NS_SWIFT_NAME(extendedSRGB),
    MNLColorSpaceLinearSRGB NS_SWIFT_NAME(linearSRGB),
    MNLColorSpaceExtendedLinearSRGB NS_SWIFT_NAME(extendedLinearSRGB),
    MNLColorSpaceExtendedGray NS_SWIFT_NAME(extendedGray),
    MNLColorSpaceExtendedLinearGray NS_SWIFT_NAME(extendedLinearGray),
};

typedef struct {
    CGFloat white;
    CGFloat alpha;
} MNLMonochromeColorComponents;

typedef struct {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
} MNLRGBColorComponents;

typedef struct {
    CGFloat cyan;
    CGFloat magenta;
    CGFloat yellow;
    CGFloat black;
    CGFloat alpha;
} MNLCMYKColorComponents;


@class MNLColorPalette;


#pragma mark -

@interface MNLColor : NSObject <NSCopying, NSSecureCoding>

@property (class, nonatomic) MNLColorSpace defaultMonochromeColorSpace;
@property (class, nonatomic) MNLColorSpace defaultRGBColorSpace;
@property (class, nonatomic) MNLColorSpace defaultCMYKColorSpace;
@property (class, nonatomic, readonly, nonnull) MNLColor *clearColor;

+ (MNLColor *_Nullable)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
+ (MNLColor *_Nullable)colorWithWhite:(CGFloat)white;
+ (MNLColor *_Nullable)colorWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha;
+ (MNLColor *_Nullable)colorWithHexadecimalWhite:(NSInteger)white;
+ (MNLColor *_Nullable)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (MNLColor *_Nullable)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (MNLColor *_Nullable)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+ (MNLColor *_Nullable)colorWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (MNLColor *_Nullable)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace;
+ (MNLColor *_Nullable)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;
+ (MNLColor *_Nullable)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black;
+ (MNLColor *_Nonnull)colorWithCGColor:(CGColorRef _Nonnull)cgColor;

@property (nonatomic, readonly, nonnull) CGColorRef CGColor;
@property (nonatomic, readonly) BOOL isMonochrome;
@property (nonatomic, readonly) BOOL isRGB;
@property (nonatomic, readonly) BOOL isCMYK;

- (instancetype _Nonnull)init;
- (instancetype _Nullable)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithWhite:(CGFloat)white;
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_NAME(init(white:alpha:colorSpace:));
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_NAME(init(white:colorSpace:));
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha NS_SWIFT_NAME(init(white:alpha:));
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white NS_SWIFT_NAME(init(white:));
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_NAME(init(red:blue:green:alpha:colorSpace:));
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_NAME(init(red:blue:green:colorSpace:));
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha NS_SWIFT_NAME(init(red:blue:green:alpha:));
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue NS_SWIFT_NAME(init(red:blue:green:));
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black;
- (instancetype _Nullable)initWithColorSpace:(MNLColorSpace)colorSpace, ...;
- (instancetype _Nonnull)initWithCGColor:(CGColorRef _Nonnull)cgColor;
- (BOOL)monochromeColorComponents:(MNLMonochromeColorComponents *_Nonnull)components;
- (BOOL)RGBColorComponents:(MNLRGBColorComponents *_Nonnull)components;
- (BOOL)CMYKColorComponents:(MNLCMYKColorComponents *_Nonnull)components;

@end


#pragma mark -

#import <CoreImage/CIColor.h>

@interface MNLColor (CIColor)

+ (MNLColor *_Nonnull)colorWithCIColor:(CIColor *_Nonnull)ciColor;

@property (nonatomic, readonly, nonnull) CIColor *CIColor;

- (instancetype _Nonnull)initWithCIColor:(CIColor *_Nonnull)ciColor;

@end


#if TARGET_OS_IPHONE  // TARGET_OS_IOS | TARGET_OS_TV | TARGET_OS_WATCH

#pragma mark -

#import <UIKit/UIColor.h>

@interface MNLColor (UIColor)

+ (MNLColor *_Nonnull)colorWithUIColor:(UIColor *_Nonnull)uiColor;

@property (nonatomic, readonly, nonnull) UIColor *UIColor;

- (instancetype _Nonnull)initWithUIColor:(UIColor *_Nonnull)uiColor;

@end

#endif


#if TARGET_OS_OSX

#pragma mark -

#import <AppKit/NSColor.h>

@interface MNLColor (NSColor)

+ (MNLColor *_Nonnull)colorWithNSColor:(NSColor *_Nonnull)nsColor;

@property (nonatomic, readonly, nonnull) NSColor *NSColor;

- (instancetype _Nonnull)initWithNSColor:(NSColor *_Nonnull)nsColor;

@end

#endif


#pragma mark -

/// @brief
///  An abstract class for color palettes.
/// @details
///  You can instantinate this class to get dynamic color palette.
@interface MNLColorPalette : NSObject <NSCopying, NSMutableCopying, NSFastEnumeration, NSSecureCoding>

@property (copy, readonly, nonnull) NSArray<NSString *> *allKeys;
@property (copy, readonly, nonnull) NSArray<MNLColor *> *allColors;

- (instancetype _Nonnull)initWithColorPalette:(MNLColorPalette *_Nonnull)colorPalette;
- (instancetype _Nonnull)initWithDictionary:(NSDictionary<NSString *, MNLColor *> *_Nonnull)colorTable;
- (MNLColor *_Nullable)colorForKey:(NSString *_Nonnull)key;

@end


#pragma mark -

/// @brief
///  A color palette for 8 real colors.
/// @note
///  Every colors are in SRGB color space.
@interface MNL3BitColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *blackColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *redColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *magentaColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *cyanColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *whiteColor;

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on iOS Human Interface
///  Guideline.
/// @note
///  Every colors are in SRGB color space.
@interface MNLIOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *redColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *orangeColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *tealBlueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *purpleColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *pinkColor;

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on macOS Human Interface
///  Guideline.
/// @note
///  Every colors are in SRGB color space.
@interface MNLMacOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *brownColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *grayColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *orangeColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *pinkColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *purpleColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *redColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor;

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on watchOS Human Interface
///  Guideline.
/// @note
///  Every colors are in SRGB color space.
@interface MNLWatchOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *pinkColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *redColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *orangeColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *seafoamColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *lightBlueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *purpleColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *whiteColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedPinkColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedRedColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedOrangeColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedYellowColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedGreenColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedSeafoamColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedLightBlueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedBlueColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedPurpleColor;
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedWhiteColor;

@end


#pragma mark -

/// @brief
///  A mutable class to build dynamic color palettes.
/// @details
///  You can instantinate this class to get dynamic color palette.
@interface MNLMutableColorPalette : MNLColorPalette

- (void)setColor:(MNLColor *_Nonnull)color forKey:(NSString *_Nonnull)key;
- (void)removeColorForKey:(NSString *_Nonnull)key;
- (void)removeAllColors;

@end


#pragma mark -

/// Framework version number for MNLColor.
FOUNDATION_EXPORT double MNLColorVersionNumber;

/// Framework version string for MNLColor.
FOUNDATION_EXPORT const unsigned char MNLColorVersionString[];
