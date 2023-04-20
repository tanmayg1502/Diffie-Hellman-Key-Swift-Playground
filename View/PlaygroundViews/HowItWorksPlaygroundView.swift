//  Created by Tanmay Goel on 15.04.23.


import SwiftUI

struct FontsPlaygroundView: View {
    
    //DHView
    //  @StateObject var DHKeys = DHKeys()
    @AppStorage("prime") var prime: Int = 0
    @AppStorage("base") var base: Int = 0
    
    // manage user progress
    @ObservedObject var appState: AppState
    
    // subtitle
    @State private var subTitleSelection = 2
    @State private var subTitleFont: Font = Font.custom("American Typewriter", size: 14).weight(.regular)
    @State private var subTitleCorrect = false
    
    // title
    @State private var titleSelection = 1
    @State public var titleFont: Font = .system(size: 25, weight: .semibold, design: .serif)
    @State private var titleCorrect = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Spacer()
            VStack(alignment: .leading, spacing: 10){
                Image("initial")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom)
                    .cornerRadius(5, antialiased: true)
                
                
                
                Text("Fix a value for the prime number and base")
                    .lineSpacing(1.5)
                    .font(titleFont)
                    .padding(.bottom, 12)
            }
            .padding()
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "p.square")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.accentColor)
                        .frame(width: 20, height: 20)
                        .padding(5)
                        .padding(.trailing, 4)
                        .transition(.scale.combined(with: .opacity))
                    Text("Prime")
                    TextField("Shared Prime number", value: $prime, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                
                HStack{
                    Image(systemName: "b.square")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.accentColor)
                        .frame(width: 20, height: 20)
                        .padding(5)
                        .padding(.trailing, 4)
                        .transition(.scale.combined(with: .opacity))
                    Text("Base")
                    TextField("Shared Base Number", value: $base, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                //Save button and link to next view
                
            }
        }
        .onChange(of: base) { newValue in
            checkChallengeCompleted()
        }
    }
    
    func checkChallengeCompleted(){
            /// currently opend page
            let currentPage = BasicsCourse[appState.currentPage]
            // Mark lesson as completed
            appState.appendToCompletionProgress(id: currentPage.id)
        
    }
}

