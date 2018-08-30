#import <Foundation/Foundation.h>
#include <CoreGraphics/CGColor.h>

typedef NS_ENUM(NSInteger, MNLColorSpace) {
    // 10.0
    MNLColorSpaceDeviceGray = NSIntegerMin,
    MNLColorSpaceDeviceRGB,
    MNLColorSpaceDeviceCMYK,
    //
    MNLColorSpaceUnknown = -1,
    // 10.4
    MNLColorSpaceGenericGray,
    MNLColorSpaceGenericRGB,
    MNLColorSpaceGenericCMYK,
    // 10.5
    MNLColorSpaceGenericRGBLinear,
    MNLColorSpaceAdobeRGB1998,
    MNLColorSpaceSRGB,
    // 10.6
    MNLColorSpaceGenericGrayGamma2_2,
    // 10.11
    MNLColorSpaceGenericXYZ,
    MNLColorSpaceACESCGLinear,
    MNLColorSpaceITUR_709,
    MNLColorSpaceITUR_2020,
    MNLColorSpaceROMMRGB,
    MNLColorSpaceDCIP3,
    // 10.11.2
    MNLColorSpaceDisplayP3,
    // 10.12
    MNLColorSpaceLinearGray,
    MNLColorSpaceExtendedSRGB,
    MNLColorSpaceLinearSRGB,
    MNLColorSpaceExtendedLinearSRGB,
    MNLColorSpaceExtendedGray,
    MNLColorSpaceExtendedLinearGray,
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

- (instancetype _Nullable)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithWhite:(CGFloat)white colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithWhite:(CGFloat)white;
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithHexadecimalWhite:(NSInteger)white;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithHexadecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black colorSpace:(MNLColorSpace)colorSpace;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;
- (instancetype _Nullable)initWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black;
- (instancetype _Nullable)initWithColorSpace:(MNLColorSpace)colorSpace, ...;
- (instancetype _Nonnull)initWithCGColor:(CGColorRef _Nonnull)cgColor;
- (BOOL)monochromeColorComponents:(MNLMonochromeColorComponents *)components;
- (BOOL)RGBColorComponents:(MNLRGBColorComponents *)components;
- (BOOL)CMYKColorComponents:(MNLCMYKColorComponents *)components;

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
