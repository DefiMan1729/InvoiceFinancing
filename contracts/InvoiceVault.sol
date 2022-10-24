// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// Interface for the Invoice that will be deposited to get loan
interface IInvoice_NFT is IERC721{
  function getFaceValue(uint256 _tokenid) external returns (uint256);
  function safeDeposit(address _to, uint256 _tokenid) external;
}

// Interface for the token that the depositor will receive
interface ILoan_ERC20 is IERC20{
  function loanMint(address _to,uint256 _faceValue) external;
}

contract InvoiceVault{
    address public manager;
    uint256 public tokenid;
    uint256 faceValue;
    address invoice;
    address loan;
    constructor(address _NFT, address _ERC20){
        invoice =_NFT;
        loan = _ERC20;
        manager = msg.sender;
    }

    function deposit (uint256 _tokenid) public payable{
        IInvoice_NFT(invoice).safeDeposit(manager,_tokenid);
        faceValue = IInvoice_NFT(invoice).getFaceValue(_tokenid);
        ILoan_ERC20(loan).loanMint(msg.sender,faceValue);
    }

}
