---
title: Home
---

<table cellspacing="6px">
<tr>
<td>
    <img style="vertical-align:center" src="images/Brazil-2014.jpg" height="250" border="0" />
</td>
<td valign="top">
<p><b>Current Position:</b> Postdoc Researcher with
<a href="https://engineering.purdue.edu/~milind/">Prof. Milind&nbsp;Kulkarni</a>
at <a href="https://purduepl.github.io/">PurPL</a>, Purdue University.
<p><b>Education:</b> PhD in Computer Science from
Northeastern University (<a href="https://prl.khoury.northeastern.edu/">NEU PRL</a>, 2023).
<p><b>Contacts:</b> a&#8203;@&#8203;pelenitsyn.top, <a href="https://calendly.com/artem-pe/chat">Calendly</a>.
<p><b>Professional links:</b>
  <a href="https://scholar.google.com/citations?user=my1k3PQAAAAJ" title="Google Scholar" rel="external nofollow noopener" target="_blank"><i class="ai ai-google-scholar ai-lg"></i></a>&nbsp;
  <a href="https://github.com/ulysses4ever/cv/releases/download/head/cv.pdf" title="CV" rel="external nofollow noopener" target="_blank"><i class="ai ai-cv ai-lg"></i></a>&nbsp;
  <a href="https://orcid.org/0000-0001-8334-8106" title="ORCID" rel="external nofollow noopener" target="_blank"><i class="ai ai-orcid"></i></a>
</p>
<p><b>Social links:</b>
  <a id="twitter-link" class="icon" title="Twitter Account" aria-label="Twitter Account"
      href="https://x.com/ulysses4ever">
      <img src="https://unpkg.com/@tabler/icons@3.35.0/icons/outline/brand-x.svg" /></a>&nbsp;
  <a id="facebook-link" class="icon" title="Facebook Profile" aria-label="Facebook Profile"
      href="https://www.facebook.com/ulysses4ever">
      <img src="https://unpkg.com/@tabler/icons@3.35.0/icons/outline/brand-facebook.svg" /></a>&nbsp;
  <a id="telegram-link" class="icon" title="Telegram Channel" aria-label="Telegram Channel"
      href="https://t.me/arpel">
      <img src="https://unpkg.com/@tabler/icons@3.35.0/icons/outline/brand-telegram.svg" /></a>&nbsp;
  <a id="github-link" class="icon" title="Github Account" aria-label="Github Account"
      href="https://github.com/ulysses4ever">
      <img src="https://unpkg.com/@tabler/icons@3.35.0/icons/outline/brand-github.svg" /></a>&nbsp;
  <a rel="me" id="mastodon-link" class="icon" href="https://functional.cafe/@artem">
      <img src="https://unpkg.com/@tabler/icons@3.35.0/icons/outline/brand-mastodon.svg" /></a>
</p>
</td>
</tr>
</table>

<!-- <p><b>Alma mater:</b> <a href="http://sfedu.ru/index_eng.php">Southern Federal University</a>,
I.I. Vorovitch Institute of Mathematics, Mechanics and Computer Sciences
(<a href="http://mmcs.sfedu.ru">MMCS, Мехмат</a>). -->

<!-- <img src="/images/haskell-logo.png" style="float: right; margin: 10px;" /> -->

**🇺🇦 As a Russian national, I strongly condemn the war started by the&nbsp;Russian government in
Ukraine on February 24th 2022.**

### Latest News ([all news](/news.html))

$partial("templates/news-list.html")$


### Research Interests & Bio

I am broadly interested in programming languages and compilers, and do occasional
detours into HPC. The central motif of my research has been enabling efficient high-level programming.
More on my professional experience is in my [Curriculum Vitæ](https://github.com/ulysses4ever/cv/releases/download/head/cv.pdf).

While on postdoc with Milind at Purdue (2023–now), I am looking into making
irregular computations (tree traversals) more efficient via compilation or
algorithm design for recent hardware. Our main topics are:

- functional programming with densely represented datatypes with the [Gibbon
  compiler][gibbon] (e.g. [Marmoset (ECOOP '24)][marmoset] and [Gibbon-GC (ISMM'24)][gibbon-ismm24]),
- compilers for sparse tensors computations (e.g. [SparseAuto (OOPSLA'24)][sparseauto]),
- general-purpose computations on ray-tracing hardware (e.g.
  [Arkade (ICS'24)][arkade] — **best paper award**).

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

[2]: https://www.di.ens.fr/~zappa/projects/lambdajulia/
[rai]: https://www.relational.ai/
[oopsla21]: Projects/stability
[vmil23]: https://doi.org/10.1145/3623507.3623556
[gibbon]: https://iu-parfunc.github.io/gibbon/
[sparseauto]: Papers/2024-OOPSLA-sparseauto.pdf
[coyote]: https://github.com/raghav198/coyote
[marmoset]: https://doi.org/10.4230/LIPIcs.ECOOP.2024.38
[arkade]: Papers/2024-ICS-arkade-knn-rtcore.pdf
[scala-gp]: https://doi.org/10.1134/S0361768815040064
[parsing-effects]: https://doi.org/10.1007/978-3-319-71734-0_8
[dgp-recursion-slides]: https://www.cse.chalmers.se/~myreen/tfp2018/slides/Anna_Bolotina.pdf
[dgp-recursion]: Papers/2018-unpb-dgp-recursion.pdf
[generic-ecc]: Papers/2012-metaprogramming-to-decoding-en.pdf
[gibbon-ismm24]: Papers/2024-gibbon-gc.pdf 

### Technical Interests

I'm interested in programming (or, more generally, “software”) languages as they
pertain to software and systems, e.g.
programming languages' ecosystems (especially, Haskell and Julia's ones),
build systems and software package managers (especially, the Nix package manager and NixOS),
verified software via interactive theorem provers and dependent types (Coq, Agda, Idris),
modal editing (in the spirit of `vi`) and (Doom) Emacs, Linux and Open Source Software.
Check out:

* My contributions to the [GHC Haskell compiler][ghc] and the [Cabal package
  manager][cabal] — the pillars of Haskell ecosystem (fun fact: I'm one of the Cabal
  maintainers currently).
* [Blog post about my internship at Tweag I/O in 2019][4] where I developed a bridge between GHC and the Bazel build system.

[ghc]: https://github.com/ghc/ghc/search?o=desc&q=author%3Aulysses4ever&s=committer-date&type=Commits
[cabal]: https://github.com/haskell/cabal/search?o=desc&q=author%3Aulysses4ever&s=committer-date&type=Commits
[4]: https://www.tweag.io/blog/2019-09-25-bazel-ghc-persistent-worker-internship/
