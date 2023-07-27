import StringUtils from "StringUtils"

pub fun main(strs: [String], separator: String): String {
    return StringUtils.join(strs, separator)
}