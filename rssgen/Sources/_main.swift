import Plot
import Foundation

let root = "https://bobko.xyz"

// func myItem(link: String) -> Node<RSS.ChannelContext> {
//     return .item(
//         .link(link)
//     )
// }

@main
struct Main {
    static func main() throws {
        // Verificator https://validator.w3.org/feed/
        let rss = RSS(
            .title("Nikita Bobko Blog @ bobko.xyz"),
            .description("Nikita Bobko Blog @ bobko.xyz"),
            .link(root),
            .atomLink("\(root)/rss.xml"),
            .lastBuildDate(.now),
            .language(.english),
            .item(
                .title("KotlinConf 2025. Swift concurrency for curious Kotliners"),
                .link("https://youtu.be/Jyj4kdK8a6o"),
                .guid("https://youtu.be/Jyj4kdK8a6o"),
                .pubDate(try Date.init("2025-06-20T21:28:00+02:00", strategy: .iso8601))
            ),
        )

        print(rss.render(indentedBy: .spaces(2)))
    }
}

