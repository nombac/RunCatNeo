import Foundation
import Testing

@testable import DataSource

struct CustomMetricsSourceTests {
    @Test
    func decode_without_isEnabled_defaults_to_true() throws {
        let json = """
            {
              "id": "00000000-0000-0000-0000-000000000001",
              "displayName": "Card",
              "fileURL": "file:///tmp/card.json",
              "bookmark": "Ym9va21hcms=",
              "createdAt": 0
            }
            """
        #expect(try JSONDecoder().decode(CustomMetricsSource.self, from: Data(json.utf8)).isEnabled)
    }

    @Test
    func encode_and_decode_preserves_isEnabled() throws {
        let source = CustomMetricsSource(
            id: UUID(1),
            displayName: "Card",
            fileURL: URL(filePath: "/tmp/card.json"),
            bookmark: Data("bookmark".utf8),
            createdAt: Date(timeIntervalSince1970: 0),
            isEnabled: false
        )
        #expect(try JSONDecoder().decode(CustomMetricsSource.self, from: JSONEncoder().encode(source)) == source)
    }
}
