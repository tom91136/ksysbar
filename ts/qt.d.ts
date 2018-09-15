

interface Size{
    width : number, height: number
}



interface QtContext{
    exit(retCode : number) : void 
    quit(): void
    size(width : number, height: number) : Size
}


declare var Qt : QtContext

declare function gc() : void