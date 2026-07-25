/*
 CustomMetricsSource.swift
 DataSource

 Created by Takuto Nakamura on 2026/06/06.
 Copyright 2026 Kyome22 (Takuto Nakamura)

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation

public struct CustomMetricsSource: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var displayName: String
    public var symbol: String?
    public var fileURL: URL
    public var bookmark: Data
    public var createdAt: Date
    public var isEnabled: Bool

    public init(
        id: UUID,
        displayName: String,
        symbol: String? = nil,
        fileURL: URL,
        bookmark: Data,
        createdAt: Date,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.displayName = displayName
        self.symbol = symbol
        self.fileURL = fileURL
        self.bookmark = bookmark
        self.createdAt = createdAt
        self.isEnabled = isEnabled
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
        self.fileURL = try container.decode(URL.self, forKey: .fileURL)
        self.bookmark = try container.decode(Data.self, forKey: .bookmark)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.isEnabled = try container.decodeIfPresent(Bool.self, forKey: .isEnabled) ?? true
    }
}
