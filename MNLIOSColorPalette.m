#import "MNLColorInternal.h"

/// @brief
///  A private variable for Red colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 59, 48)
static MNLColor *MNLIOSRedColor;

/// @brief
///  A private variable for Orange colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 149, 0)
static MNLColor *MNLIOSOrangeColor;

/// @brief
///  A private variable for Yellow colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 204, 0)
static MNLColor *MNLIOSYellowColor;

/// @brief
///  A private variable for Green colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(76, 217, 100)
static MNLColor *MNLIOSGreenColor;

/// @brief
///  A private variable for Teal Blue colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(90, 200, 250)
static MNLColor *MNLIOSTealBlueColor;

/// @brief
///  A private variable for Blue colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 122, 255)
static MNLColor *MNLIOSBlueColor;

/// @brief
///  A private variable for Purple colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(88, 86, 214)
static MNLColor *MNLIOSPurpleColor;

/// @brief
///  A private variable for Pink colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 45, 85)
static MNLColor *MNLIOSPinkColor;


@implementation MNLIOSColorPalette

+ (MNLColor *)redColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:59 blue:48 colorSpace:MNLColorSpaceSRGB], MNLIOSRedColor);
}

+ (MNLColor *)orangeColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:149 blue:0 colorSpace:MNLColorSpaceSRGB], MNLIOSOrangeColor);
}

+ (MNLColor *)yellowColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:204 blue:0 colorSpace:MNLColorSpaceSRGB], MNLIOSYellowColor);
}

+ (MNLColor *)greenColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:76 green:217 blue:100 colorSpace:MNLColorSpaceSRGB], MNLIOSGreenColor);
}

+ (MNLColor *)tealBlueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:90 green:200 blue:250 colorSpace:MNLColorSpaceSRGB], MNLIOSTealBlueColor);
}

+ (MNLColor *)blueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:0 green:122 blue:255 colorSpace:MNLColorSpaceSRGB], MNLIOSBlueColor);
}

+ (MNLColor *)purpleColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:88 green:86 blue:214 colorSpace:MNLColorSpaceSRGB], MNLIOSPurpleColor);
}

+ (MNLColor *)pinkColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:45 blue:85 colorSpace:MNLColorSpaceSRGB], MNLIOSPinkColor);
}

@end
