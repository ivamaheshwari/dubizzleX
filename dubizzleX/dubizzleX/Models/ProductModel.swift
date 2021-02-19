//
//  ProductModel.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 23/01/21.
//

import Foundation
// MARK: - ProductResponce
struct ProductResponce: Codable {
    let results: [Product]
    let pagination: Pagination
}

// MARK: ProductResponce convenience initializers and mutators

extension ProductResponce {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ProductResponce.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        results: [Product]? = nil,
        pagination: Pagination? = nil
    ) -> ProductResponce {
        return ProductResponce(
            results: results ?? self.results,
            pagination: pagination ?? self.pagination
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let key: JSONNull?
}

// MARK: Pagination initializers

extension Pagination {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Pagination.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        key: JSONNull?? = nil
    ) -> Pagination {
        return Pagination(
            key: key ?? self.key
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Product
struct Product: Codable {
    let createdAt, price, name, uid: String
    let imageIDS, imageUrls: [String]
    let imageUrlsThumbnails: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

extension Product : Equatable {
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.createdAt == rhs.createdAt && lhs.price == rhs.price && lhs.name == rhs.name && lhs.uid == rhs.uid && lhs.imageIDS == rhs.imageIDS && lhs.imageUrls == rhs.imageUrls && lhs.imageUrlsThumbnails == rhs.imageUrlsThumbnails
    }
}

// MARK: Product initializers

extension Product {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Product.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        createdAt: String? = nil,
        price: String? = nil,
        name: String? = nil,
        uid: String? = nil,
        imageIDS: [String]? = nil,
        imageUrls: [String]? = nil,
        imageUrlsThumbnails: [String]? = nil
    ) -> Product {
        return Product(
            createdAt: createdAt ?? self.createdAt,
            price: price ?? self.price,
            name: name ?? self.name,
            uid: uid ?? self.uid,
            imageIDS: imageIDS ?? self.imageIDS,
            imageUrls: imageUrls ?? self.imageUrls,
            imageUrlsThumbnails: imageUrlsThumbnails ?? self.imageUrlsThumbnails
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
