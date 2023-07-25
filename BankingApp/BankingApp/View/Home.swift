//
//  Home.swift
//  BankingApp
//
//  Created by Lee Hojun on 2023/07/25.
//

import SwiftUI

struct Home: View {
  var proxy: ScrollViewProxy
  var size: CGSize
  var safeArea: EdgeInsets
  
  @State private var activePage: Int = 1
  @State private var myCards: [Card] = sampleCards
  @State private var offset: CGFloat = 0
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(spacing: 10) {
        ProfileCard()
        
        Capsule()
          .fill(.gray.opacity(0.2))
          .frame(width: 50, height: 5)
          .padding(.vertical, 5)
        
        let pageHeight = size.height * 0.65
        
        GeometryReader {
          let proxy = $0.frame(in: .global)
          
          TabView(selection: $activePage) {
            ForEach(myCards) { card in
              ZStack {
                if card.isFirstBlankCard {
                  Rectangle()
                    .fill(.clear)
                } else {
                  //CardView
                  CardView(card: card)
                }
              }
              .frame(width: proxy.width - 60)
              .tag(index(card))
              .offsetX(activePage == index(card)) { rect in
                let minX = rect.minX
                let pageOffset = minX - (size.width * CGFloat(index(card)))
                offset = pageOffset
              }
            }
          }
          .tabViewStyle(.page(indexDisplayMode: .never))
          .background {
            RoundedRectangle(cornerRadius: 40 * reverseProgress(size), style: .continuous)
              .fill(Color.indigo.gradient)
              .frame(
                height: pageHeight + fullScreenHeight(
                  size, pageHeight, safeArea
                )
              )
              .frame(
                width: proxy.width - (60 * reverseProgress(size)),
                height: pageHeight,
                alignment: .top
              )
              .offset(x: -15 * reverseProgress(size))
              .scaleEffect(0.95 + (0.05 * progress(size)), anchor: .leading)
              .offset(x: (offset + size.width) < 0 ? (offset + size.width) : 0)
              .offset(y: (offset + size.width) > 0 ? (-proxy.minY * progress(size)) : 0)
          }
        }
        .frame(height: pageHeight)
        .zIndex(1000)
      }
      .padding(.top, safeArea.top + 15)
      .padding(.bottom, safeArea.bottom + 15)
    }
  }
  
  @ViewBuilder
  func ProfileCard() -> some View {
    HStack(spacing: 4) {
      Text("Hello")
        .font(.title)
        
      Text("Justine")
        .font(.title)
        .fontWeight(.bold)
      
      Spacer(minLength: 0)
      
      Circle()
        .foregroundColor(.pink)
        .aspectRatio(contentMode: .fill)
        .frame(width: 55, height: 55)
        .clipShape(Circle())
    }
    .padding(.horizontal, 25)
    .padding(.vertical, 35)
    .background {
      RoundedRectangle(cornerRadius: 35, style: .continuous)
        .fill(Color.purple)
        .opacity(0.2)
    }
    .padding(.horizontal, 30)
  }
  
  func index(_ of: Card) -> Int {
    return myCards.firstIndex(of: of) ?? 0
  }
  
  func fullScreenHeight(_ size: CGSize, _ pageHeight: CGFloat, _ safeArea: EdgeInsets) -> CGFloat {
    let progress = progress(size)
    let remainingScreenHeight = progress * (size.height - (pageHeight - safeArea.top - safeArea.bottom))
    return remainingScreenHeight
  }
  
  func progress(_ size: CGSize) -> CGFloat {
    let pageOffset = offset + size.width
    let progress = pageOffset / size.width
    
    return min(progress, 1)
  }
  
  func reverseProgress(_ size: CGSize) -> CGFloat {
    let progress = 1 - progress(size)
    return max(progress, 0)
  }
}

struct CardView: View {
  var card: Card
  var body: some View {
    GeometryReader {
      let size = $0.size
      
      VStack(spacing: 0) {
        Rectangle()
          .fill(card.cardColor.gradient)
          .overlay(alignment: .top) {
            VStack {
              HStack {
                Image(systemName: "cpu")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 65, height: 65)
                
                Spacer()
                
                Image(systemName: "wave.3.right")
                  .font(.largeTitle.bold())
              }
              
              Spacer()
              
              Text(card.cardBalance)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(30)
          }
        
        Rectangle()
          .fill(.black)
          .frame(height: size.height/3)
          .overlay {
            VStack {
              Text(card.cardName)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
              
              Spacer(minLength: 0)
              
              HStack {
                Text("Debit Card")
                  .font(.callout)
                
                Spacer(minLength: 0)
                
                Text("VISA")
                  .font(.title2.bold().italic())
                  .frame(width: 60)
              }
            }
            .foregroundColor(.white)
            .padding(25)
          }
      }
      .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
