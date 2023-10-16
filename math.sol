// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract math {
    //execution cost 1052 gas
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    //execution cost 826 gas
    //no overflow check, does not throw an exception on overflow
    function add2(uint a, uint b) public pure returns (uint result) {
        assembly {
            result := add(a, b)
        }
    }

    //execution cost 808 gas
    // Check for overflow
    function add3(uint x, uint y) public pure returns (uint z) {
        assembly {
            z := add(x, y)
            if lt(z, x) { revert(0, 0) }
        }
    }

    //execution cost 1007 gas
    function sub(uint a, uint b) public pure returns (uint) {
        return a - b;
    }

    //execution cost 891 gas
    //no overflow check, does not throw an exception on overflow
    function sub2(uint a, uint b) public pure returns (uint result) {
        assembly {
            result := sub(a, b)
        }
    }

    //execution cost 873 gas
    // Check for overflow
    function sub3(uint x, uint y) public pure returns (uint z) {
        assembly {
            if lt(x, y) { revert(0, 0) }
            z := sub(x, y)
        }
    }

    //execution cost 1115 gas
    function mul(uint a, uint b) public pure returns (uint) {
        return a * b;
    }

    //execution cost 850 gas
    //no overflow check, does not throw an exception on overflow
    function mul2(uint a, uint b) public pure returns (uint result) {
        assembly {
            result := mul(a, b)
        }
    }

    //execution cost 967 gas
    // Check for overflow
    function mul3(uint x, uint y) public pure returns (uint z) {
        assembly {
            switch iszero(x)
            case 1 {
                z := 0
            }
            default {
                z := mul(x, y)
                if iszero(eq(div(z, x), y)) { revert(0, 0) }
            }
        }
    }

    //execution cost 1001 gas
    function div(uint a, uint b) public pure returns (uint) {
        require(b != 0, "denominator == 0");
        return a / b;
    }

    //execution cost 829 gas
    //no overflow check, does not throw an exception on overflow
    function div2(uint256 a, uint256 b) public pure returns (uint256 result) {
        require(b != 0, "denominator == 0");
        assembly {
            result := div(a, b)
        }
    }

    //execution cost 800 gas
    // Check for overflow
    function div3(uint x, uint y) public pure returns (uint z) {
        assembly {
            if iszero(y) { revert(0, 0) } 
            z := div(x, y)                
        }
    }
}
