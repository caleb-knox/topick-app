//
//  ProfileCreationPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct ProfileCreationPage: View {
    
    @State var firstName: String
    @State var lastName: String
    
    @State var isImagePickerShowing: Bool
    
    @State private var birthDate = Date()
    @State private var age: DateComponents = DateComponents()
    
    @Binding var hasProfileBeenCreated: Bool
    
    @State var selectedImage: UIImage?
    
    @ObservedObject var userManager: UserManager
    @ObservedObject var imageManager: ImageManager
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Let's create your profile to help you start finding jobs!")
                .font(.title3)
                .padding()
                .foregroundColor(.mint)
            
            Button(action: {
                isImagePickerShowing.toggle()
            }) {
                if selectedImage == nil {
                    ZStack {
                        Circle()
                            .frame(minWidth: 150, minHeight: 150)
                            .foregroundColor(.gray)
                            .shadow(radius: 4)
                        
                        Circle()
                            .frame(maxWidth: 150, maxHeight: 150)
                            .foregroundColor(.white)
                        Text("Add Profile Image")
                            .foregroundColor(.orange)
                            .font(.subheadline)
                    }
                } else {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(maxWidth: 150, maxHeight: 150)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                
            }.sheet(isPresented: $isImagePickerShowing, onDismiss: nil) {
                VStack {
                    Button(action: {
                        isImagePickerShowing.toggle()
                    }) {
                        Text("Return")
                    }
                    
                    ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing)
                }
            }
            
            Text("First Name *")
                .foregroundColor(.cyan)
                .offset(x: -135, y: 20)
            TextField("Users will see this", text: $firstName)
                .padding()
                .padding(.vertical, 10)
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 250, height: 1)
                .offset(x: -55, y: -15)
                
            Text("Last Name *")
                .foregroundColor(.cyan)
                .offset(x: -135, y: 20)
            TextField("Users will see this", text: $lastName)
                .padding()
                .padding(.vertical, 10)
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 250, height: 1)
                .offset(x: -55, y: -15)
                
            VStack(spacing: 40) {
                
                VStack(spacing: 0) {
                    Text("Birthday *")
                        .foregroundColor(.cyan)
                        .offset(x: -80)
                    if age.year ?? 0 > 10 {
                        Text("\(age.year ?? 0) years old")
                            .fontWeight(.bold)
                            .foregroundColor(.black).opacity(0.6)
                            .offset(x: -65, y: 10)
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 1)
                        .offset(x: 10, y: 20)
                    } else {
                        Text("You must be 10 years or older to join")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .offset(x: 30, y: 10)
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 1)
                        .offset(x: 10, y: 25)
                    }
                    
                }
                DatePicker("", selection: $birthDate, in: ...Date(), displayedComponents: .date).datePickerStyle(WheelDatePickerStyle())
                            }.onChange(of: birthDate, perform: { value in
                                age = Calendar.current.dateComponents([.year, .month, .day], from: birthDate, to: Date())
                            }).offset(x: -65)
            
            if firstName != "" && lastName != "" && age.year ?? 0 >= 10 {
                Button(action: {
                    userManager.setProfileInfo()
                    userManager.storeBasicInfo(firstName: firstName, lastName: lastName, birthday: birthDate)
                    if selectedImage != nil {
                        imageManager.uploadPhoto(selectedImage: selectedImage)
                    }
                    hasProfileBeenCreated.toggle()
                }) {
                    ZStack {
                    RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.mint)
                            .shadow(radius: 4)
                    Text("Complete")
                        .foregroundColor(.white)
                        .font(.headline)
                    }
                }
                
            } else {
                ZStack {
                RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.gray).opacity(0.4)
                        .shadow(radius: 4)
                Text("Complete")
                    .foregroundColor(.white)
                    .font(.headline)
                }
            }
                    
        }
        
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isImagePickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        parent.isImagePickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.parent.isImagePickerShowing = false
    }
    
}
