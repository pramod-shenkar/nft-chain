// SPDX-License-Identifier: UNKNOWN
pragma solidity ^0.8.29;

import "./../store/store.sol";
import "./../models/models.sol";

contract RequestContract {
    requeststore store;

    event SavedEvent(uint256 indexed id, bool status);
    event ApprovedEvent(uint256 indexed id, bool status);

    function saveRequest(
        uint256 id,
        requestmodel.Request memory _request
    ) public {
        _request.status = requestmodel.RequestStatus.Created;
        store.SaveRequest(id, _request);
        emit SavedEvent(id, true);
    }

    function approveRequest(uint256 id) public {
        requestmodel.Request memory request = store.GetRequest(id);
        require(id != 0, "Request not found");
        request.status = requestmodel.RequestStatus.Approved;
        store.SaveRequest(id, request);
        emit ApprovedEvent(id, true);
    }

    function queryRequest(
        uint256 id
    ) public view returns (requestmodel.Request memory) {
        return store.GetRequest(id);
    }
}
