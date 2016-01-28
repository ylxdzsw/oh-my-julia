Base.map(f::Function) = (x) -> map(f,x)
Base.map!(f::Function) = (x) -> map!(f,x)
Base.reduce(f::Function) = (x) -> reduce(f,x)
Base.filter(f::Function) = (x) -> filter(f,x)
Base.filter!(f::Function) = (x) -> filter!(f,x)
