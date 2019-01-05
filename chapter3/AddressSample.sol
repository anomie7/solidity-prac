pragma solidity ^0.5.0;

contract AddressSample {
    function () external payable {}

    function getTargetBalance(address _target) public view returns(uint) {
        // if (_target == address(0)){  //remix ide의 javascript vm으로 실행하면 parameter 값이 무효하다고 실행 안됨
        //     return address (this).balance;
        // }
        return _target.balance;
    }

    function getContractBalance() public view returns(uint) {
        return address (this).balance;
    }

    function sendToTarget(address payable _to, uint _amount) public payable {
        _to.transfer(_amount);
    }

    function withdraw() public payable {
        address payable to = msg.sender;
        to.transfer(address (this).balance);
    }

    function withdraw2() public payable {
        address payable to = msg.sender;
        (bool success, bytes memory returnData) = to.call.value(address (this).balance).gas(100)(abi.encodeWithSignature("register(withdraw2)", "withdraw2"));
        require(success);
    }
}