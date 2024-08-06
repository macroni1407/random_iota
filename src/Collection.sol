// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Item, Type, ResultItem} from './type/PodType.sol';
import "./interfaces/IPod.sol";
import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol"; 

contract Collection is ERC721{
  using Strings for uint256;
  IPod pod;
  string baseUrl;
  mapping(uint256 => string) private _tokenURIs;

  uint256 tokenId = 1;

  constructor(string memory name_, string memory symbol_, string memory _baseUrl, address _pod) ERC721(name_, symbol_){
    baseUrl = _baseUrl;
    pod = IPod(_pod);
  }

  function mint(address _to, uint256 _itemId, Type _type, uint256 _rate) public {
    require(pod.ownerOf(_itemId) == _to, "Not authorize");
    string memory model = _getModel(_type);
    string memory tokenUrl = string.concat(baseUrl, model, _rate.toString(), tokenId.toString());
    _mint(_to, tokenId);
    _setTokenURI(tokenId, tokenUrl);
    ++tokenId;
  }

  function tokenURI(uint256 _tokenId) public view override returns (string memory) {
      require(_tokenId > 0 && _tokenId < tokenId, "ERC721Metadata: URI query for nonexistent token");
      return _tokenURIs[_tokenId];
  }

  function _setTokenURI(uint256 _tokenId, string memory tokenUrl) internal virtual {
      require(_tokenId > 0 && _tokenId < tokenId, "ERC721Metadata: URI set of nonexistent token");
      _tokenURIs[_tokenId] = tokenUrl;
  }

  function _getModel(Type types) internal pure returns (string memory){
    if(types == Type.K9){
      return "K9";
    } else if(types == Type.SEELS){
      return "SEELS";
    }
  }
}