use ethers::{
    contract::{abigen, Contract},
    core::types::ValueOrArray,
    providers::{Provider, StreamExt, Ws},
};
use std::{error::Error, sync::Arc};
use tokio::time::Duration;
use std::time::Instant;



abigen!(
    AggregatorInterface,
    r#"[
        event AnswerUpdated(int256 indexed current, uint256 indexed roundId, uint256 updatedAt)
    ]"#,
);



const PRICE_FEED_1: &str = "0x7de93682b9b5d80d45cd371f7a14f74d49b0914c";


#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let client = get_client().await;
    let client = Arc::new(client);


    let event = Contract::event_of_type::<AnswerUpdatedFilter>(client)
        .from_block(16022082)
        .address(ValueOrArray::Array(vec![
            PRICE_FEED_1.parse()?,
        ]));

    let mut stream = event.subscribe_with_meta().await?.take(2);

    let mut last_attempt = Instant::now();

    loop {
        println!("waiting for events .................... :)");

        let elapsed = last_attempt.elapsed();
        if elapsed < Duration::from_secs(30) {
            tokio::time::sleep(Duration::from_secs(30) - elapsed).await;
        }


        match stream.next().await {
            Some(Ok((log, meta))) => {
                println!("{log:?}");
                println!("{meta:?}")
            }
            Some(Err(e)) => println!("Error: {}", e),
            None => (),
        }

        last_attempt = Instant::now();
    }
}




// this function would be used to get an instance of the client
async fn get_client() -> Provider<Ws> {
    Provider::<Ws>::connect("wss://mainnet.infura.io/ws/v3/c60b0bb42f8a4c6481ecd229eddaca27")
        .await
        .unwrap()
}