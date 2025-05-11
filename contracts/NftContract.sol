// SPDX-License-Identifier: UNKNOWN
pragma solidity ^0.8.29;

import "./../store/store.sol";
import "./../models/models.sol";

contract NftContract {
    tokenstore tstore;
    requeststore rstore;

    function Mint(uint256 requestId) public {
        requestmodel.Request memory request = rstore.GetRequest(requestId);

        uint256 tokenId = tstore.GetNewTokenId();

        tstore.SetToken(
            tokenId,
            tokenmodel.Token(
                request.storageId,
                request.hashdata,
                request.creator,
                tokenmodel.TokenStatus.Minted
            )
        );
    }

    function Activate(uint256 tokenId) public {
        tstore.UpdateTokenStatus(tokenId, tokenmodel.TokenStatus.Active);
    }
}
