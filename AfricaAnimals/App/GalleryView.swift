//
//  GalleryView.swift
//  AfricaAnimals
//
//  Created by Atakan Apan on 1/16/23.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // define grid
    /*let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]*/
    
    // efficient way of top code
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // dynamic way of grid
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridCloumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCloumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //image
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 8))
            //slider
            Slider(value: $gridCloumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridCloumn) { newValue in
                    withAnimation(.easeIn){
                        gridSwitch()
                    }
                }
            //grid
            VStack(alignment: .center, spacing: 30) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }//grid
                .onAppear{ gridSwitch() }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
