// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Item, ResultItem} from '../type/PodType.sol';

interface IPod {
  function mint (address user, Item[] memory _items) external;
  function openPod(uint256 _itemId) external;
  function getItems(uint256 _itemId) external view returns (Item[] memory);
  function getResultItems(address user) external view returns(ResultItem[] memory);
  function ownerOf ( uint256 tokenId ) external view returns ( address );
  
}
