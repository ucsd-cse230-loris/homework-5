COQMFFLAGS := -Q . PLF  

ALLVFILES := Hoare2.v Hoare2Test.v Smallstep.v SmallstepTest.v Stlc.v StlcTest.v Types.v TypesTest.v Sub.v SubTest.v
# Maps.v Imp.v Preface.v Equiv.v Hoare.v Hoare2.v HoareAsLogic.v Smallstep.v Types.v Stlc.v StlcProp.v MoreStlc.v Sub.v Typechecking.v Records.v References.v RecordSub.v Norm.v PE.v Postscript.v Bib.v LibTactics.v UseTactics.v UseAuto.v  MapsTest.v  ImpTest.v  PrefaceTest.v  EquivTest.v  HoareTest.v  Hoare2Test.v  HoareAsLogicTest.v  SmallstepTest.v  TypesTest.v  StlcTest.v  StlcPropTest.v  MoreStlcTest.v  SubTest.v  TypecheckingTest.v  RecordsTest.v  ReferencesTest.v  RecordSubTest.v  NormTest.v  PETest.v  PostscriptTest.v  BibTest.v  LibTacticsTest.v  UseTacticsTest.v  UseAutoTest.v

.PHONY: build
build: Makefile.coq
	$(MAKE) -f Makefile.coq

.PHONY: clean
clean::
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq cleanall; fi
	$(RM) $(wildcard Makefile.coq Makefile.coq.conf) 

Makefile.coq:
	coq_makefile $(COQMFFLAGS) -o Makefile.coq $(ALLVFILES)

.PHONY: autograde
autograde: Hoare2.vo Smallstep.vo Stlc.vo Types.vo Sub.vo
	coqc -Q . PLF Hoare2Test.v
	coqc -Q . PLF SmallstepTest.v
	coqc -Q . PLF StlcTest.v
	coqc -Q . PLF TypesTest.v
	coqc -Q . PLF SubTest.v

.PHONY: turnin
turnin:
	git add .
	git commit -m "turnin"
	git push -u origin main

-include Makefile.coq
