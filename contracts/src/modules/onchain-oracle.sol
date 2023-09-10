// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Params} from "../providers/params.sol";

contract OnchainOracle {
    function request_for_randomness(Params.RandomnessRequest memory params) external returns (bytes32) {
        return bytes32(0);
    }

    function push_random_to_requestor() external {
        // do nothing
    }
}
