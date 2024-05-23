@testable import App
import XCTVapor
import Fluent


final class AppTests: XCTestCase {
    var app: Application!
    
    override func setUp() async throws {
        self.app = try await Application.make(.testing)
        try await configure(app)
        try await app.autoMigrate()
    }
    
    override func tearDown() async throws { 
        try await app.autoRevert()
        try await self.app.asyncShutdown()
        self.app = nil
    }
    
    func testHelloWorld() async throws {
        try await self.app.test(.GET, "hello", afterResponse: { res async in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
    
    func testProductIndex() async throws {
        let sampleProducts = [Product(title: "sample1"), Product(title: "sample2")]
        try await sampleProducts.create(on: self.app.db)
        
        try await self.app.test(.GET, "Products", afterResponse: { res async throws in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(
                try res.content.decode([ProductDTO].self).sorted(by: { $0.title ?? "" < $1.title ?? "" }),
                sampleProducts.map { $0.toDTO() }.sorted(by: { $0.title ?? "" < $1.title ?? "" })
            )
        })
    }
    
    func testProductCreate() async throws {
        let newDTO = ProductDTO(id: nil, title: "test")
        
        try await self.app.test(.POST, "products", beforeRequest: { req in
            try req.content.encode(newDTO)
        }, afterResponse: { res async throws in
            XCTAssertEqual(res.status, .ok)
            let models = try await Product.query(on: self.app.db).all()
            XCTAssertEqual(models.map { $0.toDTO().title }, [newDTO.title])
        })
    }
    
    func testProductDelete() async throws {
        let testProducts = [Product(title: "test1"), Product(title: "test2")]
        try await testProducts.create(on: app.db)
        
        try await self.app.test(.DELETE, "products/\(testProducts[0].requireID())", afterResponse: { res async throws in
            XCTAssertEqual(res.status, .noContent)
            let model = try await Product.find(testProducts[0].id, on: self.app.db)
            XCTAssertNil(model)
        })
    }
}


extension ProductDTO: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title
    }
}

