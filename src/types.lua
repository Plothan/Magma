export type Symbol = {type : string, content : string}

export type _update = (any?, any?) -> ()
export type get = () -> (any)
export type use = (object : ReGem | Gem) -> (any)

export type Gem = {
    type : string,
        
    _protectType : boolean?,
    _value : any | Symbol,
    _dependentSet : {},
    _update : _update,
    get : get,
    set : (any) -> (string?)
}

export type ReGem = {
    type : string,

    _destructor : (object : any) -> (),
    _callback : (use) -> (any),
    _value : any | Symbol,
    _dependencySet : ReGem | Gem,
    _dependentSet : ReGem | Gem,
    _update : _update,
    get : get

}

export type Listener = {
    type : string,

    _connections : {},
    _dependency : ReGem | Gem,
    _update : _update,
    onChange : (any, any) -> (() -> ()),
    onBind : (any, any) -> (() -> ()),
}


return {1}