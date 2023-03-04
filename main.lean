import Init.Data.Nat.Basic

#eval "Hello, world!"

def m : Nat := 1
#check 1

#check Nat ⊕ Nat

#check fun (α β γ : Type) (g : β → γ) (f : α → β) (x : α) => g (f x)

open Classical

variable (p: Prop)
#check em p

def double (x : Nat) : Nat := x * x
def add (x y : Nat) : Nat := x + y

variable (p q : Prop)

def Set (α : Type u) := α → Prop

namespace Set

def mem (x : α) (a : Set α) := a x
infix:50 (priority := high) "∈" => mem

theorem setext {a b : Set α} (h : ∀ x, x ∈ a ↔ x ∈ b) : a = b :=
funext (fun x => propext (h x))

def empty : Set α := fun x => False
notation (priority := high) "∅" => empty

def inter (a b : Set α) : Set α := fun x => x ∈ a ∧ x ∈ b
infix:70 " ∩ " => inter

end Set

