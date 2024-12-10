//
//  StatusesView.swift
//  BuzzCam App
//
//  Created by Responsive Environments on 10/20/23.
//

import SwiftUI
import Combine

struct ClassifierView: View {
    @State private var isExpanded = false
    @State private var deviceEnabled = true
    @EnvironmentObject var bluetoothModel: BluetoothModel
    @State private var cancellables: Set<AnyCancellable> = Set()
    
    let customFontTitle = Font.custom("Futura-Bold", size: 20) // Define a custom font
    let customFontText = Font.custom("AvenirNext-Regular", size: 18) // Define a custom font
    let customFontTextBold = Font.custom("AvenirNext-DemiBold", size: 23) // Define a custom font
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Spacer()
                Text("Classifier Info")
                    .font(customFontTitle)
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 5, x: 0, y: 2)
                    .padding()
                
                Image(systemName: "chevron.down.circle.fill")
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .shadow(color: .black, radius: 5, x: 0, y: 2)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(
                GeometryReader { proxy in
                        Image("flowers 6")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: proxy.size.height)
                            .clipped()
                            .opacity(0.7)
                            .allowsHitTesting(false) // Prevents the image from capturing taps
                            .contentShape(Rectangle()) // Set content shape to Rectangle to allow tap gesture
                    }
            )
                .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            if isExpanded {
                VStack (alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading) {
                        Text("Information")
                            .font(customFontTextBold)
                            .fontWeight(.bold)
                        VStack (alignment: .leading, spacing: 10){
                            Text("Model version: " + String(bluetoothModel.classifierPacketData?.classifier_version ?? 0))
                                .font(customFontText)
                            Text("Last detected: \(Date(timeIntervalSince1970: TimeInterval(bluetoothModel.classifierPacketData?.epoch_last_detection ?? 0)))")
                                .font(customFontText)
                        }
                        .padding()
                    }
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading)
                    .background(Color(white: 0.98))
                    .cornerRadius(10)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Today")
                            .font(customFontTextBold)
                            .fontWeight(.bold)
                        VStack (alignment: .leading, spacing: 10){
                            Text("Buzz count: " + String(bluetoothModel.classifierPacketData?.buzz_count_day ?? 0))
                                .font(customFontText)
                            Text("Species 1 count: " +  String(bluetoothModel.classifierPacketData?.species_1_count_day ?? 0))
                                .font(customFontText)
                            Text("Species 2 count: " +  String(bluetoothModel.classifierPacketData?.species_2_count_day ?? 0))
                                .font(customFontText)
                        }
                        .padding()
                    }
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading)
                    .background(Color(white: 0.98))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Total")
                            .font(customFontTextBold)
                            .fontWeight(.bold)
                        VStack (alignment: .leading, spacing: 10){
                            Text("Buzz count: " + String(bluetoothModel.classifierPacketData?.buzz_count_total ?? 0))
                                .font(customFontText)
                            Text("Species 1 count: " +  String(bluetoothModel.classifierPacketData?.species_1_count_total ?? 0))
                                .font(customFontText)
                            Text("Species 2 count: " +  String(bluetoothModel.classifierPacketData?.species_2_count_total ?? 0))
                                .font(customFontText)
                        }
                        .padding()
                    }
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading)
                    .background(Color(white: 0.98))
                    .cornerRadius(10)
                    
                    
                }
                .padding()
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(white:0.90))
    }
}




#Preview {
    ClassifierView()
}
