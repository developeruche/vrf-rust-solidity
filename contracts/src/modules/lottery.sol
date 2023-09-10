// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {LotteryController} from "../controllers/lottery.controller.sol";
import {AbstractOnchainOracle} from "./abstract-onchain-oracle.sol";
import {OnchainOracleSchema} from "../providers/database/schemas/onchain-oracle.schema.sol";

// start lottery 
// end lottery
// participate 
contract Lottery is AbstractOnchainOracle {

    constructor(address _off_chain_signer) AbstractOnchainOracle(_off_chain_signer) {
        
    }

    function start() external {
        
    }   

    function participate() external {
        
    }

    function end() external {
        
    }

    function fullfill_randomness_future_internal(OnchainOracleSchema.Request memory request) internal override {
        // set the reqest storage
    } 
}
