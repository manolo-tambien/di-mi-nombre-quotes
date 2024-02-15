//
//  QuoteView.swift
//  di-mi-nombre-quotes
//
//  Created by Manolo on 14/02/24.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = ViewModel(controller:  FetchController())
    @State private var showCharacterInfo = false
    let show: String
    
    var body: some View {
        GeometryReader{ geo in
            // First ZStack layer
            ZStack{
                Image(show.lowerNoSpaces)
                    .resizable()
                    .frame(width: geo.size.width * 2.7,
                           height: geo.size.height * 1.2)
                VStack{
                    VStack{
                        Spacer(minLength: 140)
                        
                        switch viewModel.status{
                        case .success(let data):
                            Text("\"\(data.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                                .background(.black.opacity(0.6))
                                .cornerRadius(20)
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom){
                                AsyncImage(url: data.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                                .onTapGesture {
                                    showCharacterInfo.toggle()
                                }
                                // open the CharacterView with the show value and the character
                                .sheet(isPresented: $showCharacterInfo){
                                    CharacterView(show: show, character: data.character)
                                }
                                
                                Text(data.quote.character)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .background(.ultraThinMaterial)
                            }
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .cornerRadius(20)
                        case .fetching:
                            ProgressView()
                            
                        default:
                            EmptyView()
                        }
                        
                        Spacer()
                    }
                    
                    Button{
                        Task{
                            // Get the data from the viewModel for the quote and the character
                            await viewModel.getData(for:show)
                        }
                    } label:{
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("\(show.noSpaces)Button"))
                            .cornerRadius(20)
                            .shadow(color: Color("\(show.noSpaces)Shadow"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: Constants.bbName)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
