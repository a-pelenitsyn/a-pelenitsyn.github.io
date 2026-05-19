---
title: Home
---

<div class="flex flex-col sm:flex-row border border-solid border-gray-200 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 mb-4">
<div class="bio-photo p-2 border-0 border-solid border-b sm:border-b-0 sm:border-r border-gray-200 dark:border-gray-600 flex justify-center items-center">
<img src="images/Brazil-2014.jpg" height="250" class="block" />
</div>
<div class="p-2 flex-1">
<p><b>Current Position:</b> Postdoc Researcher with
<a href="https://engineering.purdue.edu/~milind/">Prof. Milind&nbsp;Kulkarni</a>
at Purdue University (<a href="https://purduepl.github.io/">PurPL</a>).
<p><b>Education:</b> PhD in Computer Science from
Northeastern University (<a href="https://prl.khoury.northeastern.edu/">NEU PRL</a>, 2023).
<p><b>Contacts:</b> a&#8203;@&#8203;pelenitsyn.top, <a href="https://calendly.com/artem-pe/chat">Calendly</a>.</p>
<p>
<b>Professional links:</b>
<span class="text-3xl whitespace-nowrap">
  <a href="https://scholar.google.com/citations?user=my1k3PQAAAAJ" title="Google Scholar" rel="external nofollow noopener" target="_blank"><i class="ai ai-google-scholar ai-lg align-middle"></i></a>&nbsp;
  <a href="https://github.com/ulysses4ever/cv/releases/download/head/cv.pdf" title="CV" rel="external nofollow noopener" target="_blank"><i class="ai ai-cv ai-lg align-middle"></i></a>&nbsp;
  <a href="https://orcid.org/0000-0001-8334-8106" title="ORCID" rel="external nofollow noopener" target="_blank"><i class="ai ai-orcid align-middle"></i></a>&nbsp;
  <a id="github-link" class="icon" title="Github Account" aria-label="Github Account"
      href="https://github.com/ulysses4ever">
      <i class="fab fa-github align-middle"></i></a>
</span>
</p>
<p>
<b>Social links:</b>
<span class="text-xl whitespace-nowrap">
  <a id="twitter-link" class="icon no-underline" title="Twitter Account" aria-label="Twitter Account"
      href="https://x.com/ulysses4ever">
      <i class="fab fa-x-twitter inline-block align-middle"></i>
      </a>&nbsp;
  <a id="facebook-link" class="icon no-underline" title="Facebook Profile" aria-label="Facebook Profile"
      href="https://www.facebook.com/ulysses4ever">
      <i class="fab fa-facebook align-middle"/>
      </a>&nbsp;
  <a id="telegram-link" class="icon no-underline" title="Telegram Channel" aria-label="Telegram Channel"
      href="https://t.me/arpel">
      <i class="fab fa-telegram align-middle"></i>
      </a>&nbsp;
  <a rel="me" id="mastodon-link" class="icon no-underline" href="https://functional.cafe/@artem">
      <i class="fab fa-mastodon align-middle"></i>
      </a>&nbsp;
  <a class="icon no-underline" href="https://bsky.app/profile/pelenitsyn.top">
      <i class="fab fa-bluesky align-middle"></i>
      </a>
</span>
</p>
</div>
</div>

<!-- <p><b>Alma mater:</b> <a href="http://sfedu.ru/index_eng.php">Southern Federal University</a>,
I.I. Vorovitch Institute of Mathematics, Mechanics and Computer Sciences
(<a href="http://mmcs.sfedu.ru">MMCS, Мехмат</a>). -->

<!-- <img src="/images/haskell-logo.png" style="float: right; margin: 10px;" /> -->

### Latest News ([all news](/news.html))

$partial("templates/news-list.html")$


### Research

I am broadly interested in programming languages and compilers with an angle to performance assurance.
The central motif of my research has been enabling efficient high-level programming whether through types, memory layouts, or utilizing modern hardware.
My professional experience is laid out in my [Curriculum Vitæ](https://github.com/ulysses4ever/cv/releases/download/head/cv.pdf),
and the list of academic publications is available on [Google Scholar](https://scholar.google.com/citations?user=my1k3PQAAAAJ).

<details>
<summary>Research Bio</summary>
While on postdoc with Milind at Purdue (2023–now), I am looking into making
irregular computations (tree traversals) more efficient via compilation or
algorithm design for recent hardware. Our main topics are:

- functional programming with densely represented datatypes with the [Gibbon
  compiler][gibbon] (e.g. [Marmoset (ECOOP '24)][marmoset] and [Gibbon-GC (ISMM'24)][gibbon-ismm24]),
- compilers for sparse tensors computations (e.g. [SparseAuto (OOPSLA'24)][sparseauto]),
- general-purpose computations on ray-tracing hardware (e.g.
  [Arkade (ICS'24)][arkade] — **best paper award**).

During my PhD at Northeastern (2018–2023) and RA at Czech Technical University
(2017–2018), I was assessing the design and implementation of the Julia
programming language ([OOPSLA '18][2], [OOPSLA '21][oopsla21], [VMIL
'23][vmil23]). I'm still looking into Julia's notion of type stability — the
topic of my [PhD dissertation][thesis].

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

</details>

[thesis]: https://a.pelenitsyn.top/Papers/Papers/2023-dissertation.pdf
[2]: https://www.di.ens.fr/~zappa/projects/lambdajulia/
[rai]: https://www.relational.ai/
[vmil23]: https://doi.org/10.1145/3623507.3623556
[gibbon]: https://iu-parfunc.github.io/gibbon/
[marmoset]: https://doi.org/10.4230/LIPIcs.ECOOP.2024.38
[scala-gp]: https://doi.org/10.1134/S0361768815040064
[parsing-effects]: https://doi.org/10.1007/978-3-319-71734-0_8
[dgp-recursion-slides]: https://www.cse.chalmers.se/~myreen/tfp2018/slides/Anna_Bolotina.pdf
[arkade]: https://a.pelenitsyn.top/Papers/2024-ICS-arkade-knn-rtcore.pdf
[dgp-recursion]: https://a.pelenitsyn.top/Papers/2018-unpb-dgp-recursion.pdf
[generic-ecc]: https://a.pelenitsyn.top/Papers/2012-metaprogramming-to-decoding-en.pdf
[sparseauto]: https://a.pelenitsyn.top/Papers/2024-OOPSLA-sparseauto.pdf
[gibbon-ismm24]: https://a.pelenitsyn.top/Papers/2024-gibbon-gc.pdf 
[oopsla21]: /Projects/stability

### Programming

I'm passionate about functional programming and Haskell in particular.
I have been using Haskell now and then since about 2011.
Lately, my two main Haskell-related endeavors are:

- [maintaining Cabal][cabal] library and build tool for Haskell,
- maintaining a community version of the popular Haskell textbook [_Learn You  a Haskell for Great Good!_](https://github.com/learnyouahaskell/learnyouahaskell.github.io)

My past contributions to the Haskell ecosystem include [patching GHC][ghc], the main Haskell compiler, and
developing a prototype bridge between GHC and the Bazel build system during [my internship at Tweag][4].

<details>
<summary>More technical interests</summary>

More generally, I'm interested in programming (or, more generally, “software”) languages as they
pertain to software and systems, including 

- programming languages' ecosystems (especially, Haskell and Julia ones),
- build systems, such as Cabal and Bazel, and software package managers, especially the Nix package manager and NixOS,
- verified software via interactive theorem provers and dependent types, such as Coq, Agda, and Idris,
- reproducible research and related virtualization and containerization technologies (Docker, etc.),
- modal editing (in the spirit of `vi`) and (Doom) Emacs, Linux and Open Source Software.

[ghc]: https://github.com/ghc/ghc/search?o=desc&q=author%3Aulysses4ever&s=committer-date&type=Commits
[cabal]: https://github.com/haskell/cabal/blob/master/MAINTAINERS.md
[4]: https://www.tweag.io/blog/2019-09-25-bazel-ghc-persistent-worker-internship/
