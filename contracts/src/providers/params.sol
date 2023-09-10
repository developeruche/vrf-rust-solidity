// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;




library Params {
    struct RandomnessRequest {
        bytes32 request_id;
        address requestor;
    }

    struct RandomnessFutureFullfillment {
        bytes32 input;
        uint256 randomness;
        bytes32 request_id;
        address requestor;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }
}