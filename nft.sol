// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface INFT {
    function mint() external;
    function totalSupply() external view returns (uint);
    function transferFrom(address from, address to, uint tokenId) external;
}

contract Minion {
    constructor(uint tokenId, address target, address recipient) {    
        INFT(target).mint();
        INFT(target).transferFrom(address(this), recipient, tokenId);
        assembly { return(0, 0) }
    }
}

contract Gru {
    event Vote(address indexed, string indexed);

    function vote(uint count, string calldata text) external {      
        require(block.timestamp <= 1753977600, "Minting period has ended");

        address target = 0x...; //address contract nft
        uint currentTokenId = INFT(target).totalSupply();

        unchecked {
            for (uint i; i < count; ++i) {
                new Minion(++currentTokenId, target, msg.sender);
            }
        }
        
        emit Vote(msg.sender, text);
    }
}