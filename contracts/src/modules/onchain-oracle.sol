// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract OnchainOracle {
    function request_for_randomness() external returns (bytes32) {
        return bytes32(0);
    }

    function push_random_to_requestor() external {
        // do nothing
    }
}
