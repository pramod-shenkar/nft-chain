// SPDX-License-Identifier: UNKNOWN
pragma solidity ^0.8.29;

library orgmodel {
    enum Role {
        Deployer,
        Initiator,
        Transactioner,
        Auditor
    }
}

library requestmodel {
    enum RequestStatus {
        Created,
        Approved,
        Rejected,
        Failed,
        Processed
    }

    struct Request {
        uint256 storageId;
        string hashdata;
        address creator;
        RequestStatus status;
    }
}

library tokenmodel {
    enum TokenStatus {
        Minted,
        Active,
        Burned,
        ForSale,
        Sold
    }

    struct Token {
        uint256 storageId;
        string hashdata;
        address owner;
        TokenStatus status;
    }
}

library transactionmodel {
    struct Auction {
        uint256 startedAt;
        uint256 endedAt;
        uint256[] tokenIds;
    }
}
