extension MNLColor {

    @nonobjc
    public convenience init?(white: Int, alpha: CGFloat, colorSpace: MNLColorSpace) {
        self.init(white: CGFloat(white) / 255, alpha: alpha, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?(white: Int, colorSpace: MNLColorSpace) {
        self.init(white: CGFloat(white) / 255, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?(white: Int, alpha: CGFloat) {
        self.init(white: CGFloat(white) / 255, alpha: alpha)
    }

    @nonobjc
    public convenience init?(white: Int) {
        self.init(white: CGFloat(white) / 255)
    }

    @nonobjc
    public convenience init?(red: Int, green: Int, blue: Int, alpha: CGFloat, colorSpace: MNLColorSpace) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?(red: Int, green: Int, blue: Int, colorSpace: MNLColorSpace) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, colorSpace: colorSpace)
    }

    @nonobjc
    public convenience init?(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }

    @nonobjc
    public convenience init?(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255)
    }
}
