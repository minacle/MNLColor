#import <Foundation/Foundation.h>
#include <CoreGraphics/CGColor.h>


#ifdef __MNLCOLOR_API_REPLACEMENT
#undef __MNLCOLOR_API_REPLACEMENT
#endif
#define __MNLCOLOR_API_REPLACEMENT(rep) __attribute__((availability(macos, deprecated=10.0, replacement=#rep))) __attribute__((availability(ios, deprecated=2.0, replacement=#rep))) __attribute__((availability(watchos, deprecated=2.0, replacement=#rep))) __attribute__((availability(tvos, deprecated=9.0, replacement=#rep))) __attribute__((availability(macCatalyst, deprecated=13.0, replacement=#rep)))


/// @brief
///  A profile that specifies how to interpret a color value for display.
typedef NS_CLOSED_ENUM(NSInteger, MNLColorSpace) {

    // 10.0 ////////////////////////////////////////////////////////////////

    /// @brief
    ///  A device-dependent gray color space.
    MNLColorSpaceDeviceGray NS_SWIFT_NAME(deviceGray) = NSIntegerMin,

    /// @brief
    ///  A device-dependent RGB color space.
    MNLColorSpaceDeviceRGB NS_SWIFT_NAME(deviceRGB),

    /// @brief
    ///  A device-dependent CMYK color space.
    MNLColorSpaceDeviceCMYK NS_SWIFT_NAME(deviceCMYK),

    // * ///////////////////////////////////////////////////////////////////

    /// @brief
    ///  An unknown color space.
    MNLColorSpaceUnknown NS_SWIFT_NAME(unknown) = ~0,

    // 10.4 ////////////////////////////////////////////////////////////////

    /// @brief
    ///  The generic gray color space.
    MNLColorSpaceGenericGray NS_SWIFT_NAME(gray),

    /// @brief
    ///  The generic RGB color space.
    MNLColorSpaceGenericRGB NS_SWIFT_NAME(rgb),

    /// @brief
    ///  The generic CMYK color space.
    MNLColorSpaceGenericCMYK NS_SWIFT_NAME(cmyk),

    // 10.5 ////////////////////////////////////////////////////////////////

    /// @brief
    ///  The generic RGB color space with a linear transfer function.
    MNLColorSpaceGenericRGBLinear NS_SWIFT_NAME(rgbLinear),

    /// @brief
    ///  The Adobe RGB (1998) color space.
    MNLColorSpaceAdobeRGB1998 NS_SWIFT_NAME(adobeRGB),

    /// @brief
    ///  The standard Red Green Blue (sRGB) color space.
    MNLColorSpaceSRGB NS_SWIFT_NAME(sRGB),

    // 10.6 ////////////////////////////////////////////////////////////////

    /// @brief
    ///  The generic gray color space that has an exponential transfer
    ///  function with a power of 2.2.
    MNLColorSpaceGenericGrayGamma2_2 NS_SWIFT_NAME(genericGrayGamma22),

    // 10.11 ///////////////////////////////////////////////////////////////

    /// @brief
    ///  The XYZ color space, as defined by the CIE 1931 standard.
    MNLColorSpaceGenericXYZ NS_SWIFT_NAME(genericXYZ),

    /// @brief
    ///  The ACEScg color space.
    MNLColorSpaceACESCGLinear NS_SWIFT_NAME(asescgLinear),

    /// @brief
    ///  The recommendation of the International Telecommunication Union
    ///  (ITU) Radiocommunication sector for the BT.709 color space.
    MNLColorSpaceITUR_709 NS_SWIFT_NAME(itur709),

    /// @brief
    ///  The recommendation of the International Telecommunication Union
    ///  (ITU) Radiocommunication sector for the BT.2020 color space.
    MNLColorSpaceITUR_2020 NS_SWIFT_NAME(itur2020),

    /// @brief
    ///  The Reference Output Medium Metric (ROMM) RGB color space.
    MNLColorSpaceROMMRGB NS_SWIFT_NAME(rommRGB),

    /// @brief
    ///  The DCI P3 color space, which is the digital cinema standard.
    MNLColorSpaceDCIP3 NS_SWIFT_NAME(dciP3),

    // 10.11.2 /////////////////////////////////////////////////////////////

    /// @brief
    ///  The Display P3 color space, created by Apple.
    MNLColorSpaceDisplayP3 NS_SWIFT_NAME(displayP3),

    // 10.12 ///////////////////////////////////////////////////////////////

    /// @brief
    ///  The gray color space using a linear transfer function.
    MNLColorSpaceLinearGray NS_SWIFT_NAME(linearGray),

    /// @brief
    ///  The extended sRGB color space.
    MNLColorSpaceExtendedSRGB NS_SWIFT_NAME(extendedSRGB),

    /// @brief
    ///  The sRGB color space with a linear transfer function.
    MNLColorSpaceLinearSRGB NS_SWIFT_NAME(linearSRGB),

    /// @brief
    ///  The sRGB color space with a linear transfer function and
    ///  extended-range values.
    MNLColorSpaceExtendedLinearSRGB NS_SWIFT_NAME(extendedLinearSRGB),

    /// @brief
    ///  The extended gray color space.
    MNLColorSpaceExtendedGray NS_SWIFT_NAME(extendedGray),

    /// @brief
    ///  The extended gray color space with a linear transfer function.
    MNLColorSpaceExtendedLinearGray NS_SWIFT_NAME(extendedLinearGray),

    // 10.14.3 /////////////////////////////////////////////////////////////

    /// @brief
    ///  The Display P3 color space with a linear transfer function and
    ///  extended-range values.
    MNLColorSpaceExtendedLinearDisplayP3 NS_SWIFT_NAME(extendedLineaarDisplayP3),

    /// @brief
    ///  The recommendation of the International Telecommunication Union
    ///  (ITU) Radiocommunication sector for the BT.2020 color space,
    ///  with a linear transfer function and extended range values.
    MNLColorSpaceExtendedLinearITUR_2020 NS_SWIFT_NAME(extendedLinearITUR2020),

    // 10.14.6 /////////////////////////////////////////////////////////////

    /// @brief
    ///  The Display P3 color space, using the PQ transfer function.
    MNLColorSpaceDisplayP3_PQ_EOTF NS_SWIFT_NAME(displayP3PQEOTF) API_AVAILABLE(macCatalyst(13.0)) API_DEPRECATED("No longer supported", macos(10.14.6, 10.15.4), ios(13.0, 13.4), tvos(13.0, 13.4), watchos(6.0, 6.2)),

    /// @brief
    ///  The Display P3 color space, using the HLG transfer function.
    MNLColorSpaceDisplayP3_HLG NS_SWIFT_NAME(displayP3HLG),

    /// @brief
    ///  The recommendation of the International Telecommunication Union
    ///  (ITU) Radiocommunication sector for the BT.2020 color space,
    ///  with the PQ transfer function.
    MNLColorSpaceITUR_2020_PQ_EOTF NS_SWIFT_NAME(itur2020PQEOTF) API_AVAILABLE(macCatalyst(13.0)) API_DEPRECATED("No longer supported", macos(10.14.6, 10.15.4), ios(13.0, 13.4), tvos(13.0, 13.4), watchos(6.0, 6.2)),

    /// @brief
    ///  The recommendation of the International Telecommunication Union
    ///  (ITU) Radiocommunication sector for the BT.2020 color space,
    ///  with the HLG transfer function.
    MNLColorSpaceITUR_2020_HLG NS_SWIFT_NAME(itur2020HLG),
};


typedef NS_CLOSED_ENUM(NSInteger, MNLColorRenderingIntent) {

    MNLColorRenderingIntentDefault,
    MNLColorRenderingIntentAbsoluteColorimetric,
    MNLColorRenderingIntentRelativeColorimetric,
    MNLColorRenderingIntentPerceptual,
    MNLColorRenderingIntentSaturation,
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

@interface
 MNLColor : NSObject
 <NSCopying, NSSecureCoding>

@property (class, nonatomic)
 MNLColorSpace defaultMonochromeColorSpace;

@property (class, nonatomic)
 MNLColorSpace defaultRGBColorSpace;

@property (class, nonatomic)
 MNLColorSpace defaultCMYKColorSpace;

@property (class, nonatomic, readonly, nonnull)
 MNLColor *clearColor;

+ (instancetype _Nonnull)
  new
NS_UNAVAILABLE;

+ (MNLColor *_Nullable)
  colorWithWhite:(CGFloat)white
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace;

+ (MNLColor *_Nullable)
  colorWithWhite:(CGFloat)white
  colorSpace:(MNLColorSpace)colorSpace;

+ (MNLColor *_Nullable)
  colorWithWhite:(CGFloat)white
  alpha:(CGFloat)alpha;

+ (MNLColor *_Nullable)
  colorWithWhite:(CGFloat)white;

+ (MNLColor *_Nullable)
  colorWithHexadecimalWhite:(NSInteger)white
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithHexadecimalWhite:(NSInteger)white
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithHexadecimalWhite:(NSInteger)white
  alpha:(CGFloat)alpha
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithHexadecimalWhite:(NSInteger)white
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace;

+ (MNLColor *_Nullable)
  colorWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue
  colorSpace:(MNLColorSpace)colorSpace;

+ (MNLColor *_Nullable)
  colorWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue
  alpha:(CGFloat)alpha;

+ (MNLColor *_Nullable)
  colorWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue;

+ (MNLColor *_Nullable)
  colorWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
  alpha:(CGFloat)alpha
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
NS_REFINED_FOR_SWIFT;

+ (MNLColor *_Nullable)
  colorWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace;

+ (MNLColor *_Nullable)
  colorWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black
  colorSpace:(MNLColorSpace)colorSpace;

+ (MNLColor *_Nullable)
  colorWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black
  alpha:(CGFloat)alpha;

+ (MNLColor *_Nullable)
  colorWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black;

+ (MNLColor *_Nonnull)
  colorWithCGColor:(CGColorRef _Nonnull)cgColor;

+ (MNLColor *_Nonnull)
  colorWithColor:(MNLColor *_Nonnull)color;

@property (nonatomic, readonly, nonnull)
 CGColorRef CGColor;

@property (nonatomic, readonly)
 BOOL isMonochrome;

@property (nonatomic, readonly)
 BOOL isRGB;

@property (nonatomic, readonly)
 BOOL isCMYK;

@property (readonly)
 MNLColorSpace colorSpace;

@property (readonly)
 NSUInteger numberOfComponents;

- (instancetype _Nonnull)
  init
NS_UNAVAILABLE;

- (instancetype _Nullable)
  initWithWhite:(CGFloat)white
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace;

- (instancetype _Nullable)
  initWithWhite:(CGFloat)white
  colorSpace:(MNLColorSpace)colorSpace;

- (instancetype _Nullable)
  initWithWhite:(CGFloat)white
  alpha:(CGFloat)alpha;

- (instancetype _Nullable)
  initWithWhite:(CGFloat)white;

- (instancetype _Nullable)
  initWithHexadecimalWhite:(NSInteger)white
  alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithHexadecimalWhite:(NSInteger)white
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithHexadecimalWhite:(NSInteger)white
  alpha:(CGFloat)alpha
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithHexadecimalWhite:(NSInteger)white
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue
  alpha:(CGFloat)alpha colorSpace:(MNLColorSpace)colorSpace;

- (instancetype _Nullable)
  initWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue
  colorSpace:(MNLColorSpace)colorSpace;

- (instancetype _Nullable)
  initWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue
  alpha:(CGFloat)alpha;

- (instancetype _Nullable)
  initWithRed:(CGFloat)red
  green:(CGFloat)green
  blue:(CGFloat)blue;

- (instancetype _Nullable)
  initWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
  colorSpace:(MNLColorSpace)colorSpace
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
  alpha:(CGFloat)alpha
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithHexadecimalRed:(NSInteger)red
  green:(NSInteger)green
  blue:(NSInteger)blue
NS_REFINED_FOR_SWIFT;

- (instancetype _Nullable)
  initWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black
  alpha:(CGFloat)alpha
  colorSpace:(MNLColorSpace)colorSpace;

- (instancetype _Nullable)
  initWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black
  colorSpace:(MNLColorSpace)colorSpace;

- (instancetype _Nullable)
  initWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black
  alpha:(CGFloat)alpha;

- (instancetype _Nullable)
  initWithCyan:(CGFloat)cyan
  magenta:(CGFloat)magenta
  yellow:(CGFloat)yellow
  black:(CGFloat)black;

- (instancetype _Nullable)
  initWithColorSpace:(MNLColorSpace)colorSpace,
  ...;

- (instancetype _Nonnull)
  initWithCGColor:(CGColorRef _Nonnull)cgColor;

- (BOOL)
  monochromeColorComponents:(MNLMonochromeColorComponents *_Nonnull)components
__MNLCOLOR_API_REPLACEMENT(-getMonochromeColorComponents:);

- (BOOL)
  RGBColorComponents:(MNLRGBColorComponents *_Nonnull)components
__MNLCOLOR_API_REPLACEMENT(-getRGBColorComponents:);

- (BOOL)
  CMYKColorComponents:(MNLCMYKColorComponents *_Nonnull)components
__MNLCOLOR_API_REPLACEMENT(-getCMYKColorComponents:);

- (instancetype _Nonnull)
  colorWithAlpha:(CGFloat)alpha
NS_SWIFT_NAME(color(alpha:));

- (instancetype _Nullable)
  colorWithColorSpace:(MNLColorSpace)colorSpace
  renderingIntent:(MNLColorRenderingIntent)renderingIntent
NS_SWIFT_NAME(color(colorSpace:renderingIntent:));

- (void)
  getMonochromeColorComponents:(MNLMonochromeColorComponents *_Nonnull)components
NS_REFINED_FOR_SWIFT;

- (void)
  getRGBColorComponents:(MNLRGBColorComponents *_Nonnull)components
NS_REFINED_FOR_SWIFT;

- (void)
  getCMYKColorComponents:(MNLCMYKColorComponents *_Nonnull)components
NS_REFINED_FOR_SWIFT;

- (void)
  getColorComponents:(CGFloat *_Nonnull)components
NS_REFINED_FOR_SWIFT;

@end


#pragma mark -


#if !TARGET_OS_WATCH

#import <CoreImage/CIColor.h>

@interface
 MNLColor (CIColor)

+ (MNLColor *_Nonnull)
  colorWithCIColor:(CIColor *_Nonnull)ciColor;

@property (nonatomic, readonly, nonnull)
 CIColor *CIColor;

- (instancetype _Nonnull)
  initWithCIColor:(CIColor *_Nonnull)ciColor;

@end

#endif


#if TARGET_OS_IPHONE  // TARGET_OS_IOS | TARGET_OS_TV | TARGET_OS_WATCH

#pragma mark -

#import <UIKit/UIColor.h>

@interface
 MNLColor (UIColor)

+ (MNLColor *_Nonnull)
  colorWithUIColor:(UIColor *_Nonnull)uiColor;

@property (nonatomic, readonly, nonnull)
 UIColor *UIColor;

- (instancetype _Nonnull)
  initWithUIColor:(UIColor *_Nonnull)uiColor;

@end

#endif


#if TARGET_OS_OSX

#pragma mark -

#import <AppKit/NSColor.h>

@interface
 MNLColor (NSColor)

+ (MNLColor *_Nonnull)
  colorWithNSColor:(NSColor *_Nonnull)nsColor;

@property (nonatomic, readonly, nonnull)
 NSColor *NSColor;

- (instancetype _Nonnull)
  initWithNSColor:(NSColor *_Nonnull)nsColor;

@end

#endif


#pragma mark -

/// @brief
///  A class for color palettes.
/// @details
///  You can instantinate this class to get dynamic color palette.
@interface
 MNLColorPalette : NSObject
 <NSCopying, NSMutableCopying, NSFastEnumeration, NSSecureCoding>

@property (copy, readonly, nonnull)
 NSArray<NSString *> *allKeys;

@property (copy, readonly, nonnull)
 NSArray<MNLColor *> *allColors;

- (instancetype _Nonnull)
  initWithColorPalette:(MNLColorPalette *_Nonnull)colorPalette;

- (instancetype _Nonnull)
  initWithDictionary:(NSDictionary<NSString *, MNLColor *> *_Nonnull)colorTable;

- (MNLColor *_Nullable)
  colorForKey:(NSString *_Nonnull)key;

@end


#pragma mark -

/// @brief
///  A color palette for 8 real colors.
/// @note
///  Every colors are in sRGB color space.
@interface
 MNL3BitColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull)
 MNLColor *blackColor
NS_SWIFT_NAME(black);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *redColor
NS_SWIFT_NAME(red);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *greenColor
NS_SWIFT_NAME(green);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *blueColor
NS_SWIFT_NAME(blue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *yellowColor
NS_SWIFT_NAME(yellow);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *magentaColor
NS_SWIFT_NAME(magenta);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *cyanColor
NS_SWIFT_NAME(cyan);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *whiteColor
NS_SWIFT_NAME(white);

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on iOS Human Interface
///  Guideline.
/// @note
///  Every colors are in sRGB color space.
@interface
 MNLIOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull)
 MNLColor *redColor
NS_SWIFT_NAME(red);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *orangeColor
NS_SWIFT_NAME(orange);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *yellowColor
NS_SWIFT_NAME(yellow);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *greenColor
NS_SWIFT_NAME(green);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *tealBlueColor
NS_SWIFT_NAME(tealBlue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *blueColor
NS_SWIFT_NAME(blue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *purpleColor
NS_SWIFT_NAME(purple);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *pinkColor
NS_SWIFT_NAME(pink);

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on macOS Human Interface
///  Guideline.
/// @note
///  Every colors are in sRGB color space.
@interface
 MNLMacOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull)
 MNLColor *blueColor
NS_SWIFT_NAME(blue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *brownColor
NS_SWIFT_NAME(brown);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *grayColor
NS_SWIFT_NAME(gray);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *greenColor
NS_SWIFT_NAME(green);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *orangeColor
NS_SWIFT_NAME(orange);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *pinkColor
NS_SWIFT_NAME(pink);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *purpleColor
NS_SWIFT_NAME(purple);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *redColor
NS_SWIFT_NAME(red);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *yellowColor
NS_SWIFT_NAME(yellow);

@end


#pragma mark -

/// @brief
///  A color palette for colors which introduced on watchOS Human Interface
///  Guideline.
/// @note
///  Every colors are in sRGB color space.
@interface
 MNLWatchOSColorPalette : MNLColorPalette

@property (class, nonatomic, readonly, nonnull)
 MNLColor *pinkColor
NS_SWIFT_NAME(pink);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *redColor
NS_SWIFT_NAME(red);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *orangeColor
NS_SWIFT_NAME(orange);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *yellowColor
NS_SWIFT_NAME(yellow);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *greenColor
NS_SWIFT_NAME(green);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *seafoamColor
NS_SWIFT_NAME(seafoam);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *lightBlueColor
NS_SWIFT_NAME(lightBlue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *blueColor
NS_SWIFT_NAME(blue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *purpleColor
NS_SWIFT_NAME(purple);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *whiteColor
NS_SWIFT_NAME(white);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedPinkColor
NS_SWIFT_NAME(mutedPink);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedRedColor
NS_SWIFT_NAME(mutedRed);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedOrangeColor
NS_SWIFT_NAME(mutedOrange);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedYellowColor
NS_SWIFT_NAME(mutedYellow);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedGreenColor
NS_SWIFT_NAME(mutedGreen);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedSeafoamColor
NS_SWIFT_NAME(mutedSeafoam);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedLightBlueColor
NS_SWIFT_NAME(mutedLightBlue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedBlueColor
NS_SWIFT_NAME(mutedBlue);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedPurpleColor
NS_SWIFT_NAME(mutedPurple);

@property (class, nonatomic, readonly, nonnull)
 MNLColor *mutedWhiteColor
NS_SWIFT_NAME(mutedWhite);

@end


#pragma mark -

/// @brief
///  A mutable class to build dynamic color palettes.
/// @details
///  You can instantinate this class to get dynamic color palette.
@interface
 MNLMutableColorPalette : MNLColorPalette

- (void)
  setColor:(MNLColor *_Nonnull)color
  forKey:(NSString *_Nonnull)key;

- (void)
  removeColorForKey:(NSString *_Nonnull)key;

- (void)
  removeAllColors;

@end


#undef __MNLCOLOR_API_REPLACEMENT


#pragma mark -

/// Framework version number for MNLColor.
FOUNDATION_EXPORT double MNLColorVersionNumber;

/// Framework version string for MNLColor.
FOUNDATION_EXPORT const unsigned char MNLColorVersionString[];
