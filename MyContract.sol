// SPDX-License-Identifier: MIT
pragma solidity 0.8.25; // hello in comment

import "hardhat/console.sol";

contract MyContract {
    uint number;

    function setNumber(uint newNumber) public {
        number = newNumber;
    }
    function getNumber() public view returns (uint) {
        return number;
    }
    function getRandomNumber() private pure returns (uint) {
        return 9;
    }
    function payMeBackLess() external payable {
        console.log("msg.value", msg.value);
        require(msg.value >= 1 ether, "must send at least 1 eth");
        uint randomNumber = getRandomNumber();
        uint ethRefund = msg.value / randomNumber;
        payable(msg.sender).transfer(ethRefund);
    }
}

