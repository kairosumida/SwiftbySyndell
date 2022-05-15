//
//  GuideToTheSwiftUILayoutSystemView.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 12/05/22.
//

import SwiftUI
struct GuideToTheSwiftUILayoutSystem: View {
    var body: some View {
        Text("Pagina com erro1")
    }
}
/*
struct GuideToTheSwiftUILayoutSystemView: View {
 var viewModel: GuideToTheSwiftUILayoutSystemViewModel
    var body: some View {
        
        ZStack {
            EventHeader()
            ImagePlaceholder()
                .layoutPriority(-1)
                .frame(minHeight: 100)
            Text(makeDescription())
            Spacer()
            EventInfoList().fixedSize(horizontal: true, vertical: true)
        }.padding()
    }
}

private extension GuideToTheSwiftUILayoutSystemView {
    func makeDescription() -> String {
        String(repeating: "This is a description ", count: 50)
    }
}
extension GuideToTheSwiftUILayoutSystemView {
struct EventHeader{
    var body: some View{
        VStack(spacing: 15){
            CalendarView()
            VStack{
                Text("Event title").font(.title)
                Text("Location")
            }
            Spacer()
        }
    }
}
}
extension GuideToTheSwiftUILayoutSystemView {
struct ImagePlaceholder: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).stroke()
            Text("Image placeholder")
        }
    }
}
}

extension GuideToTheSwiftUILayoutSystemView {
struct CalendarView: View{
    var eventIsVerified = true
    var body: some View{
        
        Image(systemName: "calendar")
            .resizable()
            .frame(width: 50, height: 50)
            .padding()
            .background(.red)
            .cornerRadius(10)
            .foregroundColor(.white)
            .addVerifiedBadge(eventIsVerified)
        
    }
}
}
extension GuideToTheSwiftUILayoutSystemView {
struct EventInfoBadge: View{
    var iconName: String
    var text: String
    var body: some View{
        VStack{
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            
            Text(text)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 5)
      
    }
}
}
extension GuideToTheSwiftUILayoutSystemView {
struct EventInfoList: View{
    var body: some View{
        HeightSyncedRow(background: Color.secondary.cornerRadius(10)) {
            EventInfoBadge(
                iconName: "video.circle.fill",
                text: "Video call available"
            )
            EventInfoBadge(
                iconName: "doc.text.fill",
                text: "Files are attached"
            )
            EventInfoBadge(
                iconName: "person.crop.circle.badge.plus",
                text: "Invites enabled, 5 people maximum"
            )
        }
    }
}
}
extension GuideToTheSwiftUILayoutSystemView {
struct HeightSyncedRow<Background: View, Content: View>: View{
    private let background: Background
        private let content: Content
        @State private var childHeight: CGFloat?

        init(background: Background,
             @ViewBuilder content: () -> Content) {
            self.background = background
            self.content = content()
        }

        var body: some View {
            HStack {
                content.syncingHeightIfLarger(than: $childHeight)
                       .frame(height: childHeight)
                       .background(background)
            }
        }
}
}
private struct HeightPreferenceKey: PreferenceKey{
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat,
                       nextValue: () -> CGFloat){
        value = nextValue()
        
    }
}

extension View{
    func syncingHeightIfLarger(than height: Binding<CGFloat?>) -> some View {
        background(GeometryReader { proxy in
            // We have to attach our preference assignment to
            // some form of view, so we just use a clear color
            // here to make that view completely transparent:
            Color.clear.preference(
                key: HeightPreferenceKey.self,
                value: proxy.size.height
            )
        })
        .onPreferenceChange(HeightPreferenceKey.self) {
            height.wrappedValue = max(height.wrappedValue ?? 0, $0)
        }
    }
}

extension View {
    func addVerifiedBadge(_ isVerified: Bool) -> some View {
        ZStack(alignment: .topTrailing) {
            self

            if isVerified {
                Image(systemName: "checkmark.circle.fill")
                    .alignmentGuide(HorizontalAlignment.trailing) {
                        $0.width * 0.8
                    }
                    .alignmentGuide(VerticalAlignment.top) {
                        // Here we first align our view's bottom edge
                        // according to its host view's top edge,
                        // and we then subtract 80% of its height.
                        $0[.bottom] - $0.height * 0.8
                    }
            }
        }
    }
}


struct GuideToTheSwiftUILayoutSystemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = GuideToTheSwiftUILayoutSystemViewModel()
        GuideToTheSwiftUILayoutSystemView(viewModel: viewModel)
    }
}
    
*/
