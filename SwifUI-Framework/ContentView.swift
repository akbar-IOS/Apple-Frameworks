//
//  ContentView.swift
//  SwifUI-Framework
//
//  Created by Akbar Abdullo on 2/22/26.
//

import SwiftUI

struct ContentView: View {
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks){ framework in
                        FrameworGridView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                                viewModel.isShowingFrameworkDetail = true
                            }
                        
                    }
                                
                            }
            }
        
            .navigationTitle("🍎 Frameworks")
            .fullScreenCover(isPresented:$viewModel.isShowingFrameworkDetail){
                FrameworkDetailView(
                    framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                    isShowingFrameworkDetail: $viewModel.isShowingFrameworkDetail
                )
            }
        }
        
        
    }
}

struct FrameworGridView: View{
    let framework: Framework
    
    var body : some View {
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 90 , height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(ColorScheme.dark)
}
