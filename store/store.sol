// SPDX-License-Identifier: UNKNOWN
pragma solidity ^0.8.29;

import "./../models/models.sol";

contract OrgStore {
    mapping(address => orgmodel.Role) private orgs;

    function SaveOrg(address _address, orgmodel.Role _role) public {
        orgs[_address] = _role;
    }

    function GetOrg(address _address) public view returns (orgmodel.Role) {
        return orgs[_address];
    }
}

contract requeststore {
    mapping(uint256 => requestmodel.Request) private requests;

    function SaveRequest(
        uint256 id,
        requestmodel.Request memory _request
    ) public {
        _request.status = requestmodel.RequestStatus.Created;
        requests[id] = _request;
    }

    function GetRequest(
        uint256 id
    ) public view returns (requestmodel.Request memory) {
        return requests[id];
    }
}

contract tokenstore {
    mapping(uint256 => tokenmodel.Token) private tokens;

    uint256 tokenIdCounter;

    function GetNewTokenId() public returns (uint256) {
        return ++tokenIdCounter;
    }

    function SetToken(uint256 id, tokenmodel.Token memory _token) public {
        tokens[id] = _token;
    }

    function GetToken(
        uint256 id
    ) public view returns (tokenmodel.Token memory) {
        return tokens[id];
    }

    function UpdateTokenStatus(
        uint256 id,
        tokenmodel.TokenStatus _status
    ) public {
        tokenmodel.Token memory token = GetToken(id);
        token.status = _status;
        SetToken(id, token);
    }

    function UpdateOwner(uint256 id, address owner) public {
        tokenmodel.Token memory token = GetToken(id);
        token.owner = owner;
        SetToken(id, token);
    }
}

contract TransactionsStore {
    mapping(uint256 => transactionmodel.Auction) auctions;

    function SetAuction(
        uint256 id,
        transactionmodel.Auction memory _auction
    ) public {
        auctions[id] = _auction;
    }

    function GetAuction(
        uint256 id
    ) public view returns (transactionmodel.Auction memory) {
        return auctions[id];
    }
}
