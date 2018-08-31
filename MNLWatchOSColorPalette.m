#import "MNLColorInternal.h"

/// @brief
///  A private variable for Pink colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(250, 17, 79)
static MNLColor *MNLWatchOSPinkColor;

/// @brief
///  A private variable for Red colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 59, 48)
static MNLColor *MNLWatchOSRedColor;

/// @brief
///  A private variable for Orange colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 149, 0)
static MNLColor *MNLWatchOSOrangeColor;

/// @brief
///  A private variable for Yellow colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 230, 32)
static MNLColor *MNLWatchOSYellowColor;

/// @brief
///  A private variable for Green colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(4, 222, 113)
static MNLColor *MNLWatchOSGreenColor;

/// @brief
///  A private variable for Seafoam colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 245, 234)
static MNLColor *MNLWatchOSSeafoamColor;

/// @brief
///  A private variable for Light Blue colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(90, 200, 250)
static MNLColor *MNLWatchOSLightBlueColor;

/// @brief
///  A private variable for Blue colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(32, 148, 250)
static MNLColor *MNLWatchOSBlueColor;

/// @brief
///  A private variable for Purple colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(120, 122, 255)
static MNLColor *MNLWatchOSPurpleColor;

/// @brief
///  A private variable for White colour.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(242, 244, 255)
static MNLColor *MNLWatchOSWhiteColor;

/// @brief
///  A private variable for Pink colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(250, 17, 79) 17%
static MNLColor *MNLWatchOSMutedPinkColor;

/// @brief
///  A private variable for Red colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 59, 48) 17%
static MNLColor *MNLWatchOSMutedRedColor;

/// @brief
///  A private variable for Orange colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 149, 0) 15%
static MNLColor *MNLWatchOSMutedOrangeColor;

/// @brief
///  A private variable for Yellow colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(255, 230, 32) 14%
static MNLColor *MNLWatchOSMutedYellowColor;

/// @brief
///  A private variable for Green colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(4, 222, 113) 14%
static MNLColor *MNLWatchOSMutedGreenColor;

/// @brief
///  A private variable for Seafoam colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(0, 245, 234) 15%
static MNLColor *MNLWatchOSMutedSeafoamColor;

/// @brief
///  A private variable for Light Blue colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(90, 200, 250) 15%
static MNLColor *MNLWatchOSMutedLightBlueColor;

/// @brief
///  A private variable for Blue colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(32, 148, 250) 17%
static MNLColor *MNLWatchOSMutedBlueColor;

/// @brief
///  A private variable for Purple colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(120, 122, 255) 20%
static MNLColor *MNLWatchOSMutedPurpleColor;

/// @brief
///  A private variable for White colour with opacity.
/// @details
///  This variable is for implement a singleton.
/// @note
///  rgb(242, 244, 255) 14%
static MNLColor *MNLWatchOSMutedWhiteColor;


@implementation MNLWatchOSColorPalette

+ (MNLColor *)pinkColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:250 green:17 blue:79 colorSpace:MNLColorSpaceSRGB], MNLWatchOSPinkColor);
}

+ (MNLColor *)redColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:59 blue:48 colorSpace:MNLColorSpaceSRGB], MNLWatchOSRedColor);
}

+ (MNLColor *)orangeColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:149 blue:0 colorSpace:MNLColorSpaceSRGB], MNLWatchOSOrangeColor);
}

+ (MNLColor *)yellowColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:230 blue:32 colorSpace:MNLColorSpaceSRGB], MNLWatchOSYellowColor);
}

+ (MNLColor *)greenColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:4 green:222 blue:113 colorSpace:MNLColorSpaceSRGB], MNLWatchOSGreenColor);
}

+ (MNLColor *)seafoamColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:0 green:245 blue:234 colorSpace:MNLColorSpaceSRGB], MNLWatchOSSeafoamColor);
}

+ (MNLColor *)lightBlueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:90 green:200 blue:250 colorSpace:MNLColorSpaceSRGB], MNLWatchOSLightBlueColor);
}

+ (MNLColor *)blueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:32 green:148 blue:250 colorSpace:MNLColorSpaceSRGB], MNLWatchOSBlueColor);
}

+ (MNLColor *)purpleColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:120 green:122 blue:255 colorSpace:MNLColorSpaceSRGB], MNLWatchOSPurpleColor);
}

+ (MNLColor *)whiteColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:242 green:244 blue:255 colorSpace:MNLColorSpaceSRGB], MNLWatchOSWhiteColor);
}

+ (MNLColor *)mutedPinkColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:250 green:17 blue:79 alpha:.17 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedPinkColor);
}

+ (MNLColor *)mutedRedColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:59 blue:48 alpha:.17 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedRedColor);
}

+ (MNLColor *)mutedOrangeColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:149 blue:0 alpha:.15 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedOrangeColor);
}

+ (MNLColor *)mutedYellowColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:255 green:230 blue:32 alpha:.14 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedYellowColor);
}

+ (MNLColor *)mutedGreenColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:4 green:222 blue:113 alpha:.14 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedGreenColor);
}

+ (MNLColor *)mutedSeafoamColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:0 green:245 blue:234 alpha:.15 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedSeafoamColor);
}

+ (MNLColor *)mutedLightBlueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:90 green:200 blue:250 alpha:.15 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedLightBlueColor);
}

+ (MNLColor *)mutedBlueColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:32 green:148 blue:250 alpha:.17 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedBlueColor);
}

+ (MNLColor *)mutedPurpleColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:120 green:122 blue:255 alpha:.2 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedPurpleColor);
}

+ (MNLColor *)mutedWhiteColor {
    MNLReturnSingletonColor([[MNLColor alloc] initWithHexadecimalRed:242 green:244 blue:255 alpha:.14 colorSpace:MNLColorSpaceSRGB], MNLWatchOSMutedWhiteColor);
}

@end
