// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import {MyLover} from "./MyLover.sol";
contract callMyLover {
//
function calladdLover(bytes32 _name,address _address) external{
MyLover add=MyLover(_address);
add.addLover(_name);
}

//
function calldonotlove(MyLover _address, bytes32 _name) external {
    _address.doNotLove(_name);
}

function callgetBalance(MyLover _address) view external returns(uint256) {
    uint256 _x;
    _x=_address.getBlance();
    return _x;
}

//
function callgetAmountOfLover(MyLover _address) external view returns(uint256)
{
    uint256 _x;
    _x=_address.getAmountOfLover();
    return _x;
}

//
function callgetLover(uint256 _x,MyLover _address) view external returns(uint256,bytes32) {
    uint256 _id;
    bytes32 _name;
    (_id,_name)=_address.getLover(_x);
    return (_id,_name);
}



}