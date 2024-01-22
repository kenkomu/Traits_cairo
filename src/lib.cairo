
    #[derive(Drop, Clone)]
    struct NewsArticle {
        headline: ByteArray,
        location: ByteArray,
        author: ByteArray,
        content: ByteArray,
    }

    trait SummaryTrait<T> {
        fn summarize(self: @T) -> ByteArray;
    }
    impl NewsArticleSummary of SummaryTrait<NewsArticle> {
        fn summarize(self: @NewsArticle) -> ByteArray {
            format!(
                "{} by {} ({})", self.headline.clone(), self.author.clone(), self.location.clone()
            )
        }
    }

    #[derive(Drop, Clone)]
    struct Tweet {
        username: ByteArray,
        content: ByteArray,
        reply: bool,
        retweet: bool,
    }

    impl TweetSummary of SummaryTrait<Tweet> {
        fn summarize(self: @Tweet) -> ByteArray {
            format!("{}: {}", self.username.clone(), self.content.clone())
        }
    }
use aggregator::{Summary, NewsArticle, Tweet};
fn main() {
    let news = NewsArticle {
        headline: "Cairo has become the most popular language for developers",
        location: "Worldwide",
        author: "Cairo Digger",
        content: "Cairo is a new programming language for zero-knowledge proofs",
    };

    let tweet = Tweet {
        username: "EliBenSasson",
        content: "Crypto is full of short-term maximizing projects. \n @Starknet and @StarkWareLtd are about long-term vision maximization.",
        reply: false,
        retweet: false
    }; // Tweet instantiation

    println!("New article available! {}", news.summarize());
    println!("1 new tweet: {}", tweet.summarize());
}
