// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IRandomNumberGenerator {
  function generateRandomNumber () external returns ( uint256 );
  function generateRandomNumberWithLimit (uint256 lessThan ) external returns ( uint256 );
}
