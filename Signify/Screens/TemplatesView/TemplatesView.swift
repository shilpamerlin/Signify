//
//  TemplatesView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-18.
//
import SwiftUI

struct ClassicTemplateView: View {
    var userDetails: UserDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kind regards,")
                .font(.custom("CursiveFont", size: 24)) // Adjust for cursive font
                .italic()
                .padding(.bottom, 10)
            
            if let profilePic = userDetails.profilePicture {
                Image(uiImage: profilePic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                
                
            }
            
            Text(userDetails.fullName)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
            if userDetails.jobTitle != "" {
                Text(userDetails.jobTitle)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.gray)
                    Text(userDetails.phoneNumber)
                }
                if userDetails.companyWebsite != "" {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.gray)
                        Text(userDetails.companyWebsite)
                    }
                }
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    Text(userDetails.emailAddress)
                }
                if userDetails.companyAddress != "" {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                        Text(userDetails.companyAddress)
                    }
                    
                }
            }
            .font(.body)
            .padding(.top, 5)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HorizontalTemplateView: View {
    var userDetails: UserDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Kind regards,")
                .font(.custom("CursiveFont", size: 24)) // Replace with your desired cursive font
                .italic()
                .padding(.bottom, 5)
            HStack(alignment: .top, spacing: 10) {
                if let profileImage = userDetails.profilePicture {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(userDetails.fullName)
                        .font(.headline)
                        .foregroundColor(.black)
                    if userDetails.jobTitle != ""
                    {
                        Text(userDetails.jobTitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(userDetails.phoneNumber)
                    if userDetails.companyWebsite != "" {
                        Text(" | ")
                        Text(userDetails.companyWebsite)
                    }
                }
                HStack {
                    Text(userDetails.emailAddress)
                }
                HStack {
                    if  userDetails.companyAddress != "" {
                        Text(userDetails.companyAddress)
                    }
                }
            }
            .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    StandardTemplateView(userDetails: UserDetails.SAMPLE_USER)
}

struct StackedTemplateView: View {
    var userDetails: UserDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kind regards,")
                .font(.custom("CursiveFont", size: 18)) // Replace with your desired cursive font
                .italic()
                .padding(.bottom, 5)
            
            HStack(alignment: .top, spacing: 10) {
                
                HStack(spacing: 5) {
                    Text(userDetails.fullName)
                        .font(.headline)
                        .foregroundColor(.black)
                    HStack(spacing: 5) {
                        if userDetails.jobTitle != "" {
                            Text("|")
                            Text(userDetails.jobTitle)
                        }
                        Text("|")
                        Text(userDetails.emailAddress)
                        
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                
                Text(userDetails.phoneNumber)
                if userDetails.companyAddress != "" {
                    Text(userDetails.companyAddress)
                        .padding(.bottom, 20)
                }
                
                
                if let companyLogo = userDetails.companyLogo {
                    Image(uiImage: companyLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }
            }
            .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct StandardTemplateView: View {
    var userDetails: UserDetails
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(userDetails.fullName)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.brown)
            
            if userDetails.jobTitle != "" {
                Text(userDetails.jobTitle)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.green)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("mobile: ")
                        .bold()
                    Text(userDetails.phoneNumber)
                }
                HStack {
                    Text("e-mail: ")
                        .bold()
                    Text(userDetails.emailAddress)
                }
                if userDetails.companyAddress != "" {
                HStack {
                    Text("address: ")
                        .bold()
                    VStack(alignment: .leading) {
                        Text(userDetails.companyAddress)
                        Text("Zip Code, Country") // Modify if needed
                    }
                }
            }
            }
            .font(.system(size: 16))
            .foregroundColor(.brown)
            if userDetails.companyWebsite != "" {
                Text(userDetails.companyWebsite)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.green)
                    .padding(.top, 5)
            }
            if let logo = userDetails.companyLogo {
                Image(uiImage: logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .padding(.top, 10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
struct LeftbarTemplateView: View {
    var userDetails: UserDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Kind regards,")
                .font(.custom("HelveticaNeue-Italic", size: 18))
                .italic()
                .padding(.bottom, 5)
            
            HStack(alignment: .top, spacing: 16) {
                if let profileImage = userDetails.profilePicture {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(userDetails.fullName)
                        .font(.title3)
                        .fontWeight(.bold)
                    if userDetails.jobTitle != "" {
                        Text("\(userDetails.jobTitle)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("P")
                        .bold()
                    Text(userDetails.phoneNumber)
                }
                if userDetails.companyWebsite != "" {
                    HStack {
                        Text("W")
                            .bold()
                        Text(userDetails.companyWebsite)
                    }
                }
                
                HStack {
                    Text("E")
                        .bold()
                    Text(userDetails.emailAddress)
                }
                if userDetails.companyAddress != "" {
                    HStack {
                        Text("A")
                            .bold()
                        Text(userDetails.companyAddress)
                    }
                }
            }
            .font(.body)
            .foregroundColor(.primary)
            .padding()
            .background(Color(red: 0.3, green: 0.45, blue: 0.65))
            .cornerRadius(10)
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
    }
}

struct FooterTemplateView: View {
    var userDetails: UserDetails
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Kind regards,")
                .font(.custom("HelveticaNeue-Italic", size: 20))
                .italic()
                .padding(.top, 20)
            VStack(spacing: 10) {
                Text(userDetails.fullName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                if userDetails.jobTitle != "" {
                    Text(userDetails.jobTitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                if let profileImage = userDetails.profilePicture {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
            }
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    HStack {
                        Text("P")
                            .bold()
                            .foregroundColor(.white)
                        Text(userDetails.phoneNumber)
                            .foregroundColor(.white)
                    }
                    if userDetails.companyWebsite != "" {
                        HStack {
                            Text("W")
                                .bold()
                                .foregroundColor(.white)
                            Text(userDetails.companyWebsite)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                HStack(spacing: 10) {
                    HStack {
                        Text("E")
                            .bold()
                            .foregroundColor(.white)
                        Text(userDetails.emailAddress)
                            .foregroundColor(.white)
                    }
                    if userDetails.companyAddress != "" {
                        HStack {
                            Text("A")
                                .bold()
                                .foregroundColor(.white)
                            Text(userDetails.companyAddress)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .font(.caption)
            .padding()
            .background(Color(red: 0.3, green: 0.45, blue: 0.65))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct CentralTemplateView: View {
    var userDetails: UserDetails
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kind regards,")
                .font(.custom("CursiveFont", size: 24))
                .italic()
                .padding(.bottom, 10)
            
            HStack(alignment: .center, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(userDetails.fullName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                    if userDetails.jobTitle != "" {
                        Text(userDetails.jobTitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                
                
                
                if let profileImage = userDetails.profilePicture {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                }
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 5) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.gray)
                        Text(userDetails.phoneNumber)
                            .foregroundColor(.black)
                    }
                    if userDetails.companyWebsite != "" {
                        HStack(spacing: 5) {
                            Image(systemName: "globe")
                                .foregroundColor(.gray)
                            Text(userDetails.companyWebsite)
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack(spacing: 5) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.gray)
                        Text(userDetails.emailAddress)
                            .foregroundColor(.black)
                    }
                    if userDetails.companyAddress != "" {
                    HStack(spacing: 5) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                        Text(userDetails.companyAddress)
                            .foregroundColor(.black)
                    }
                }
                }
                .font(.caption)
                .padding(.top, 10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct TopbarTemplateView: View {
    var userDetails: UserDetails
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kind regards,")
                .font(.custom("CursiveFont", size: 24))
                .italic()
                .padding(.bottom, 10)
            
            HStack(alignment: .center, spacing: 10) {
                if let profileImage = userDetails.profilePicture {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                }
                
                VStack(alignment: .leading) {
                    if userDetails.jobTitle != "" {
                        Text(userDetails.jobTitle)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    
                    Text(userDetails.fullName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(10)
                .background(Color("appFontColor"))
                .cornerRadius(8)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(userDetails.phoneNumber)
                    Spacer()
                    if userDetails.companyWebsite != "" {
                        Text(userDetails.companyWebsite)
                    }
                }
                .font(.system(size: 14))
                
                Text(userDetails.emailAddress)
                    .font(.system(size: 14))
                
                if userDetails.companyAddress != "" {
                    Text(userDetails.companyAddress)
                        .font(.system(size: 14))
                }
            }
            .padding(.top, 5)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RightbarTemplateView: View {
    var userDetails: UserDetails
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Kind regards,")
                .font(.custom("CursiveFont", size: 24))
                .italic()
                .padding(.bottom, 10)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(userDetails.fullName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.blue)
                    if userDetails.jobTitle != "" {
                        Text(userDetails.jobTitle)
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)
                    }
                    
                    HStack(spacing: 5) {
                        Image(systemName: "phone.fill")
                        Text(userDetails.phoneNumber)
                    }
                    if userDetails.companyWebsite != "" {
                        HStack(spacing: 5) {
                            Image(systemName: "globe")
                            Text(userDetails.companyWebsite)
                        }
                    }
                    HStack(spacing: 5) {
                        Image(systemName: "envelope.fill")
                        Text(userDetails.emailAddress)
                    }
                    if userDetails.companyAddress != "" {
                        HStack(spacing: 5) {
                            Image(systemName: "mappin.and.ellipse")
                            Text(userDetails.companyAddress)
                        }
                    }
                }
                
                Spacer()
                
                if let profileImage = userDetails.profilePicture {
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                       
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CorporateTemplateView: View {
    var userDetails: UserDetails
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            
            if let companyLogo = userDetails.companyLogo {
                Image(uiImage: companyLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(userDetails.fullName)
                    .font(.headline)
                    .foregroundColor(.brown)
                
                Text(userDetails.jobTitle)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.brown)
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("T:")
                            .bold()
                        Text(userDetails.phoneNumber)
                    }
                    
                    HStack {
                        Text("M:")
                            .bold()
                        Text(userDetails.phoneNumber)
                    }
                    
                    HStack {
                        Text("E:")
                            .bold()
                        Text(userDetails.emailAddress)
                    }
                    
                    HStack {
                        Text(userDetails.companyWebsite)
                    }
                    
                    Text(userDetails.companyAddress)
                        .lineLimit(nil)
                }
                .font(.footnote)
                .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
