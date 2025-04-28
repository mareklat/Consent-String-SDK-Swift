import Foundation

@objc public class ConsentStringAdapter: NSObject {

    @objc public func decodeConsentString(_ consentString: String) -> String {
        if let consentData = try? ConsentString(consentString: consentString) {
            // Musisz zwrócić coś prostego, np. String lub NSDictionary
            return consentData.consentLanguage
        } else {
            return "elo"
        }
    }
}
