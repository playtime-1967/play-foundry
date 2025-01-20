// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {MyStorage} from "../src/MyStorage.sol";

contract MyStorageTest is Test {
    MyStorage my_storage;

    // Re-declare the events to use them in the test file- matching its signature to the one in the smart contract.
    //Events are part of the contract's ABI, and they are not automatically visible in other files unless explicitly imported or re-declared.
    event KeyValueAdded(string key, string value);
    event KeyValueUpdated(string key, string oldValue, string newValue);
    event KeyRemoved(string key);

    function setUp() public {
        my_storage = new MyStorage();
    }

    function testSetAndGet() public {
        my_storage.set("name", "Alice");
        string memory value = my_storage.get("name");
        assertEq(value, "Alice", "Value should be 'Alice'");
    }

    function testUpdateValue() public {
        my_storage.set("name", "Alice");
        my_storage.set("name", "Bob");
        string memory updatedValue = my_storage.get("name");
        assertEq(updatedValue, "Bob", "Value should be updated to 'Bob'");
    }

    function testRemove() public {
        my_storage.set("name", "Alice");
        my_storage.remove("name");
        vm.expectRevert(bytes("Key does not exist"));
        my_storage.get("name");
    }

    function testEmitEvents() public {
        // Test KeyValueAdded event
        vm.expectEmit(true, true, false, true); //params: address, topics, data, the event data.
        emit KeyValueAdded("name", "Alice"); //the test framework listens for any emitted events that match the signature and parameters you specified.
        my_storage.set("name", "Alice");

        // Test KeyValueUpdated event
        vm.expectEmit(true, true, false, true);
        emit KeyValueUpdated("name", "Alice", "Bob");
        my_storage.set("name", "Bob");

        // Test KeyRemoved event
        vm.expectEmit(true, true, false, true);
        emit KeyRemoved("name");
        my_storage.remove("name");
    }
}
