//  Created by Tanmay Goel on 15.04.23.


import SwiftUI

struct KerningPlaygroundView: View {
    
    // manage user progress
    @ObservedObject var appState: AppState
    
    @AppStorage("prime") var prime: Int = 0
    @AppStorage("base") var base: Int = 0
    @AppStorage("secretKeyA") var secretKeyA: Int = 0
    @AppStorage("secretKeyB") var secretKeyB: Int = 0
    @AppStorage("sharingKeyA") var sharingKeyA: Int = 0
    @AppStorage("sharingKeyB") var sharingKeyB: Int = 1
    @AppStorage("sharedSecret") var sharedSecret: Int = 2023
    
    @State private var kerning = -6.0
    @State private var fontSize = 60.0
    @State public var temp: Int = 0
    
    var body: some View {
        VStack{
            Image("hacker")
                .resizable()
                .scaledToFit()
                .padding(.bottom)
                .cornerRadius(5, antialiased: true)
            
            // button to switch sharing keys
            Button {
                // Exchange Keys
                swap(&sharingKeyA, &sharingKeyB)
                temp += 1
            } label: {
                Spacer()
                Text("Exchange Keys")
                    .fontWeight(.medium)
                    .padding(5)
                Spacer()
            }
            .padding(10)
            .background(Color(uiColor: UIColor.secondarySystemBackground))
            .cornerRadius(10)
            
            Text("Shared Secret Key!")
                .bold()
                .font(.system(size: fontSize))
                .kerning(kerning)
                .padding(.bottom)
            // button to calculate the final secret key 
            
            Image("4")
                .resizable()
                .scaledToFit()
                .padding(.all)
                .cornerRadius(5, antialiased: true)
            
            HStack{
                Image(systemName: "key.viewfinder")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                TextField("Sharing Key", value: $sharedSecret, formatter: NumberFormatter()).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            Button {
                // Exchange Keys
                sharedSecret = generateSharedSecret(p: prime, secret: secretKeyA, otherPublicKey: sharingKeyB)
            } label: {
                Spacer()
                Text("Calculate")
                    .fontWeight(.medium)
                    .padding(5)
                Spacer()
            }
            .padding(10)
            .background(Color(uiColor: UIColor.secondarySystemBackground))
            .cornerRadius(10)
            
            
            
            // display final shared key
            
        }
        .onChange(of: sharedSecret) { newValue in
            checkChallengeCompleted()
        }
    }
    
    func checkChallengeCompleted(){
        if (sharedSecret != 2023) && (temp > 0) {
            /// currently opend page
            let currentPage = BasicsCourse[appState.currentPage]
            // Mark lesson as completed
            appState.appendToCompletionProgress(id: currentPage.id)
        }
    }
}

