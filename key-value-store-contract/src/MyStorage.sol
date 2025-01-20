// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MyStorage {
    //mapping is like a key-value store
    mapping(string => string) private store;

    event KeyValueAdded(string key, string value);
    event KeyValueUpdated(string key, string oldValue, string newValue);
    event KeyRemoved(string key);

    //memory: Temporary, non-persistent storage. storage: Persistent, tied to contract state.
    function set(string memory key, string memory value) public {
        if (bytes(store[key]).length == 0) {
            emit KeyValueAdded(key, value);
        } else {
            emit KeyValueUpdated(key, store[key], value);
        }
        store[key] = value;
    }

    //A function marked view promises not to modify the state of the blockchain. It can only read from the state.
    function get(string memory key) public view returns (string memory) {
        //A conditional check that throws an error and reverts the transaction if the condition is not met.
        require(bytes(store[key]).length != 0, "Key does not exist");
        return store[key];
    }

    function remove(string memory key) public {
        require(bytes(store[key]).length != 0, "Key does not exist");
        //delete used to reset state variables (set them to their default value). For mapping, it removes the key-value pair.
        delete store[key];
        emit KeyRemoved(key);
    }
}
