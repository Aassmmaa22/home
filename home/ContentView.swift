//
//  ContentView.swift
//  home
//
//  Created by Asma Abdulkreem on 15/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
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
                    Text("Location photo")
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
                        .frame(width: 200, height: 200)
                                                    .padding(.top, 400.0)

                    }
                    VStack{
                    Button(" Choose Picture "){
                        self.showSheet = true
                    }               .padding(.top, 640.0)
                        .actionSheet(isPresented: $showSheet){
                            ActionSheet(title: Text("Photo Library "),message: Text("choose"),buttons: [
                                .default(Text("Photo Library")){
                                    self.showImagePickr = true
                                    self.sourceType = .photoLibrary
                                },
                            ])
                        }
                           }
                            VStack{
                                Text("Location Name")
                                    .padding(.top, 700.0)
                                    .frame( width: 300, height: 100,
                                            alignment: .leading)
                            }
                            VStack{
                                Section{
                                    TextField("enter", text: $textFieldText1)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 300, height: 90)
                                        .padding(.top, 800.0)
                                }
                            }
                            VStack{
                                Text("Location Link")
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
                                Text(" description")
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
                                Text("Save")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.top, 1350.0)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 90)

                        }
                    
                    
                        .frame(height: 0.0)
                }
                .navigationTitle("Add New Location")
                .navigationBarTitleDisplayMode(.inline)            
                
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

