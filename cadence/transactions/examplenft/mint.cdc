import NonFungibleToken from "NonFungibleToken"
import ExampleNFT from "ExampleNFT"
import MetadataViews from "MetadataViews"


transaction(recipient: Address) {
    // local variable for storing the minter reference
    let minter: &ExampleNFT.NFTMinter

    prepare(acct: AuthAccount) {
        // borrow a reference to the NFTMinter resource in storage
        self.minter = acct.borrow<&ExampleNFT.NFTMinter>(from: /storage/exampleNFTMinter)
            ?? panic("Could not borrow a reference to the NFT minter")
    }

    execute {
        let receiver = getAccount(recipient).getCapability<&{NonFungibleToken.CollectionPublic}>(ExampleNFT.CollectionPublicPath).borrow()!
        self.minter.mintNFT(recipient: receiver, name: "testname", description: "descr", thumbnail: "image.html", royalties: [])
    }
}
