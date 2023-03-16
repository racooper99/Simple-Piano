//
//  ContentView.swift
//  Piano
//
//  Created by racooper on 3/14/23.
//
import AVFoundation
import SwiftUI




struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 0
    var body: some View {
       // if (currentPage == 1) {
            ZStack {
                PianoSurface()
                HStack {
                    ZStack {
                        Keyboard(isPressed: true)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(width: 75, height: 250)
                            .offset(x: 30, y: -100)
                        
                        
                    } //: ZStack
                    Keyboard(isPressed: true)
                    ZStack {
                        Keyboard(isPressed: true)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(width: 75, height: 250)
                            .offset(x: 30, y: -100)
                        
                    } //: ZStack
                    ZStack {
                        Keyboard(isPressed: true)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(width: 75, height: 250)
                            .offset(x: 30, y: -100)
                        
                    } //: ZStack
                    Keyboard(isPressed: true)
                } //: HStack
                .padding()
                .foregroundColor(.white)
            } //: ZStack
       // } //: if CP == 1
//        if (currentPage == 0) {
//            
//            Button(
//                "Hello World",
//                action: {
//                    if currentPage >= 1 {
//                        currentPage += 1
//                        
//                    }
//                    else {
//                        currentPage -= 1
//                    }
//                    
//                }
//            ) //: Button
//            
//        } //: if CP ==2
        
        
        
        
    } //: some View
} //: ContentView
var player: AVAudioPlayer!
struct Keyboard: View {
    @State var isPressed: Bool
    func playSound() {
           let url = Bundle.main.url(forResource: "A0 copy", withExtension: "mp3")
        guard url != nil else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
        catch {
            print("\(error)")
        }
    }
    var body: some View {
        ZStack {
            Button(action: {
                self.playSound()
            }) { // does this need brackets?
                PianoKey()
            }

        } //: ZStack
        .onTapGesture {
            isPressed = !isPressed
        } //: onTapGesture
    } //: some View
} //: Keyboard View

struct PianoSurface: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
    } //: some View
} //: PianoSurface View

struct PianoKey: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(width: 50, height: 300)
    } //: some View
} //: PianoKey View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } //: some View
} //: PreviewProvider
