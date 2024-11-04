import Plot

let root = "https://bobko.xyz"

// func myItem(link: String) -> Node<RSS.ChannelContext> {
//     return .item(
//         .link(link)
//     )
// }

// Verificator https://validator.w3.org/feed/
var rss = RSS(
    .title("Nikita Bobko Blog @ bobko.xyz"),
    .description("Nikita Bobko Blog @ bobko.xyz"),
    .link(root),
    .atomLink("\(root)/rss.xml"),
    .lastBuildDate(.now),
    .language(.english)
    // .item(
    //     .title("Language design: what's wrong with if statement in shell languages"),
    //     .link("\(root)/log/0001-shell-if-statement"),
    //     .guid("\(root)/log/0001-shell-if-statement"),
    //     .pubDate(.now)
    // )
)

print(rss.render(indentedBy: .spaces(2)))
