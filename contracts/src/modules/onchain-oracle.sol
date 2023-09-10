// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Params} from "../providers/params.sol";
import {OnchianOracleProvider as provider} from "../providers/modules/onchain-oracle.provider.sol";

contract OnchainOracle {
    function request_for_randomness(Params.RandomnessRequest memory params) external {
        return provider.request_for_randomness(params);
    }

    function fullfill_randomness_future(Params.RandomnessFutureFullfillment memory params) external {
        provider.fullfill_randomness_future(params);
    }




    function get_request() external view {
        // do nothing
    }
}
