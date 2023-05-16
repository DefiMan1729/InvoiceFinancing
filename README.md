# Invoice (receivable) Tokenization + NFT Staking 
Asset tokenization is the process of converting physical assets like real estate, fine art, or commodities into digital tokens that can be traded on a blockchain. Asset tokenization enables fractional ownership of assets, making it possible for a broader range of investors to participate in the ownership and investment of high-value physical assets. In this project we have tokenized an Invoice 

This project has two smart contracts

smart contract #1: takes the Invoice details and mints an NFT <p>
smart contract #2: demonstrates a basic Solidity smart contract Vault that can accept an Invoice NFT (ERC721) and mint custom tokens (ERC20) equal to the face value of the Invoice.

We will create a NFT with face value of the Invoice (eg Tax Invoice amount with GST # in India). This unique NFT will be either minted on behalf of the firm, by a virtual asset service provider (it can be self-service also). This unique NFT will represent a tokenised Account Receivable (Invoice). 
The firm can then transfer this NFT, to another smart contarct (a vault which can lock this NFT) to receive ERC20 tokens of equivalent amount. I envisage this ERC20 token can be a wrapped ERC20 based on CBDC, thus allowing efficient SME lending vehicle for the economy. 


Code Mechanics

smart contract #1 in business context:
<p>
<img width="558" alt="image" src="https://github.com/DefiMan1729/InvoiceFinancing/assets/115624087/5ed99443-262e-40bc-b146-b634ff53c709">


smart contract #2 in business context (Vault):
<p>
<img width="462" alt="image" src="https://user-images.githubusercontent.com/115624087/197400441-466f0315-03cb-4599-b9a6-55d381489336.png">


<p>
extended business model
<img width="834" alt="image" src="https://user-images.githubusercontent.com/115624087/202185980-9d599072-361b-4b9b-b74d-35552e47e9f1.png">
<p>
  
![image](https://user-images.githubusercontent.com/115624087/197400157-265d6772-3d96-468c-9dac-4f207f3c3a19.png)

Background on Invoice Financing:

Receivables adds up to the total current assets of a balance sheet. These are the amounts that the customers owe to the business. An outstanding Invoice is a good example of a receivable- an amount that a client owes to the business.
A business (firm), ideally wants to receive payment for all outstanding invoices as soon as possible, to restructure its working capital (Current Assets - Current Liabilities) to have more cash. 

A firm can decide to sell this invoice to another firm (a factor) for cash or take a working capital loan with the Invoice as collateral.

India's e-Invoice workflow
![image](https://user-images.githubusercontent.com/115624087/199880914-55f56ad8-f972-4b02-ba62-5a84466c5825.png)
https://einvoice1.gst.gov.in/Documents/GST_eInvoiceSystemDetailedOverview.pdf



```shell
How to use the code
1. Deploy the NFT (ERC721) and Token (ERC20) contracts or create your own
2. Use the contract addresses of the above contracts to deploy the Vault Contract
------
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
Blog post: https://mirror.xyz/defiman1729.eth/ZbSFXVQSFgro9GYUgCyYJyhoMEJnvYZszGpqcU6e6pU
<p>
Discord: https://discord.gg/kegnJnCZbP
