import StringUtils from "StringUtils"

pub fun main(str: String, delimiter: Character): [String] {
    return StringUtils.split(str, delimiter.toString())
}