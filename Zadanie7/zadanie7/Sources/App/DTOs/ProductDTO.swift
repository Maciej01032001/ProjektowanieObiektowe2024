import Fluent
import Vapor

struct ProductDTO: Content {
    var id: UUID?
    var title: String?
    
    func toModel() -> Product {
        let model = Product()
        
        model.id = self.id
        if let title = self.title {
            model.title = title
        }
        return model
    }
}
