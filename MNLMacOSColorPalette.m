#import "MNLColorInternal.h"

/// @brief
///  A private variable for Blue colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(27, 173, 248)
static MNLColor *MNLMacOSBlueColor;

/// @brief
///  A private variable for Brown colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(162, 132, 94)
static MNLColor *MNLMacOSBrownColor;

/// @brief
///  A private variable for Gray colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(142, 142, 145)
static MNLColor *MNLMacOSGrayColor;

/// @brief
///  A private variable for Green colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(99, 218, 56)
static MNLColor *MNLMacOSGreenColor;

/// @brief
///  A private variable for Orange colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 149, 0)
static MNLColor *MNLMacOSOrangeColor;

/// @brief
///  A private variable for Pink colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 41, 104)
static MNLColor *MNLMacOSPinkColor;

/// @brief
///  A private variable for Purple colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(204, 115, 225)
static MNLColor *MNLMacOSPurpleColor;

/// @brief
///  A private variable for Red colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 59, 48)
static MNLColor *MNLMacOSRedColor;

/// @brief
///  A private variable for Yellow colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 204, 0)
static MNLColor *MNLMacOSYellowColor;


@implementation MNLMacOSColorPalette

+ (MNLColor *)blueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:27 green:173 blue:248 colorSpace:MNLColorSpaceSRGB], MNLMacOSBlueColor);
}

+ (MNLColor *)brownColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:162 green:132 blue:94 colorSpace:MNLColorSpaceSRGB], MNLMacOSBlueColor);
}

+ (MNLColor *)grayColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:142 green:142 blue:145 colorSpace:MNLColorSpaceSRGB], MNLMacOSGrayColor);
}

+ (MNLColor *)greenColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:99 green:218 blue:56 colorSpace:MNLColorSpaceSRGB], MNLMacOSGreenColor);
}

+ (MNLColor *)orangeColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:149 blue:0 colorSpace:MNLColorSpaceSRGB], MNLMacOSOrangeColor);
}

+ (MNLColor *)pinkColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:41 blue:104 colorSpace:MNLColorSpaceSRGB], MNLMacOSPinkColor);
}

+ (MNLColor *)purpleColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:204 green:115 blue:225 colorSpace:MNLColorSpaceSRGB], MNLMacOSPurpleColor);
}

+ (MNLColor *)redColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:59 blue:48 colorSpace:MNLColorSpaceSRGB], MNLMacOSRedColor);
}

+ (MNLColor *)yellowColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:204 blue:0 colorSpace:MNLColorSpaceSRGB], MNLMacOSYellowColor);
}

@end
