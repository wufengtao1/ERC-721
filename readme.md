
# ERC-721 Deployment Tutorial

This is the beginner guide to creating and deploying a simple ERC-721 smart contract to 
Ethereum's Goerli test network using ChainIDE, MetaMask, and Solidity.
If you have any questions, feel free to join [ChainIDE Discord!](https://discord.gg/QpGq4hjWrh)

Following are the steps to deploy an ERC-721 smart contract:

1. Install MetaMask

2. Write down an ERC-721 smart contract

3. Compile the smart contract

4. Deploy the smart contract

5. NFT Minting

6. Create a flattened file for the smart contract verification

7. Verify the deployed smart contract on Etherscan

### 1. Install MetaMask

When we deploy a smart contract to the blockchain or make a transaction to the deployed smart contract,
we need to pay the gas fee, and for that, we need to have a Web3 wallet, which is MetaMask. 
So, first of all, we'll install MetaMask.

Please click [here](https://metamask.io/) to install MetaMask;
meanwhile, we need to switch the network to Goerli and get test tokens on Goerli.
Click on the Metamask wallet plug-in, log in to the MetaMask wallet,
open the testnet in the settings, and switch to Goerli.

![change to goerli](https://3869740696-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MZ6_j0WUFnBhwIdP3LR%2Fuploads%2F7r8aUlo6Ipety4BPEpyS%2Fimage.png?alt=media&token=6b6a1674-06c3-4309-8e93-3fe453b24e9a)

We can then claim test tokens at the link below.

[https://goerlifaucet.com/](https://goerlifaucet.com/?utm_source=buildspace.so&utm_medium=buildspace_project) 

AMOUNT: 0.1/24 Hours

Finally, make sure your network is switched to Goerli and has at least 0.1 GoerliETH.

![](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/metamask_goerli.png)

### 2. Write down an ERC-721 Smart contract

You need to write down all the required functions that you want to implement in your [ERC-721](https://eips.ethereum.org/EIPS/eip-721) smart contract. 
A general ERC-721 smart contract has the following functions.

-   `balanceOf()`: return by_ The number of NFTs held by the owner

-   `ownerOf()`: returns the address of the token holder

-   `approve():`grant address_ To has_ Token ID control. Approval event needs to be triggered after the method is successful

-   `setApprovalForAll()`: Grant address_ The operator has the control of all NFTs, and the approvalforall event needs to be triggered after success

-   `getApproved()` : Get the approved address for a single NFT

-   `isApprovedForAll()`: Query if an address is an authorized operator for another address

-   `safeTransferFrom()`: To transfer the ownership of an NFT, a successful transfer operation must initiate a transfer event

-   `transferFrom()`: Used to transfer NFTs. After the method succeeds, it needs to trigger the transfer event. The caller confirms himself_ To address can receive NFT normally, otherwise, this NFT will be lost. When this function is implemented, it needs to check whether it meets the judgment conditions

The ChainIDE team has prepared the complete ERC-721 showcase including all the required functions,
you may use that built-in template and add/delete functions according to your requirements.


### 3. Compile an ERC-721 smart contract

Now, you can see the template contract, **GameItem.sol**, that includes all the required functions.

Click on the "Connect wallet" in the upper right corner, select the "Injected Web3 Provider" button,
and then select on MetaMask to connect to the MetaMask wallet (Ethereum Mainnet is the main network,
and Goerli is the test network - connect to Goerli).

![image-20221025152704753](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221025152704753.png)

After you have completed writing down your smart contract, it's time to compile the smart contract. To compile, go to the "Compile" module,
choose an appropriate compiler version according to your source code, and press compile button. After successful compilation, 
an ABI and byte code for the source code will be generated. If there are some errors in your source code,
they woill be displayed under the output panel in the Logger module.
You may need to carefully read the error, resolve it accordingly and compile it again.

**Make a note of the compiler version, license and optimization of your source code,
as it will be required when you validate your smart contract on Goerli.** 

![image-20221025153740380](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221025153740380.png)

### 4. Deploy an ERC-721 Smart Contract

After the compilation is successful, it is time to deploy your compiled ERC-721 smart contract to the Goerli test network.
Go to the "Depoly & Interaction" module, select the contract you want to deploy in the compiled smart contract, and deploy it.

In this tutorial, we will use the GameItem smart contract for deployment.

![image-20221025154832277](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221025154832277.png)

After the deployment is successful, you can see a message in the output section indicating that your smart contract has been successfully deployed.
You can also verify deployed smart contracts on the Goerli testnet. In the "INTERACT" panel, you can see all the functions of the deployed smart contract.

![image-20221025155141914](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221025155141914.png)

### 5. NFT Minting
To mint a digital collection, you need to use the **awarditem function** and use the wallet address of the person you want to airdrop NFT. 
The token URL input field is the corresponding metadata address. Before Minting, you need to generate metadata,
and metadata is stored on decentralized storage that ensures the immutability of the NFT.
To this end, ChainIDE provides two ways to generate metadata.

#### 5.1. Use ChainIDE's built-in HTML to upload metadata to IPFS and get CID.

ChainIDE has prepared a built-in HTML template to upload metadata to IPFS.
Under the explorer panel, you can find the "index.html" file,
and click the preview button on the right side to preview the output of the HTML file,
fill in the required information there and click the "Submit" button. 

![](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/html_preview.png)

After you click the "Submit" button, you will get a CID.
When clicking on the CID and encountering 504, we need to use the method of 5.2 to generate metadata.

![image-20221026143157760](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026143157760.png)

#### 5.2. Use [NFT.STORAGE](https://nft.storage/), a website dedicated to uploading files to IPFS
(Other uploading IPFS sites are also available, such as [Pinata](https://www.pinata.cloud/))
First, prepare the images to be uploaded, such as the ChainIDE logo.

Then enter [NFT.STORAGE](https://nft.storage/), a webpage dedicated to uploading files to IPFS.

Click "Upload" - "Choose File" - select an image and click Upload

![ChainIDE_Logo](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/ChainIDE_Logo.png)

![image-20221026114612844](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026114612844.png)

After the upload is successful, click the CID of the image to see the image stored on IPFS (CID is used to point to the data stored in IPFS).

![image-20221026114800846](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026114800846.png)

Next, we need to generate the JSON format file of metadata.

Metadata format:

```json
{
    "title": "Token Metadata",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this token represents"
        },
        "decimals": {
            "type": "integer",
            "description": "The number of decimal places that the token amount should display - e.g. 18, means to divide the token amount by 1000000000000000000 to get its user representation."
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this token represents"
        },
        "image": {
            "type": "string",
            "description": "A URI pointing to a resource with mime type image/* representing the asset to which this token represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
        },
        "properties": {
            "type": "object",
            "description": "Arbitrary properties. Values may be strings, numbers, object or arrays."
        }
    }
}
```

Let's create a new json file locally, such as: ChainIDE_Logo.json

```json
{
    "name": "ChainIDE",
    "description": "ChainIDE Logo",
    "image": "ipfs://bafkreid2t3wk4gd3xgrg4uqt2jndr5ocwycizjdqyg4tbqayjyobmyun2a",
    "properties": {
        "initials": "c",
        "rarity": "common"
    }
}
```

> name: Fill in the name of the NFT
>
> description: Fill in the introduction of NFT
>
> image: Fill in the image link of the NFT, the format is ipfs:// + CID
>
> properties: Fill in the characteristics of the NFT, the number is not limited
>
> After creation, upload ChainIDE_Logo.json to IPFS.

![image-20221026114612844](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026114612844.png)

After uploading successfully, copy the CID of ChainIDE_Logo.json: bafkreicgankcckmhs7vkcoqq6frzaqz7m7rzz5rqthgmtnxpehhbdivmgi

![image-20221026141422598](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026141422598.png)

#### 5.3. After the metadata is uploaded, return to ChainIDE for mint

Select the **awarditem function**. The player is the address where you want to airdrop the NFT,
tokenURI is the metadata link (the format of the IPFS link is uniformly ipfs://+CID, and the CID of method 2 is used here,
so the link of the ChainIDE Logo is [ipfs://bafkreicgankcckmhs7vkcoqq6frzaqz7m7rzz5rqthgmtnxpehhbdivmgi](ipfs://bafkreicgankcckmhs7vkcoqq6frzaqz7m7rzz5rqthgmtnxpehhbdivmgi), click the "Submit" button.

![image-20221026143329226](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026143329226.png)

After successful minting, you can view your NFT on the OpenSea NFT market. 
Visit [https://testnets.opensea.io/assets/goerli/0xdd1780dbd0dac8e3ad6d3615ec15bc8be67efd72/1](https://testnets.opensea.io/assets/goerli/0xdd1780dbd0dac8e3ad6d3615ec15bc8be67efd72/1) 
(replace 0xdd1780dbd0dac8e3ad6d3615ec15bc8be67efd72 with your contract address, 
which can be copied using the method below), connect to your MetaMask wallet, and make sure the selected network is Goerli, 
you can see NFTs that have been minted successfully on the OpenSea NFT marketplace.

![image-20221026143850860](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026143850860.png)


![image-20221026144009072](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026144009072.png)

### 6. Create a flattened file using the flattener library

To verify a smart contract that imports other smart contracts, we need to create a flattened file,
a flattened file including all the source codes of imported contracts in a single file.
To create a flattened file, you need to activate a "Flattener" plug-in from the "PLUGIN Manager" panel.

![image-20221026144759724](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026144759724.png)

Once the Flatterner plug-in is activated, you'll be able to access it as a separate module, as shown in the figure below. Choose **GameItem.sol**,
and click on the flatten button to create a flattened file; once the flattened file is created, it will be automatically copied to the clipboard;
you may paste it to a file and save it for later usage.

![image-20221026144827135](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026144827135.png)


If you want to save the flattened file, click the save button, and a flattened file will be saved in the current repository.


![image-20221026144906855](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026144906855.png)

  
The saved flattened file can be accessed under the "Explorer" panel.


![image-20221026144952871](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026144952871.png)
  

### 7. Verify a Smart Contract

#### 7.1. Verify the contract through the Etherscan web page

To verify a smart contract, you need to visit [EtherScan](https://goerli.etherscan.io/)
and search for the deployed smart contract using the contract address, or you can click the highlighted button shown in the figure below.

![image-20221026145612886](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026145612886.png)

Click on the verify and publish link shown under the contract section.

![image-20221026145804190](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026145804190.png)

Once you click on the verify and publish link, you will be asked for the following:

- Contract Address: The address of a deployed smart contract that you want to verify

- Compiler Type: Either you want to verify a single file or multiple files

- Compiler Version: The compiler version that you used to compile the smart contract

- License: Open-source license type that you used for your source code

![image-20221026145918989](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026145918989.png)

After that, you need to paste the flattened file you created in step 5,
and make sure that Optimization is on or off during the compilation process,
click OK, and your smart contract will be verified.

![image-20221026150104735](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026150104735.png)

If there are no issues with your smart contract, it would be verified,
and you'll be able to see an image similar to the one that is shown below.


![image-20221026150231798](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221026150231798.png)

Your smart contract is verified.

#### 7.2. Verify the contract through Etherscan API
If you don't want to use the above method, you can also use the API method to verify the contract.

Activate the @chainide/etherscan-verifier plugin from the "PLUGIN MANAGER".

![image-20221027103935634](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027103935634.png)


Click the @chainide/etherscan-verifier plugin in the right column, click the jump icon to go to the etherscan official website

![image-20221027110746690](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027110746690.png)

Select Login or Register on the login page

![image-20221027111355382](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027111355382.png)

Select API Keys

![image-20221027111522996](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027111522996.png)

Click add

![image-20221027111608852](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027111608852.png)

App Name,  enter a name you like and click the "Create New API Key" button.

![image-20221027111744468](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027111744468.png)

In this way, your API Key Token will be generated (be careful not to show it to others, only for your own use); click the icon to copy

![image-20221027111938619](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027111938619.png)

Paste the copied address in the "Etherscan Api Key" field

![image-20221027112048284](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027112048284.png)

Copy the contract address you want to verify 

![image-20221027112115438](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027112115438.png)

After pasting, select "GameItem" in Compiled Contracts, then click the "Verify" button.

![image-20221027112157203](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027112157203.png)

Verification succeeded!

![image-20221027112411803](https://d3gvnlbntpm4ho.cloudfront.net/ERC721+deployment+on+Goerli+Etherum/goerli721.assets/image-20221027112411803.png)

Your smart contract has been verified successfully. Congratulations; you have completed all the content of this tutorial!


