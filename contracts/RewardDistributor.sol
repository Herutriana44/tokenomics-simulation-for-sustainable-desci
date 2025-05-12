// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IRewardPolicy {
    function getRewardValue(string memory rule) external view returns (uint256);
}

contract RewardDistributor {
    IERC20 public token;
    IRewardPolicy public policy;
    address public admin;

    constructor(address _token, address _policy) {
        token = IERC20(_token);
        policy = IRewardPolicy(_policy);
        admin = msg.sender;
    }

    function distributeReward(address recipient, string memory rule) public {
        require(msg.sender == admin, "Only admin");
        uint256 reward = policy.getRewardValue(rule) * 10 ** 18;
        token.transfer(recipient, reward);
    }
}