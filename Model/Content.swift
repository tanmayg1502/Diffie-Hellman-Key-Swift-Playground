import SwiftUI
//  Created by Tanmay Goel on 15.04.23.

// This file contains all content that app displays, organized with Pages
let BasicsCourse : [Page] = [welcome, fonts, hierarchy, detail, quiz ]

/// All avalible PlaygroundViews that PageContentView can darw
/// The switch case in PageContentView must cover that case for a view to appear
enum PlaygroundViews {
    case welcomePlaygroundView
    case fontsPlaygroundView
    case hierarchyPlaygroundView
    case appPlaygroundView
    case kerningPlaygroundView
    case quizPlaygroundView
}

/// All avalible ContentCustomView that PageContentView can darw
/// The switch case in PageContentView must cover that case for a view to appear
enum ContentCustomView {
    case fontsContentCustomView
}

let welcome = Page(
    id: "basics_welcome",
    title: "Welcome",
    contentSubTitle: "Welcome",
    contentTitle: "Diffie-Hellman Key exchange Crashcourse",
    titleImageName: "graduationcap.fill",
    playgroundView: .welcomePlaygroundView,
    elements: [
        PageText("Welcome to the Diffie–Hellman Key Exchange Playground! In this playground, you'll learn about the Diffie–Hellman key exchange technique and how it works."),
        PageDivider(topSpacing: true),
        
        PageHeadline("What is Diffie–Hellman Key Exchange?", topSpacing: true),
        PageText("Diffie–Hellman key exchange is a cryptographic protocol used to securely exchange keys over a public channel. The protocol was first proposed by Whitfield Diffie and Martin Hellman in 1976."),
                 
         PageText("In a standard key exchange, two parties agree on a secret key using a public key encryption algorithm. However, with the Diffie–Hellman key exchange, the two parties agree on a shared secret without actually exchanging any secret information."),
    ]
)

let fonts = Page(
    id: "basics_fonts",
    title: "How it works",
    contentSubTitle: "Lesson 1",
    contentTitle: "How does DH Key exchange work?",
    titleImageName: "textformat",
    playgroundView: .fontsPlaygroundView,
    elements: [
        PageText("The Diffie–Hellman key exchange is based on the concept of modular arithmetic. The steps involved in the protocol are as follows:"),
        //PageCustomView(.fontsContentCustomView, topSpacing: true),
        PageDivider(topSpacing: true),
        PageText("1) Henry and Stella agree on a public prime number p and a base g."),
        PageText("2) Henry chooses a secret number a and calculates A = g^a mod p."),
        PageText("3) Stella chooses a secret number b and calculates B = g^b mod p."),
        PageText("4) Henry and Stella exchange their public values, A and B, over an insecure channel."),
        PageText("5) Henry calculates s = B^a mod p."),
        PageText("6) Stella calculates s = A^b mod p."),
        
        PageText("7) Both Henry and Stella now share the same secret value"),
        PageDivider(topSpacing: true),
        PageTask("Fix two values for the prime number and base number publically", topSpacing: true),
        PageDivider(topSpacing: true),
        PageHeadline("Summary", topSpacing: true),
        PageText("We learned the basics of how the Diffie-Hellman Key Exchange works"),
    ]
)

let hierarchy = Page(
    id: "basics_hierarchy",
    title: "Algorithm",
    contentSubTitle: "Lesson 2",
    contentTitle: "Learning the Algorithm",
    titleImageName: "text.alignleft",
    playgroundView: .hierarchyPlaygroundView,
    elements: [
        PageTask("Fix our private keys for Henry and Stella"),
        PageDivider(topSpacing: true),
        PageHeadline("Calculating keys to be send", topSpacing: true),
        PageText("Now that we have decided the secret keys for the two parties, it's time to calculate the keys that will be send across the insecure channel with the formula"),
        PageTask("Calculate the keys to be shared through the insecure channel "),
        PageDivider(topSpacing: true),
        PageHeadline("Formula", topSpacing: true),
        PageText("The formula as given in the playground represents:"),
        PageText("p for the prime number"),
        PageText("g for the base"),
        PageText("a for the secret key of Henry and Stella"),
        
    ]
)


let detail = Page(
    id: "basics_detail",
    title: "Secure Private Key",
    contentSubTitle: "Lesson 3",
    contentTitle: "Computing the private key",
    titleImageName: "text.magnifyingglass",
    playgroundView: .kerningPlaygroundView,
    elements: [
        PageText("For this last lesson, we will take the now recieved keys through the insecure channel and compute our final secret key with the same formula as used in the last lesson"),
        PageTask("Exchange the keys generated from last lesson"),
        PageDivider(topSpacing: true),
        PageHeadline("Keep in mind", topSpacing: true),
        PageText("The insecure keys receieved now become the base of our equation, with the prime number and secret key of each party remaining the same"),
        PageTask("Compute the final secret key from the recieved insecure key", topSpacing: true),
        PageDivider(topSpacing: true),
        PageHeadline("Summary", topSpacing: true),
        PageText("You now have a secret session key shared between two parties through an insecure channel without any worries of anyone else in the network able to guess or compute the final secret key"),
    ]
)

let quiz = Page(
    id: "basics_quiz", 
    title: "Final Quiz",
    contentSubTitle: "Final Quiz",
    contentTitle: "Check your knowledge",
    titleImageName: "brain.head.profile",
    playgroundView: .quizPlaygroundView,
    elements: [
        PageTask("Check what you have learned and finish the final quiz on the right.", topSpacing: true),
        PageText("Congratulations for making it that far! You've made your way through some of the most fundamental rules of Diffie-Hellman Key exchange technique, had the chance to apply them and now have a head start in cryptography. There's one last challenge for you that will put to the test, what you have learned."),
        PageDivider(topSpacing: true),
        PageTask("Don't forget to check out the About this App section on the bottom left!"),
        PageText("Thank you for taking the time to complete this course, I hope you enjoyed it and that you've learned something new. Have a great WWDC, see you there!", topSpacing: true),
        PageDivider(topSpacing: true)
    ]
)
