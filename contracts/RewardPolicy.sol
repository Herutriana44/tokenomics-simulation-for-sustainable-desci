// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RewardPolicy {
    address public admin;
    mapping(string => uint256) public rewardRules;

    event RewardRuleUpdated(string rule, uint256 value);

    constructor() {
        admin = msg.sender;
        rewardRules["publication"] = 10;
        rewardRules["peer_review"] = 5;
        rewardRules["open_data"] = 8;
    }

    function updateRewardRule(string memory rule, uint256 value) public {
        require(msg.sender == admin, "Only admin");
        rewardRules[rule] = value;
        emit RewardRuleUpdated(rule, value);
    }

    function getRewardValue(string memory rule) public view returns (uint256) {
        return rewardRules[rule];
    }
}