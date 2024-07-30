// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import {Item, Type} from './type/PodType.sol';

contract Pod is ERC721, Ownable{
  uint256 public itemId;

  mapping(uint256 itemId => Item[] items) public itemInfo;

  constructor(address _initialOwner, string memory _name, string memory _symbol) Ownable(_initialOwner) ERC721(_name, _symbol){
  }

  function mint (Item[] memory _items, address _reciever) external onlyOwner{
    ++itemId;
    Item[] storage items = itemInfo[itemId];
    for (uint256 i = 0; i < _items.length; i++) {
        items.push(_items[i]);
    }
    _mint(_reciever, itemId);
  }

  function getItems(uint256 _itemId) external view returns (Item[] memory){
    return itemInfo[_itemId];
  }
}
