// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC4907 {
    function setUser(uint256 tokenId, address user, uint64 expires) external ;
}

contract NFTReturn {

    function proxy(address dest, uint256 id) public returns (bool result) {
        ERC4907 setContract = ERC4907(dest);
        address user = msg.sender;
        uint64 expire = 1667709136;
 
        setContract.setUser(id, user, expire);
        return result;
    }
}