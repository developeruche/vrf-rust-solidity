// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Params} from "../params.sol";
import {OnchainOracleSchema} from "../database/schemas/onchain-oracle.schema.sol";
import {Context} from "../commons/context.sol";
import {OnchainOracleEvents} from "../events/onchain-oracle.event.sol";



library OnchianOracleProvider {
    function request_for_randomness(Params.RandomnessRequest memory params) internal {
        OnchainOracleSchema.set_request(params.request_id, params.requestor);
        emit OnchainOracleEvents.RequestRandoness(params.request_id, params.requestor);
    }

    function fullfill_randomness_future(Params.RandomnessFutureFullfillment memory params) internal {
        // do nothing
    }   
}