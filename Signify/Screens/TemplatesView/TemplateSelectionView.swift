//
//  TemplateView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-11.
//

import SwiftUI

struct TemplateSelectionView: View {
    var userDetails: UserDetails
    let templates = [
        Template(name: "Classic"),
        Template(name: "Horizontal"),
        Template(name: "Stacked"),
        Template(name: "Standard"),
        Template(name: "Leftbar"),
        Template(name: "Footer"),
        Template(name: "Corporate"),
        Template(name: "Central"),
        Template(name: "Topbar"),
        Template(name: "Rightbar")
        
    ]
    @State private var selectedTemplate: Template? = nil
    @State private var navigateToForm = false
    @State private var navigateToSaveSignature = false
    
    init(userDetails: UserDetails) {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "appFontColor") as Any]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "appFontColor") as Any]
        appearance.backgroundColor = UIColor(named: "brandPrimary")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        self.userDetails = userDetails
    }
    var isMockUser: Bool {
        return userDetails == UserDetails.SAMPLE_USER
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("brandPrimary")
                    .ignoresSafeArea()
                List {
                    
                    ForEach(templates, id: \.name) { template in
                        VStack()
                        {
                            Text(template.name)
                            
                            
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .bold()
                                .italic()
                            
                            switch template.name {
                            case "Classic":
                                ClassicTemplateView(userDetails: userDetails)
                            case "Horizontal":
                                HorizontalTemplateView(userDetails: userDetails)
                            case "Stacked":
                                StackedTemplateView(userDetails: userDetails)
                            case "Standard":
                                StandardTemplateView(userDetails: userDetails)
                            case "Leftbar":
                                LeftbarTemplateView(userDetails: userDetails)
                            case "Footer":
                                FooterTemplateView(userDetails: userDetails)
                            case "Corporate":
                                CorporateTemplateView(userDetails: userDetails)
                            case "Central":
                                CentralTemplateView(userDetails: userDetails)
                            case "Topbar":
                                TopbarTemplateView(userDetails: userDetails)
                            case "Rightbar":
                                RightbarTemplateView(userDetails: userDetails)
                            default:
                                Text("Unknown template")
                                    .foregroundColor(.red)
                            }
                            Button(action: {
                                selectedTemplate = template
                                if isMockUser {
                                    navigateToForm = true
                                } else {
                                    if selectedTemplate != nil {
                                        navigateToSaveSignature = true
                                    } else {
                                        print("No template selected")
                                    }
                                }
                                
                            }) {
                                Text("Select Template")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("appFontColor"))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                .navigationTitle("Select Template")
                
                .background(Color("brandPrimary"))
                .scrollContentBackground(.hidden)
                
                .navigationDestination(isPresented: $navigateToForm) {
                    UserInputFormView(selectedTemplate: selectedTemplate)
                }
                
                .navigationDestination(isPresented: $navigateToSaveSignature) {
                    if let template = selectedTemplate {
                        SaveSignatureView(viewModel: SaveSignatureViewModel(selectedTemplate: template, userDetails: userDetails), dashboardViewModel: DashboardViewModel())
                    } else {
                        Text("No template selected")
                            .foregroundColor(.red)
                    }
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
