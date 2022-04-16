open System

let cort_in =
    let x = Convert.ToInt32(Console.ReadLine())
    let y = Convert.ToInt32(Console.ReadLine())
    (x,y)

// НОД
let rec findGC_Division x y =
    if x = 0 || y = 0 then x + y
    else findGC_Division (if x > y then x % y else x) (if y >= x then y % x else y)

// Взаимно простые или нет
let is_GCD x y = if findGC_Division x y = 1 then true else false
let is_not_GCD x y = if is_GCD x y then false else true 

// Простое
let is_simple x = 
    let rec i_s i =
        if i = 1 || i = 0 then true
        elif x % i = 0 then false
        else i_s (i-1)
    if x = 1 then true
    else i_s (x-1)

// Не простое
let is_not_simple x = if is_simple x then false else true

// Общая функция обработки числа
let funct x f1 f2 f3 pr1 pr2 pr3 pr4 ini i =
    let rec func x ini i =
        if pr4 x i then ini 
        elif pr1 x i && pr2 x i && pr3 x i then func (f1 x) (f2 ini i) (f3 i)
        else func (f1 x) ini (f3 i)
    func x ini i

// Сумма простых цифр числа
let m0 x = funct x (fun x -> x/10) (fun x y -> x + y % 10) (fun i -> i / 10) (fun x y -> is_simple (x % 10)) (fun x y -> true) (fun x y -> true) (fun x y -> x = 0) 0 x

let m1 x = funct x (fun x -> x) (fun x y -> x + y) (fun x -> x + 1) (fun x y -> is_not_simple y) (fun x y -> x % y = 0) (fun x y -> true) (fun x y -> y > x) 0 1
let m2 x = funct x (fun x -> x/10) (fun x y -> x + 1) (fun i -> i) (fun x y -> x % 10 < 3) (fun x y -> true) (fun x y -> true) (fun x y -> x = 0) 0 1
let m3 x = funct x (fun x -> x) (fun x y -> x + 1) (fun x -> x + 1) (fun x y -> x % y <> 0) (fun x y -> is_not_GCD x y) (fun x y -> is_GCD (m0 x) x) (fun x y -> y > x) 0 1

let G_function cort =
    match cort with
    | (1,x) -> Convert.ToString(m1 x)
    | (2,x) -> Convert.ToString(m2 x)
    | (3,x) -> Convert.ToString(m3 x)
    | _ -> "Нет такой функции"

[<EntryPoint>]
let main argv =
    let (x,y) = cort_in
    printfn "%A" (G_function (x,y))
    (G_function >> printfn "%A") (x,y)
    0 