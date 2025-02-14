# Key-Value Store Smart Contract  

A simple **key-value store** smart contract written in Solidity and built with **Foundry**. The contract allows users to **store, update, retrieve, and remove** key-value pairs on the Ethereum blockchain.  


## Prerequisites  
- Install **Foundry** (if not already installed) from [here](https://github.com/foundry-rs/foundry?tab=readme-ov-file#installation).  
 
## build & Test the contract
`cd key-value-store-contract/`

### Install Dependencies  
```sh
forge install
```

### Compile the Contract  
```sh
forge build
```

### Run Tests  
```sh
forge test
```

### Deploy the Contract  

Start a Local Anvil Node (for testing):  
```sh
anvil
```
Anvil defaults to listening on 127.0.0.1:8545.  

Deploy the contract using Foundry script:  
```sh
forge script script/MyStorage.sol.sol --fork-url http://localhost:8545 --broadcast
```

## RPC Configuration  
Update the `foundry.toml` file with your **Alchemy** or **Infura** API key for Sepolia testnet:  
```toml
[rpc_endpoints]
sepolia = "https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY"
```
