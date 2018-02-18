import macros

proc createRefType(ident: NimIdent, identDefs: seq[NimNode]): NimNode =
    result = newTree(nnkTypeSection,
        newTree(nnkTypeDef,
            newIdentNode(ident),
            newEmptyNode(),
            newTree(nnkRefTy,
                newTree(nnkObjectTy,
                    newEmptyNode(),
                    newEmptyNode(),
                    newTree(nnkRecList, identDefs)
                )
            )
        )
    )

proc toIdentDefs(stmtList: NimNode): seq[NimNode] =
    expectKind(stmtList, nnkStmtList)
    result = @[]

    for child in stmtList:
        expectKind(child, nnkCall)
        result.add(newIdentDefs(child[0], child[1][0]))

template constructor(ident: untyped): untyped =
    proc `new ident`(): `ident` =
        new result

macro config(typeName: untyped, fields: untyped): untyped =
    let identDefs = toIdentDefs(fields)
    result = newStmtList()
    result.add createRefType(typeName.ident, identDefs)
    result.add getAst(constructor(typeName.ident))

    echo treeRepr(result)
    echo repr(result)

config MyAppConfig:
    address: string
    port: int
