//
//  FrameworkDetailView.swift
//  SwifUI-Framework
//
//  Created by Akbar Abdullo on 2/23/26.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingFrameworkDetail: Bool
    @State private var IsShowingSafariView: Bool = false
    
    var body: some View {
     
        VStack{
            
            HStack{
                Spacer()
                Button{
                    isShowingFrameworkDetail = false
                } label: {
                    Image(systemName:"xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
            FrameworGridView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Button{
                if let url = URL(string: framework.urlString) {
                    UIApplication.shared.open(url)
                }
                IsShowingSafariView = true
            } label: {
                Text("Learn more")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .frame(width: 300, height: 50)
                    .background(.red)
                    .cornerRadius(10)
                    .foregroundStyle(Color.white)
                
            }
        
            .sheet(isPresented:$IsShowingSafariView){
                SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com"))!)
            }
            
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingFrameworkDetail: .constant(false))
        .preferredColorScheme(.dark)
}
