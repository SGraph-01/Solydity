// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

pragma solidity ^0.8.19;

interface INameERC20 is IERC20 {
    function symbol() external view returns (string memory);
}

struct TokenInfo {
    uint24 id;
    address addr;
    string name;
}

contract Storage {
    //max length == uint24(16777215)
    uint24 public len = 0;

    mapping(address => uint24) public addrToId;
    mapping(uint24 => address) public idToAddr;
    mapping(address => string) public addrToNames;

    function addTokens(address[] memory _tokens) public {
        for (uint i = 0; i < _tokens.length; i++) {
            address tokenAddress = _tokens[i];
            require(addrToId[tokenAddress] == 0, "!add");

            INameERC20 token = INameERC20(tokenAddress);
            string memory tokenName = token.symbol();

            len++;

            addrToId[tokenAddress] = len;
            idToAddr[len] = tokenAddress;
            addrToNames[tokenAddress] = tokenName;
        }
    }

    function getStorage() external view returns (TokenInfo[] memory) {
        TokenInfo[] memory result = new TokenInfo[](len);

        for (uint24 i = 1; i <= len; i++) {
            address tokenAddress = idToAddr[i];
            string memory tokenName = addrToNames[tokenAddress];

            result[i-1] = TokenInfo({
                id: i,
                addr: tokenAddress,
                name: tokenName
            });
        }

        return result;
    }

    function getId(address _tAddr) external view returns (uint24) {
        return addrToId[_tAddr];
    }

    function getAddr(uint24 _tId) external view returns (address) {
        return idToAddr[_tId];
    }
}
