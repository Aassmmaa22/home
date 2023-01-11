//
//  ContentView.swift
//  home
//
//  Created by Asma Abdulkreem on 15/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
   // @State var test = ""
    @State  var textFieldText1 = ""
    @State  var textFieldText2:  String = ""
    @State  var textFieldText3:  String = ""
    @State private var showSheet: Bool = false
    @State private var showImagePickr: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack{
                  //  Text("text2")
                    Text("text2")
                        .padding(.top, 100.0)
                        .frame( width: 300, height: 100,
                                alignment: .leading)
                    
//                    VStack{
//                        Image ( "placeholder")
////                        Image(systemName: "camera.circle.fill")
////                            .resizable()
//                            .frame(width: 150.0, height: 150.0)
//                            .padding(.top, 400.0)
//                    }
                    VStack{
                        Image(uiImage: image ?? UIImage ( named:"placeholder")!)
                        .resizable()
                        .frame(width: 200, height: 150)
                                                    .padding(.top, 400.0)

                    }
                    VStack{
                    Button("text3"){
                        self.showSheet = true
                    }               .padding(.top, 640.0)
                        .actionSheet(isPresented: $showSheet){
                            ActionSheet(title: Text("text4"),message: Text("text5"),buttons: [
                                .default(Text("text4")){
                                    self.showImagePickr = true
                                    self.sourceType = .photoLibrary
                                },
                            ])
                        }
                           }
                            VStack{
                                Text("text6")
                                    .padding(.top, 700.0)
                                    .frame( width: 300, height: 100,
                                            alignment: .leading)
                            }
                            VStack{
                                Section{
                                    TextField("", text: $textFieldText1)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 300, height: 90)
                                        .padding(.top, 800.0)
                                }
                            }
                            VStack{
                                Text("text7")
                                    .padding(.top, 900.0)
                                    .frame( width: 300, height: 100,
                                            alignment: .leading)
                            }
                            VStack{
                                TextField("", text: $textFieldText2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 300, height: 90)
                                    .padding(.top, 1000.0)
                                
                            }
                            VStack{
                                Text("text8")
                                    .padding(.top, 1100.0)
                                    .frame( width: 300, height: 100,
                                            alignment: .leading)
                            }
                            VStack{
                                TextField("", text: $textFieldText3)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 300, height: 90)
                                    .padding(.top, 1200.0)
                                
                            }
                    
                        Button{
                            print("save")
                        } label: {
                            Text("text9")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 1350.0)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 90)
                        
                                            }
                    
                    
                        .frame(height: 0.0)
                }
         //   Text("text1")
                .navigationTitle("text1")
                .frame(maxWidth: .infinity, alignment: .center)
                
            }.sheet(isPresented: $showImagePickr) {
                        ImagePicker(image: self .$image, isShown: self .$showImagePickr, sourceType: self.sourceType)
            }
            }
//            .padding()
        }
//    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

