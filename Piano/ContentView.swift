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
                        Keyboard(key: 0)
                        BlackKeyboard(key: 0)
                    } //: ZStack
                    Keyboard(key: 1)
                    ZStack {
                        Keyboard(key: 2)
                        BlackKeyboard(key: 1)
                    } //: ZStack
                    ZStack {
                        Keyboard(key: 3)
                        BlackKeyboard(key: 2)
                    } //: ZStack
                    Keyboard(key: 4)
                    ZStack {
                        Keyboard(key: 5)
                        BlackKeyboard(key: 3)
                    } //: ZStack
                    Keyboard(key: 6)

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

// Logic for White Keyboard View.
var player: AVAudioPlayer!
struct Keyboard: View {
    var key: Int
    // Function that plays MP3 file located within directory.  Defines note to be played.
    //Parameter URL depends on the key being pressed.
    func playSound(key: Int) {
            let notesArray = ["C3","D3","E3","F3","G3","A3","B3","C4"]
            let note = notesArray[key]
            let url = Bundle.main.url(forResource: note, withExtension: "mp3")
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
    } //: playSound
    var body: some View {
        ZStack {
            Button(action: {
                self.playSound(key: key)
            }) { // Display White Piano Key Instead of Button Text
                PianoKey()
                }

        } //: ZStack
    } //: some View
} //: Keyboard View


// Logic for Black Keyboard View.

struct BlackKeyboard: View {
    var key: Int
    // Function that plays MP3 file located within directory.  Defines note to be played.
    //Parameter URL depends on the key being pressed.
    func playSound(key: Int) {
            let notesArray = ["Db3","Eb3","Gb3","Ab3","Bb3"]
            let note = notesArray[key]
            let url = Bundle.main.url(forResource: note, withExtension: "mp3")
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
    } //: playSound
    var body: some View {
        ZStack {
            Button(action: {
                self.playSound(key: key)
            }) { // Display Black Piano Key Instead of Button Text
                FlatKey()
                }

        } //: ZStack
    } //: some View
} //: Keyboard View

// Black Surface that serves as the background for the keys.
struct PianoSurface: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
    } //: some View
} //: PianoSurface View


// White Rounded Rectangles that serve as Piano Keys.
struct PianoKey: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(width: 30, height: 200)
    } //: some View
} //: PianoKey View

// Black Rounded Rectangles that serve as Sharp and Flat Piano Keys.
struct FlatKey: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.black)
            .frame(width: 50, height: 200)
            .offset(x: 30, y: -100)
    }
}

// Content Previwer.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } //: some View
} //: PreviewProvider
