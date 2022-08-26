export type Symbol = {type : string, content : string}

export type Gem = {
    type : string,
        
    _protectType : boolean,
    _value : any | Symbol,
    _dependentSet : {}
}

export type ReGem = {
    type : string,

    _destructor : (object : any) -> (),
    _callback : () -> (any),
    _value : any | Symbol,
    _dependencySet :{},
    _dependentSet : {}
}


--[[
    BIG TODOS:
    add typings for the listener object

    add typings for the objects' methods
]]