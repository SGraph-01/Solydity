// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IComp {
    function drip(address token) external;
}

contract Job {
    function Cow(address token) onOw public {
        address[2] memory Fauceteer = [0x5B0156A396BdFc2eb814D945Ac99C40A0F8592B2, 0x75442Ac771a7243433e033F3F8EaB2631e22938f];

        for (uint256 i = 0; i < Fauceteer.length; i++) {
            if (IERC20(token).balanceOf(Fauceteer[i]) > 0) {
                IComp(Fauceteer[i]).drip(token);
            }
        }

        uint balance = IERC20(token).balanceOf(address(this));
        if (balance > 0) {
            IERC20(token).transfer(msg.sender, balance);
        }
    }
}

contract Factory {
    address[] private deployedJob;

    //creates a specified number of contracts
    function createJob(address token, uint8 j) external {
        for (uint256 i = 0; i < j; i++) {
            Job job = new Job();

            job.Cow(token);
            deployedJob.push(address(job));
        }
    }
    
    function doJob(address token) external {
        for (uint256 i = 0; i < deployedJob.length; i++) {
            Job job = Job(deployedJob[i]);
            job.Cow(token);
        }
    }

    function getDeployedJobs() onOw external view returns (address[] memory) {
        return deployedJob;
    }

    function withdraw(address[] memory tokens) external {
        uint bal;
        for(uint i = 0; i < tokens.length; i++) {
            bal = IERC20(tokens[i]).balanceOf(address(this));
            if (bal > 0) IERC20(tokens[i]).transfer(msg.sender, bal);
        }
    }
}
