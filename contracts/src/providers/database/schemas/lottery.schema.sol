// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Pointers} from "../pointers.sol";
import {LotteryErrors} from "../../errors/lottery.error.sol";

library LotterySchema {
    struct Request {
        bytes32 request_id;
        address requestor;
        bool status;
    }

    struct Storage {
        mapping(bytes32 => Request) requests;
    }

    function lottery_storage() internal pure returns (Storage storage s) {
        bytes32 position = Pointers.LOTTERY_STORAGE_POSITION;
        assembly {
            s.slot := position
        }
    }


    function get_request(bytes32 request_id) internal view returns (Request memory) {
        Storage storage s = lottery_storage();
        return s.requests[request_id];
    }

    function set_request(bytes32 request_id, Request memory request) internal {
        {
            if (request.request_id == bytes32(0)) {
                revert LotteryErrors.INVALID_REQUEST_ID();
            }
        }
        Storage storage s = lottery_storage();

        if (s.requests[request_id].request_id != bytes32(0)) {
            revert LotteryErrors.REQUEST_ALREADY_EXISTS();
        }

        s.requests[request_id] = request;
    }


    function set_request_status(bytes32 request_id, bool status) internal {
        Storage storage s = lottery_storage();
        s.requests[request_id].status = status;
    }
}
