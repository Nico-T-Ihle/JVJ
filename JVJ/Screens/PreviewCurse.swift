import SwiftUI

struct PreviewCurse: View {
//    var landmark: Landmark
    var faq: FLQM

    var body: some View {
        HStack {
            
            Text(faq.chapter)

            Spacer()
            
            if faq.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct PreviewCurse_Previews: PreviewProvider {
    static var faqData = ModelData().faqData
    static var previews: some View {
        Group {
            PreviewCurse(faq: faqData[0])
            PreviewCurse(faq: faqData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
