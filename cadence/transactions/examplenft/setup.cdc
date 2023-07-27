import NonFungibleToken from "NonFungibleToken"
import ExampleNFT from "ExampleNFT"
import MetadataViews from "MetadataViews"

transaction {

    prepare(signer: AuthAccount) {

        // Return early if the account already stores a ExampleToken Vault
        if signer.borrow<&AnyResource>(from: ExampleNFT.CollectionStoragePath) != nil {
            return
        }

        // Create a new ExampleToken Vault and put it in storage
        signer.save(
            <-ExampleNFT.createEmptyCollection(),
            to: ExampleNFT.CollectionStoragePath
        )

        // Create a public capability to the Vault that only exposes
        // the balance field through the Balance interface
        signer.link<&ExampleNFT.Collection{NonFungibleToken.CollectionPublic, ExampleNFT.ExampleNFTCollectionPublic, MetadataViews.ResolverCollection}>(
            ExampleNFT.CollectionPublicPath,
            target: ExampleNFT.CollectionStoragePath
        )
    }
}