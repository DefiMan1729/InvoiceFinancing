// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IInvoice {
function safeTransferFrom(address _from, address _to, uint256 _x) external;
function getFace(uint256 _x) external view returns(uint256);
}

contract InvoiceVault is ERC20,Ownable{
    IERC721 public immutable token;
    IInvoice public immutable II;
    address public manager;
    uint256 public tokenid;

    constructor(address _token) ERC20("InvoiceFactor", "INV") {
        token = IERC721(_token);
        II = IInvoice(_token);
        manager = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
    function getBalToken(address _adr) public view returns(uint256){
        return balanceOf(_adr);
    }

    function getFV(address _adr, uint256 _x) public view returns(uint256){
        return IInvoice(_adr).getFace(_x);
    }

    function deposit(uint256 _tokenid) public payable{
        token.safeTransferFrom(msg.sender, manager, _tokenid);
        mint(msg.sender,II.getFace(_tokenid));
    }

}
