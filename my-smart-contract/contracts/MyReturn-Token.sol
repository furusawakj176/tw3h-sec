// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC4907.sol";

contract NFTReturn is ERC4907 {
    mapping(uint256 => string) public tokenURIs;

    constructor(string memory _name, string memory _symbol)
        ERC4907(_name, _symbol)
    {}

    function tokenReturn(
        uint256 _tokenId,
        uint64 _expires
    ) public onlyOwner(_tokenId) {
        address user = 0x0000000000000000000000000000000000000000;
        setUser(_tokenId, user, _expires);
    }

    modifier onlyOwner(uint256 _tokenId) {
        require(
            _isApprovedOrOwner(msg.sender, _tokenId),
            "caller is not owner nor approved"
        );
        _;
    }
}