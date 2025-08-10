//
//  WeatherButton.swift
//  WeatherClone
//
//  Created by Vinayak Srivastava on 24/06/25.
//
import SwiftUI

struct ButtonTextView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 300, height: 45)
            .font(.system(size: 20, weight: .bold, design: .default))
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

struct WeatherButton_Preview: PreviewProvider {
    static var previews: some View {
        ButtonTextView(
            title: "Hello",
            textColor: .white,
            backgroundColor: .blue
        )
    }
}
