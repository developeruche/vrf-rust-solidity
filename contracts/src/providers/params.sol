// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;




library Params {
    struct RandomnessRequest {
        bytes32 request_id;
        address requestor;
    }
}