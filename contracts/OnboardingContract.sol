// SPDX-License-Identifier: UNKNOWN
pragma solidity ^0.8.29;

import "./../store/store.sol";
import "./../models/models.sol";

contract OnBoardingContract {
    OrgStore store;

    event OnBoardEvent(address _address, bool status);

    function OnBoardOrg(address _address, orgmodel.Role _role) public {
        store.SaveOrg(_address, _role);
        emit OnBoardEvent(_address, true);
    }
}
