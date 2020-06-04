extension MNLColor {

    @nonobjc
    public var monochromeComponents: MNLMonochromeColorComponents? {
        var components = MNLMonochromeColorComponents()
        self.__getMonochromeColorComponents(&components)
        if components.white.isNaN || components.alpha.isNaN {
            return nil
        }
        return components
    }

    @nonobjc
    public var rgbComponents: MNLRGBColorComponents? {
        var components = MNLRGBColorComponents()
        self.__getRGBColorComponents(&components)
        if components.red.isNaN || components.green.isNaN || components.blue.isNaN || components.alpha.isNaN {
            return nil
        }
        return components
    }

    @nonobjc
    public var cmykComponents: MNLCMYKColorComponents? {
        var components = MNLCMYKColorComponents()
        self.__getCMYKColorComponents(&components)
        if components.cyan.isNaN || components.magenta.isNaN || components.yellow.isNaN || components.black.isNaN || components.alpha.isNaN {
            return nil
        }
        return components
    }

    @nonobjc
    public var components: [CGFloat] {
        var components = [CGFloat].init(repeating: .nan, count: Int(self.numberOfComponents))
        self.__getComponents(&components)
        return components
    }

    @nonobjc
    public convenience init?
        <Integer>
        (white: Integer,
         alpha: CGFloat,
         colorSpace: MNLColorSpace)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalWhite: Int(white), alpha: alpha, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?
        <Integer>
        (white: Integer,
         colorSpace: MNLColorSpace)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalWhite: Int(white), colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?
        <Integer>
        (white: Integer,
         alpha: CGFloat)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalWhite: Int(white), alpha: alpha)
    }

    @nonobjc
    public convenience init?
        <Integer>
        (white: Integer)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalWhite: Int(white))
    }

    @nonobjc
    public convenience init?
        <Integer>
        (red: Integer,
         green: Integer,
         blue: Integer,
         alpha: CGFloat,
         colorSpace: MNLColorSpace)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalRed: Int(red), green: Int(green), blue: Int(blue), alpha: alpha, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?
        <Integer>
        (red: Integer,
         green: Integer,
         blue: Integer,
         colorSpace: MNLColorSpace)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalRed: Int(red), green: Int(green), blue: Int(blue), colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?
        <Integer>
        (red: Integer,
         green: Integer,
         blue: Integer,
         alpha: CGFloat)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalRed: Int(red), green: Int(green), blue: Int(blue), alpha: alpha)
    }

    @nonobjc
    public convenience init?
        <Integer>
        (red: Integer,
         green: Integer,
         blue: Integer)
        where Integer: BinaryInteger
    {
        self.init(__hexadecimalRed: Int(red), green: Int(green), blue: Int(blue))
    }
}
