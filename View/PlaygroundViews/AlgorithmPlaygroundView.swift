
//  Created by Tanmay Goel on 15.04.23.


import SwiftUI

struct HierarchyPlaygroundView: View {        
    // manage user progress
    @ObservedObject var appState: AppState
    //DHView
    @AppStorage("prime") var prime: Int = 0
    @AppStorage("base") var base: Int = 0
    @AppStorage("secretKeyA") var secretKeyA: Int = 0
    @AppStorage("secretKeyB") var secretKeyB: Int = 0
    @AppStorage("sharingKeyA") var sharingKeyA: Int = 0
    @AppStorage("sharingKeyB") var sharingKeyB: Int = 1
    
    
    // title
    @State public var titleFont: Font = .system(size: 25, weight: .semibold, design: .serif)
    @State private var titleFontSize : CGFloat = 21.0
    @State private var titleWeight : Font.Weight = .light
    
    var body: some View {
        VStack() {
            Text("Fix values for the secret key")
                .lineSpacing(1.5)
                .font(titleFont)
                .padding(.bottom, 12)
            // two inputs for secret keys
            HStack{
                Image(systemName: "questionmark.key.filled")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                Text("Henry's Secret Key")
                TextField("Secret Key 1", value: $secretKeyA, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            HStack{
                Image(systemName: "questionmark.key.filled")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                Text("Stella's Secret Key")
                TextField("Secret Key 2", value: $secretKeyB, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            
            // display public shared key 
            Text("Formula")
                .lineSpacing(1.5)
                .font(titleFont)
                .padding(.bottom, 12)
            Image("Formula")
                .resizable()
                .frame(width: 150, height: 60)
                .padding(.bottom)
            
        
            
            // sharing keys
            HStack{
                Image(systemName: "person.badge.key")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                Text("Henry's Key")
                TextField("Sharing Key ", value: $sharingKeyA, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            HStack{
                Image(systemName: "person.badge.key")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                Text("Stella's Key")
                TextField("Sharing Key", value: $sharingKeyB, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            
            // button to calcuate public shared key 
            Button {
                // Calculate shared key
                sharingKeyA = generateKeys(p: prime, g: base, secret: secretKeyA)
                sharingKeyB = generateKeys(p: prime, g: base, secret: secretKeyB)
                checkChallengeCompleted()
            } label: {
                Spacer()
                Text("Calculate Keys")
                    .fontWeight(.medium)
                    .padding(5)
                Spacer()
            }
            .padding(10)
            .background(Color(uiColor: UIColor.secondarySystemBackground))
            .cornerRadius(10)
            
            Image("mixture")
                .resizable()
                .scaledToFit()
                .padding(.all)
                .cornerRadius(5, antialiased: true)
            
            
            
        }
        .onChange(of: sharingKeyA & sharingKeyB ) { newValue in
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

struct FontSizeSelector: View {
    @Binding var fontSize: CGFloat
    
    var body: some View {
        HStack{
            if fontSize > 31 && fontSize < 41 {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.green)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .transition(.scale.combined(with: .opacity))
                
            } else {
                Image(systemName: "textformat.size")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .transition(.scale.combined(with: .opacity))
            }
            
            Text("Secret Key")
                .font(.callout)
                .padding(5)
                .animation(.none, value: fontSize)
            Slider(value: $fontSize.animation(Animation.timingCurve(0.44, 1.86, 0.61, 0.99, duration: 0.5)), in: 20...50)
                .animation(.none, value: fontSize)
            Text("\(fontSize, specifier: "%.00f")")
                .monospacedDigit()
                .font(.caption)
                .padding(5)
                .animation(.none, value: fontSize)
        }
    }
}



