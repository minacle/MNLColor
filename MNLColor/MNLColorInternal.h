#import "MNLColor.h"


#define MNLReturnSingletonColor(COLOR, CONST) do {if (!CONST) CONST = COLOR; return CONST;} while (0)
