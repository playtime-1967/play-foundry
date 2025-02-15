Implement a HashMap-like smart contract in Solidity.
Write comprehensive unit tests to verify all functionalities of the contract.
Define a test network configuration using Sepolia via Alchemy:
https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY.
Set up a MetaMask Wallet to interact with the network.

Deploy the contract to the Sepolia test network and connect it to the wallet.
Contract address: 0x8d709da1d20385518bf2BB691b239157bb502D7a
Interact with the contract using Foundry Cast tools. for example remove a key from the hashmap-storage:
cast send <CONTRACT_ADDRESS> "remove(string)" "name" --rpc-url sepolia --private-key YOUR_PRIVATE_KEY