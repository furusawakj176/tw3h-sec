// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyReturnContract {
    constructor() payable {
        }
    function tokenReturn(address dest, uint256 id) external {
        address externalContract = address(dest);
        address user = msg.sender;
        uint64 expire = 1667709136;
        (bool success,) = externalContract.call{ gas: 20000 }(abi.encodeWithSignature("setUser(uint256,address,uint64)", id, user, expire));
        require(success);
    }
}