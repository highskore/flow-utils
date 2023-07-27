import NonFungibleToken from "NonFungibleToken"
import ExampleNFT from "ExampleNFT"
import MetadataViews from "MetadataViews"

transaction {
    prepare(signer: AuthAccount) {
        let resource <- signer.load<@AnyResource>(from: ExampleNFT.CollectionStoragePath)
        destroy resource
        signer.unlink(ExampleNFT.CollectionPublicPath)
    }
}