//
//  CharacterView.swift
//  di-mi-nombre-quotes
//
//  Created by Manolo on 14/02/24.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character: Character
    
    var body: some View {
        GeometryReader{ geo in
            ZStack(alignment: .top){
                Image(show.lowerNoSpaces)
                    .resizable()
                    .scaledToFit()
                
                ScrollView{
                    VStack{
                        AsyncImage(url:character.images.randomElement())
                        { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .frame(
                        width: geo.size.width/1.2,
                        height: geo.size.height/1.7)
                    .cornerRadius(20)
                    .padding(.top, 60)
                    
                    VStack(alignment: .leading){
                        Group{
                            Text(character.name)
                                .font(.largeTitle)
                            
                            Text("Portrayed By: \(character.portrayedBy)")
                                .font(.title2)
                            
                            Divider()
                            
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            Text("Born: \(character.birthday)")
                            
                            Divider()
                        }
                        
                        Group{
                            Text("Ocuppations:")
                            ForEach(character.occupations, id: \.self){ ocupation in
                                Text("•\(ocupation)")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            Text("Nicknames:")
                            if character.aliases.count > 0 {
                                ForEach(character.aliases, id: \.self){ alias in
                                    Text("•\(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding([.leading, .bottom], 40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(show: Constants.bbName, character: Constants.previewCharacter)
}

