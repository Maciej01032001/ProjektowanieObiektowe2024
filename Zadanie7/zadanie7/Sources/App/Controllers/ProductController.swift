import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")

        products.get(use: self.index)
        products.post(use: self.create)
        products.group(":productID") { product in
            product.get(use: self.read)
            product.put(use: self.update)
            product.delete(use: self.delete)
        }
    }

    @Sendable
    func index(req: Request) async throws -> [ProductDTO] {
        try await Product.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> ProductDTO {
        let product = try req.content.decode(ProductDTO.self).toModel()
        try await product.save(on: req.db)
        return product.toDTO()
    }

    @Sendable
    func read(req: Request) async throws -> ProductDTO {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return product.toDTO()
    }

    @Sendable
    func update(req: Request) async throws -> ProductDTO {
        let updatedProduct = try req.content.decode(ProductDTO.self)

        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        product.title = updatedProduct.title ?? "Untitled" // Provide a default value or handle nil appropriately
        try await product.save(on: req.db)
        return product.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await product.delete(on: req.db)
        return .noContent
    }
}
