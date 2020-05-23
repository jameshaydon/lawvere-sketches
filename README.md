# lawvere

- first class theories

sketch a
sketch b

f : theory(a) -> theory(b)

init(a) : theory(a) -> T

init(b) : theory(b) -> T

f . init(b) : theory(a) -> T


init(a) : theory(a) -> T

f . init(b) : theory(a) -> theory(b) -> T


theory lam
theory letlam

i : lam -> letlam

f : letlam -> lam

f . i : lam -> letlam -> lam   ==   id

f is a retract of i

init(lam) : lam -> T
init(letlam) : letlam -> T

init(lam) . f : letlam -> lam -> T

init(letlam) : letlam -> T









