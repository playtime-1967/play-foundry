
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

## Deploying the Contract on an Ethereum Network  

In this example, we set up a test network using Sepolia. Follow these steps to deploy the contract:  

1. **Configure a Test Network**  
   - Use the Sepolia test network via Alchemy, where you will receive an API key.  

2. **RPC Configuration:**  
    - Update the `foundry.toml` file with your **Alchemy** or **Infura** API key for Sepolia testnet:  
   ```toml
    [rpc_endpoints]
    sepolia = "https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY"
    ```

3. **Set Up a Test Wallet**  
   - Create a test wallet in [Metamask](https://metamask.io).  
   - Fetch the private key of the wallet, as it will be required when deploying the contract.  

4. **Deploy the Contract**  
   - Deploy the contract to the Sepolia test network and connect it to your wallet.  
   - Your wallet needs balance to deploy the contract, but fake deposits are possible for testing purposes!
   - Contract address: `0x8d709da1d20385518bf2BB691b239157bb502D7a`  
   - You can verify it on [Etherscan](https://etherscan.io/address/0x8d709da1d20385518bf2BB691b239157bb502D7a).  

   **Deployment Command:**  
   ```sh
   forge script <deploy_script_path> --rpc-url <your_rpc_url> --private-key <your_wallet_private_key> --broadcast
   ```
   - Deployment logs can be found in the `broadcast/` folder, e.g., `/key-value-store-contract/broadcast/`.  

5. **Interact with the Contract**  
   - Use **Foundry Cast** to interact with the contract.  
   - You can send transactions, check the latest block, get wallet balances, replay transactions, and more.  


## Deploy the Contract on a Local Machine
Start a Local Anvil Node (for testing):  
```sh
anvil
```
Anvil defaults to listening on 127.0.0.1:8545.  
Deploy the contract using Foundry script:  
```sh
forge script script/MyStorage.sol.sol --fork-url http://localhost:8545 --broadcast
```
