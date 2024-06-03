### Research Bio

I am broadly interested in programming languages and compilers, and do occasional
detours into HPC.

While on postdoc with Milind at Purdue (2023–now), I am looking into making
irregular computations (tree traversals) more efficient via compilation or
algorithm design for recent hardware. Our main topics are:
- functional programming with densely represented datatypes (the [Gibbon
  compiler][gibbon]; e.g. [arXiv:2405.17590][marmoset] to appear at ECOOP'24),
- compilers for sparse tensors computations (e.g. [arXiv:2311.09549][sparseauto], in submission),
- general-purpose computations on ray-tracing hardware (e.g.
  [arXiv:2311.09168][arkade] nominated for **best paper award** at ICS'24).

<!--
- compilers for fully homomorphic encryption (such as [Coyote][coyote]).
-->

During my PhD at Northeastern (2018–2023) and RA at Czech Technical University
(2017–2018), I was assessing the design and implementation of the Julia
programming language ([OOPSLA '18][2], [OOPSLA '21][oopsla21], [VMIL
'23][vmil23]). I'm still looking into Julia's notion of type stability — the
topic of my [PhD dissertation](Papers/2023-dissertation.pdf).

During my teaching appointment at SFedU (2011–2016), I was working on generic
programming techniques ([PCS'15][scala-gp]) and adviced students on topics in
functional programming: datatype-generic programming ([TFP'18
presentation][dgp-recursion-slides] and [draft][dgp-recursion]), monads for
structuring effects ([TMPA'17][parsing-effects]), linear types for expressing
resource management and quantum computing.

During my graduate studies at SFedU (2007–2012, MSc in 2009), I worked on
improving software designs for computer algebra and error-correcting codes in
C++ using generic and metaprogramming ([Prikl.Inf.'11, in
Russian][generic-ecc]).

More on my professional history can be found in my [Curriculum Vitæ](cv.pdf).

[2]: https://www.di.ens.fr/~zappa/projects/lambdajulia/
[rai]: https://www.relational.ai/
[oopsla21]: Projects/stability
[vmil23]: https://doi.org/10.1145/3623507.3623556
[gibbon]: https://iu-parfunc.github.io/gibbon/
[sparseauto]: https://arxiv.org/abs/2311.09549
[coyote]: https://github.com/raghav198/coyote
[marmoset]: https://arxiv.org/abs/2405.17590
[arkade]: https://arxiv.org/abs/2311.09168
[scala-gp]: https://doi.org/10.1134/S0361768815040064
[parsing-effects]: https://doi.org/10.1007/978-3-319-71734-0_8
[dgp-recursion-slides]: https://www.cse.chalmers.se/~myreen/tfp2018/slides/Anna_Bolotina.pdf
[dgp-recursion]: Papers/2018-unpb-dgp-recursion.pdf
[generic-ecc]: Papers/2012-metaprogramming-to-decoding-en.pdf
