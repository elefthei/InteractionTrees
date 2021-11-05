(** * More facts about eutt *)

(** ... that have been added recently and I don't know where to put. *)

(* TODO: Figure out some way to organize Eq/UpToTaus.v and Eq/Eq.v *)

Lemma eutt_subrel : forall (E : Type -> Type) (A B : Type) (R1 R2 : A -> B -> Prop)
                           (ta : itree E A) (tb : itree E B),
    (forall a b, R1 a b -> R2 a b) -> eutt R1 ta tb -> eutt R2 ta tb.
Proof.
  intros.
  eapply eqit_mon; eauto.
Qed.

Lemma eutt_flip : forall (E : Type -> Type) (A B : Type) (R : A -> B -> Prop)
                         (ta : itree E A) (tb : itree E B),
    eutt R ta tb -> eutt (flip R) tb ta.
Proof.
  intros. apply eqit_flip. 
  eapply eutt_subrel with (R1 := R); eauto.
Qed.
