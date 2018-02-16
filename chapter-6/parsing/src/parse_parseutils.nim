import parseutils

var line = "en Nim_(programming_language) 1 70231"

var i = 0
var domainCode = ""
i.inc parseUntil(line, domainCode, {' '}, i)
i.inc
var pageTitle = ""
i.inc parseUntil(line, pageTitle, {' '}, i)
i.inc
var countViews = 0
i.inc parseInt(line, countViews, i)
i.inc
var totalSize = 0
i.inc parseInt(line, totalSize, i)

doAssert domainCode == "en"
doAssert pageTitle == "Nim_(programming_language)"
doAssert countViews == 1
doAssert totalSize == 70231

echo("Parsed successfully!")
