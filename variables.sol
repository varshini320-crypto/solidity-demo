// SPDX-License-Identifier:MIT
pragma solidity^0.8.0;

contract VariableExamples{

uint public age=25;
int public temperature=-5;
uint8 public smallNum=255;

string public name="Alice";

bool public isActive=true;

address public owner;

function calculate() public pure returns(uint){
    uint temp=10;
    uint result=temp*2;
    return result;
}
function productAndAverage() public pure returns (uint product, uint average) {
        uint a = 5;
        uint b = 10;
        uint c = 15;

        uint product = a * b * c;
        uint average =product / 3;

        return (product, average);
}
}