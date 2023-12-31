// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

contract PaymentContract {
    event Payment(address indexed _from, uint256 _value, uint256 _refund);

    function processPayment(uint256 _number) external payable {
        require(_number != 9, "We don't like 9");
        if (_number % 2 == 0) {
            uint256 refundAmount = msg.value /2;
            payable (msg.sender).transfer(refundAmount);
            emit Payment(msg.sender, msg.value, refundAmount);
        } else {
            payable(msg.sender).transfer(msg.value);
            emit Payment(msg.sender, msg.value, msg.value);
        }
    }
}
