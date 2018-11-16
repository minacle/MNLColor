extension MNLColor {

    @nonobjc
    public convenience init?<Integer>(white: Integer, alpha: CGFloat, colorSpace: MNLColorSpace) where Integer: BinaryInteger {
        self.init(white: CGFloat(white) / 255, alpha: alpha, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?<Integer>(white: Integer, colorSpace: MNLColorSpace) where Integer: BinaryInteger {
        self.init(white: CGFloat(white) / 255, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?<Integer>(white: Integer, alpha: CGFloat) where Integer: BinaryInteger {
        self.init(white: CGFloat(white) / 255, alpha: alpha)
    }

    @nonobjc
    public convenience init?<Integer>(white: Integer) where Integer: BinaryInteger {
        self.init(white: CGFloat(white) / 255)
    }

    @nonobjc
    public convenience init?<Integer>(red: Integer, green: Integer, blue: Integer, alpha: CGFloat, colorSpace: MNLColorSpace) where Integer: BinaryInteger {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?<Integer>(red: Integer, green: Integer, blue: Integer, colorSpace: MNLColorSpace) where Integer: BinaryInteger {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?<Integer>(red: Integer, green: Integer, blue: Integer, alpha: CGFloat) where Integer: BinaryInteger {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }

    @nonobjc
    public convenience init?<Integer>(red: Integer, green: Integer, blue: Integer) where Integer: BinaryInteger {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255)
    }
}
