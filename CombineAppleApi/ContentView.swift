//
//  ContentView.swift
//  CombineAppleApi
//
//  Created by Mac-11 on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ApiViewModel()
    var body: some View {
        List(vm.apps, id: \.self)  { items in
        VStack {
            Text(items.artworkUrl100)

             //   .imageScale(.large)
              //  .foregroundColor(.accentColor)
               

                Text(items.name)
             Text(items.artistName)
            }
        }
        .padding()
        .onAppear(){
            vm.getApps()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




