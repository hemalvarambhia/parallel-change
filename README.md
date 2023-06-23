## Parallel Change Kata

### What is Parallel Change?

Also known as Expand and Contract, this is a pattern that can be used to evolve a design safely by introducing 
backwards compatible changes to a software design without breaking existing 
clients of code. It involves three steps:

1. expand (add the new element - class, method, variable);
2. migrate (clients of the existing element to use the new one introduced in step 1); and
3. contract (remove the old element - class, method, variable)

A more detailed discussion of the pattern, with examples, may be found in
[Danilo Sato's article on Parallel Change](https://martinfowler.com/bliki/ParallelChange.html).

## Your Task
Change the class ShoppingCart in the package field.

The class should be handle multiple int items instead of a single one.

Tests have already been written.

## Rules
The tests must not be red at any time. No compile-errors, no failures. (The only exception is for a few seconds while you write a single line of code.)
