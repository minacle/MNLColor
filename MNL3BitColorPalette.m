#import "MNLColorInternal.h"

/// @brief
///  A private variable for Black colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 0, 0)
static MNLColor *MNL3BitBlackColor;

/// @brief
///  A private variable for Red colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 0, 0)
static MNLColor *MNL3BitRedColor;

/// @brief
///  A private variable for Green colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 255, 0)
static MNLColor *MNL3BitGreenColor;

/// @brief
///  A private variable for Blue colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 0, 255)
static MNLColor *MNL3BitBlueColor;

/// @brief
///  A private variable for Yellow colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 255, 0)
static MNLColor *MNL3BitYellowColor;

/// @brief
///  A private variable for Magenta colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 0, 255)
static MNLColor *MNL3BitMagentaColor;

/// @brief
///  A private variable for Cyan colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 255, 255)
static MNLColor *MNL3BitCyanColor;

/// @brief
///  A private variable for White colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 255, 255)
static MNLColor *MNL3BitWhiteColor;


@implementation MNL3BitColorPalette

+ (MNLColor *)blackColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:0 green:0 blue:0 colorSpace:MNLColorSpaceSRGB], MNL3BitBlackColor);
}

+ (MNLColor *)redColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:1 green:0 blue:0 colorSpace:MNLColorSpaceSRGB], MNL3BitRedColor);
}

+ (MNLColor *)greenColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:0 green:1 blue:0 colorSpace:MNLColorSpaceSRGB], MNL3BitGreenColor);
}

+ (MNLColor *)blueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:0 green:0 blue:1 colorSpace:MNLColorSpaceSRGB], MNL3BitBlueColor);
}

+ (MNLColor *)yellowColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:1 green:1 blue:0 colorSpace:MNLColorSpaceSRGB], MNL3BitYellowColor);
}

+ (MNLColor *)magentaColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:1 green:0 blue:1 colorSpace:MNLColorSpaceSRGB], MNL3BitMagentaColor);
}

+ (MNLColor *)cyanColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:0 green:1 blue:1 colorSpace:MNLColorSpaceSRGB], MNL3BitCyanColor);
}

+ (MNLColor *)whiteColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithRed:1 green:1 blue:1 colorSpace:MNLColorSpaceSRGB], MNL3BitWhiteColor);
}

@end
