// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
contract Create2Deployer {
  
  /**
     * @dev determine the address of non-deployed contract 
     * @param code - contract bytecode
     * @param salt - an arbitrary value/nonce provided by the sender
     */
function deploy(bytes memory code, uint256 salt) public returns (address){
    address addr;
    assembly {
      addr := create2(0, add(code, 0x20), mload(code), salt)
      if iszero(extcodesize(addr)) {
        revert(0, 0)
      }
    }
    return addr;
  }
}
