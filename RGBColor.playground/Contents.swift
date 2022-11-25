import SwiftUI

struct RGBColor {
    var red: Int
    var green: Int
    var blue: Int
    
    func asColor() -> Color {
        Color(
            red: Double(self.red) / 255,
            green: Double(self.green) / 255,
            blue: Double(self.blue) / 255
        )
    }
}
