# Vildana Tabaković 18968, Berina Zejnilović 18805

using Pkg
import Pkg
Pkg.add("JuMP")

import Pkg
Pkg.add("GLPK")

using JuMP, GLPK

#PRVI ZADATAK (predavanja)
#stranica 3, kafice

m = Model(GLPK.Optimizer)
@variable(m, x1>=0)
@variable(m, x2>=0)
@objective(m, Max, 3x1 + 2x2)
@constraint(m, constraint1, 0.5x1 + 0.3x2 <= 150)
@constraint(m, constraint2, 0.1x1 + 0.2x2 <= 60)
print(m)
optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))

#stranica 24, poluravni

m = Model(GLPK.Optimizer)
@variable(m, x1>=0)
@variable(m, x2>=0)
@objective(m, Max, 3x1 + 5x2)
@constraint(m, constraint1, x1 <= 4)
@constraint(m, constraint2, 2x1 <= 12)
@constraint(m, constraint3, 3x1 + 2x2 <= 18)
@constraint(m, constraint4, x1 + 3x2 <= 21)
@constraint(m, constraint5, 2x1 + 3x2 >= 6)
print(m)
optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))

#stranica 28, pretraživanje vrhova dopustivog prostora

m = Model(GLPK.Optimizer)
@variable(m, x1>=0)
@variable(m, x2>=0)
@variable(m, x3>=0)
@objective(m, Min, 100x1 + 200x2 + 300x3)
@constraint(m, constraint1, 25x1 + 20x2 + 40x3 >= 1000)
@constraint(m, constraint2, 2x1 + 4x2 + 5x3 <= 500)
print(m)
optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("x3 = ", value(x3))
println("Vrijednost cilja:")
println(objective_value(m))

#DRUGI ZADATAK(ZSR)
#stranica 2, slatkisi

m = Model(GLPK.Optimizer)
@variable(m, x1>=0)
@variable(m, x2>=0)
@objective(m, Max, 2x1 + 4x2)
@constraint(m, constraint1, x1 <= 3)
@constraint(m, constraint2, x2 <= 6)
@constraint(m, constraint3, 3x1 + 2x2 <= 18)
print(m)
optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))

#stranica 2, fabrika proizvodnja

m = Model(GLPK.Optimizer)
@variable(m, x1>=0)
@variable(m, x2>=0)
@objective(m, Max, 3x1 + 7x2)
@constraint(m, constraint1, x1 <= 10)
@constraint(m, constraint2, x2 <= 9)
@constraint(m, constraint3, 0.25x1 + 0.75x2 <= 20)
print(m)
optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))

#stranica 9, ugalj

m = Model(GLPK.Optimizer)
@variable(m, x1>=0)
@variable(m, x2>=0)
@variable(m, x3>=0)
@objective(m, Min, 100x1 + 120x2 + 130x3)
@constraint(m, constraint1, x1 + x2 + x3 >= 600)
@constraint(m, constraint2, 0.03x1 + 0.06x2 + 0.18x3 == 0.15)
print(m)
optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("x3 = ", value(x3))
println("Vrijednost cilja:")
println(objective_value(m))