// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Params} from "../providers/params.sol";
import {OnchianOracleProvider as provider, OnchainOracleSchema} from "../providers/modules/onchain-oracle.provider.sol";
import {OnchainOracleController as Controller} from "../controllers/onchain-oracle.controller.sol";

abstract contract AbstractOnchainOracle {
    address public immutable off_chain_signer;

    constructor(address _off_chain_signer) {
        off_chain_signer = _off_chain_signer;
    }
    
    function fullfill_randomness_future_internal(OnchainOracleSchema.Request memory request) internal virtual;
    function fullfill_randomness_future(OnchainOracleSchema.Request memory request) public {
        fullfill_randomness_future(request);
    }
}
