//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyStorage} from "../src/MyStorage.sol";

contract DeployMyStorage is Script {
    MyStorage public my_storage;

    function setUp() public {}

    function run() public {
        //Before Calling vm.startBroadcast(): The script runs in dry-run mode, meaning actions (like deployments or calls) are simulated and not sent to the blockchain.
        //After Calling vm.startBroadcast(): Transactions are signed and sent to the blockchain. Any changes (contract deployment, state updates) are now persisted on the chain.
        vm.startBroadcast();

        my_storage = new MyStorage();
        console.log("Deployed my_storage at:", address(my_storage));

        vm.stopBroadcast();
    }
}
