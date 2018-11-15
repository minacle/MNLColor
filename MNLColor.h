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
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_UNAVAILABLE("Use init(white:alpha:colorSpace:) instead.");
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_UNAVAILABLE("Use init(white:colorSpace:) instead.");
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha NS_SWIFT_UNAVAILABLE("Use init(white:alpha:) instead.");
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white NS_SWIFT_UNAVAILABLE("Use init(white:) instead.");
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_UNAVAILABLE("Use init(red:green:blue:alpha:colorSpace:) instead.");
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace NS_SWIFT_UNAVAILABLE("Use init(red:green:blue:colorSpace:) instead.");
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha NS_SWIFT_UNAVAILABLE("Use init(red:green:blue:alpha:) instead.");
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue NS_SWIFT_UNAVAILABLE("Use init(red:green:blue:) instead.");
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black;
- (instancetype _Nullable)initWithColorSpace:(MNLColorSpace)colorSpace, ...;
- (instancetype _Nonnull)initWithCGColor:(CGColorRef _Nonnull)cgColor;
- (BOOL)monochromeColorComponents:(MNLMonochromeColorComponents *_Nonnull)components;
- (BOOL)RGBColorComponents:(MNLRGBColorComponents *_Nonnull)components;
- (BOOL)CMYKColorComponents:(MNLCMYKColorComponents *_Nonnull)components;
- (instancetype _Nonnull)colorWithAlpha:(CGFloat)alpha;

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
///  Every colors are in sRGB color space.
@interface MNL3BitColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *blackColor NS_SWIFT_NAME(black);
@property (class, nonatomic, readonly, nonnull) MNLColor *redColor NS_SWIFT_NAME(red);
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor NS_SWIFT_NAME(green);
@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor NS_SWIFT_NAME(blue);
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor NS_SWIFT_NAME(yellow);
@property (class, nonatomic, readonly, nonnull) MNLColor *magentaColor NS_SWIFT_NAME(magenta);
@property (class, nonatomic, readonly, nonnull) MNLColor *cyanColor NS_SWIFT_NAME(cyan);
@property (class, nonatomic, readonly, nonnull) MNLColor *whiteColor NS_SWIFT_NAME(white);

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on iOS Human Interface
///  Guideline.
/// @note
///  Every colors are in sRGB color space.
@interface MNLIOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *redColor NS_SWIFT_NAME(red);
@property (class, nonatomic, readonly, nonnull) MNLColor *orangeColor NS_SWIFT_NAME(orange);
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor NS_SWIFT_NAME(yellow);
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor NS_SWIFT_NAME(green);
@property (class, nonatomic, readonly, nonnull) MNLColor *tealBlueColor NS_SWIFT_NAME(tealBlue);
@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor NS_SWIFT_NAME(blue);
@property (class, nonatomic, readonly, nonnull) MNLColor *purpleColor NS_SWIFT_NAME(purple);
@property (class, nonatomic, readonly, nonnull) MNLColor *pinkColor NS_SWIFT_NAME(pink);

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on macOS Human Interface
///  Guideline.
/// @note
///  Every colors are in sRGB color space.
@interface MNLMacOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor NS_SWIFT_NAME(blue);
@property (class, nonatomic, readonly, nonnull) MNLColor *brownColor NS_SWIFT_NAME(brown);
@property (class, nonatomic, readonly, nonnull) MNLColor *grayColor NS_SWIFT_NAME(gray);
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor NS_SWIFT_NAME(green);
@property (class, nonatomic, readonly, nonnull) MNLColor *orangeColor NS_SWIFT_NAME(orange);
@property (class, nonatomic, readonly, nonnull) MNLColor *pinkColor NS_SWIFT_NAME(pink);
@property (class, nonatomic, readonly, nonnull) MNLColor *purpleColor NS_SWIFT_NAME(purple);
@property (class, nonatomic, readonly, nonnull) MNLColor *redColor NS_SWIFT_NAME(red);
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor NS_SWIFT_NAME(yellow);

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on watchOS Human Interface
///  Guideline.
/// @note
///  Every colors are in sRGB color space.
@interface MNLWatchOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull) MNLColor *pinkColor NS_SWIFT_NAME(pink);
@property (class, nonatomic, readonly, nonnull) MNLColor *redColor NS_SWIFT_NAME(red);
@property (class, nonatomic, readonly, nonnull) MNLColor *orangeColor NS_SWIFT_NAME(orange);
@property (class, nonatomic, readonly, nonnull) MNLColor *yellowColor NS_SWIFT_NAME(yellow);
@property (class, nonatomic, readonly, nonnull) MNLColor *greenColor NS_SWIFT_NAME(green);
@property (class, nonatomic, readonly, nonnull) MNLColor *seafoamColor NS_SWIFT_NAME(seafoam);
@property (class, nonatomic, readonly, nonnull) MNLColor *lightBlueColor NS_SWIFT_NAME(lightBlue);
@property (class, nonatomic, readonly, nonnull) MNLColor *blueColor NS_SWIFT_NAME(blue);
@property (class, nonatomic, readonly, nonnull) MNLColor *purpleColor NS_SWIFT_NAME(purple);
@property (class, nonatomic, readonly, nonnull) MNLColor *whiteColor NS_SWIFT_NAME(white);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedPinkColor NS_SWIFT_NAME(mutedPink);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedRedColor NS_SWIFT_NAME(mutedRed);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedOrangeColor NS_SWIFT_NAME(mutedOrange);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedYellowColor NS_SWIFT_NAME(mutedYellow);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedGreenColor NS_SWIFT_NAME(mutedGreen);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedSeafoamColor NS_SWIFT_NAME(mutedSeafoam);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedLightBlueColor NS_SWIFT_NAME(mutedLightBlue);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedBlueColor NS_SWIFT_NAME(mutedBlue);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedPurpleColor NS_SWIFT_NAME(mutedPurple);
@property (class, nonatomic, readonly, nonnull) MNLColor *mutedWhiteColor NS_SWIFT_NAME(mutedWhite);

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
