// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract math {
    //execution cost 963 gas
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    //execution cost 759 gas
    //no overflow check, does not throw an exception on overflow
    function add2(uint a, uint b) public pure returns (uint result) {
        assembly {
            result := add(a, b)
        }
    }

    //execution cost 1007 gas
    function sub(uint a, uint b) public pure returns (uint) {
        return a - b;
    }

    //execution cost 781 gas
    //no overflow check, does not throw an exception on overflow
    function subA(uint a, uint b) public pure returns (uint result) {
        assembly {
            result := sub(a, b)
        }
    }

    //execution cost 1115 gas
    function mul(uint a, uint b) public pure returns (uint) {
        return a * b;
    }

    //execution cost 783 gas
    //no overflow check, does not throw an exception on overflow
    function mulA(uint a, uint b) public pure returns (uint result) {
        assembly {
            result := mul(a, b)
        }
    }

    //execution cost 1001 gas
    function div(uint a, uint b) public pure returns (uint) {
        require(b != 0, "denominator == 0");
        return a / b;
    }

    //execution cost 806 gas
    //no overflow check, does not throw an exception on overflow
    function divA(uint256 a, uint256 b) public pure returns (uint256 result) {
        require(b != 0, "denominator == 0");
        assembly {
            result := div(a, b)
        }
    }
}
