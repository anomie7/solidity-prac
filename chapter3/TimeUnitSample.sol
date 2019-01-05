pragma solidity ^0.5.0;

contract TimeUnitSample {
    uint public startTime;

    function start() public{
        startTime = block.timestamp;
    }

    function minutesAfter(uint min) public view returns (bool) {
        if (startTime == 0 ) return false;
        return ((now - startTime) / 1 minutes >= min);
    }

    function getSeconds() public view returns (uint) {
        if (startTime == 0) return 0;
        return (now - startTime);
    }
}