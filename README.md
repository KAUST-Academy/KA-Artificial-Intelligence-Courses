# Artificial-Intelligence-Courses

The source repository for all **KAUST Academy** Artificial Intelligence courses — LaTeX/Beamer
lecture decks, their built PDFs, and the accompanying Jupyter lab notebooks, homeworks and exams.

| | |
|---|---|
| **Courses** | 5 |
| **Lecture decks** | 64 (`.tex` sources + built PDFs) |
| **Slides** | ~4,800 pages |
| **Notebooks** | 291 (labs, homeworks, exams) |
| **License** | GPL-3.0 |

---

# For students and instructors

## Courses

Built PDFs live in `Lectures/<Course>/`; the LaTeX sources that produce them live in
`LaTeX/<Course>/`. Notebooks for each course live in `Labs/<Course>/`.

| Course | Decks | Pages | Slides | Notebooks |
|---|---:|---:|---|---|
| Computer Vision | 24 | 1,964 | [`Lectures/Computer_Vision`](Lectures/Computer_Vision) | [56](Labs/Computer_Vision) |
| Natural Language Processing | 21 | 1,530 | [`Lectures/Natural_Language_Processing`](Lectures/Natural_Language_Processing) | [46](Labs/Natural_Language_Processing) |
| Reinforcement Learning | 10 | 710 | [`Lectures/Reinforcement_Learning`](Lectures/Reinforcement_Learning) | [36](Labs/Reinforcement_Learning) |
| Introduction to AI | 8 | 552 | [`Lectures/Introduction_To_AI`](Lectures/Introduction_To_AI) | [24](Labs/Introduction_To_AI) |
| Generative AI | 1 | 92 | [`Lectures/Generative_AI`](Lectures/Generative_AI) | — |

<details>
<summary><b>Computer Vision</b> — 24 decks</summary>

| # | Deck | Pages |
|---|---|---:|
| 01 | Introduction to Computer Vision & CNNs | 100 |
| 02 | Practical Deep Learning | 64 |
| 03 | Classic Deep CNN Architectures | 71 |
| 04 | Object Detection | 141 |
| 05 | Image Segmentation | 93 |
| 06 | Recurrent Neural Networks | 53 |
| 07 | Transformers | 42 |
| 08 | Vision Transformers | 40 |
| 09 | Deep Unsupervised Learning | 117 |
| 10 | Autoencoders & Variational Autoencoders | 147 |
| 11 | Autoregressive Models | 90 |
| 12 | Normalizing Flow Models | 81 |
| 13 | Generative Adversarial Networks (GANs) | 125 |
| 14 | Diffusion Models | 94 |
| 15 | Advanced Image Generation Models | 66 |
| 16 | Stable Diffusion | 82 |
| 17 | Learning from Videos | 112 |
| 18 | Video Generation & World Models | 51 |
| 19 | Self-Supervised Learning | 51 |
| 20 | Contrastive Learning Methods | 71 |
| 21 | Vision and Text Integration | 91 |
| 22 | Advanced Self-Supervised Learning and JEPA Models | 54 |
| 23 | Foundation Models: Modern Advances and Applications | 68 |
| 24 | World Models | 60 |

</details>

<details>
<summary><b>Natural Language Processing</b> — 21 decks</summary>

| # | Deck | Pages |
|---|---|---:|
| 01 | Introduction to Natural Language Processing | 94 |
| 02 | Vector Space Models & Word Embeddings | 81 |
| 03 | Recurrent Neural Networks (RNNs) | 89 |
| 04 | Sequence-to-Sequence Models: Intro to Attention | 76 |
| 05 | Attention Mechanism Deep Dive | 50 |
| 06 | Introduction to Transformers | 101 |
| 07 | Large Language Models | 66 |
| 08 | Fine-Tuning LLMs and RLHF | 48 |
| 09 | Prompting & Retrieval-Augmented Generation (RAG) | 103 |
| 10 | Multimodal NLP | 33 |
| 11 | Agentic AI | 65 |
| 12 | AI Safety for Agents | 59 |
| 13 | Mixture of Experts Models | 74 |
| 14 | Large Reasoning Models | 80 |
| 15 | RL Post-Training for Reasoning (GRPO & GSPO) | 45 |
| 16 | Transformers: 2017 vs 2026 | 47 |
| 17 | Inference Optimisation for Large Models | 56 |
| 18 | Recent Advancements in NLP | 73 |
| 19 | Audio Processing in NLP | 161 |
| 20 | Speech-to-Text (STT / ASR) | 79 |
| 21 | Text-to-Speech (TTS) | 50 |

</details>

<details>
<summary><b>Reinforcement Learning</b> — 10 decks</summary>

| # | Deck | Pages |
|---|---|---:|
| 01 | RL Foundations: MDPs & Bellman Equations | 76 |
| 02 | Value-Based Methods: Q-Learning to DQN | 40 |
| 03 | Vanilla Policy Gradient & REINFORCE | 79 |
| 04 | Policy Optimization: Actor-Critic to PPO | 89 |
| 05 | Continuous Control I: Deterministic Policy Gradients & DDPG | 58 |
| 06 | Continuous Control II: Max Entropy RL, SAC | 62 |
| 07 | The Reward Problem: Exploration vs. Exploitation, Bandits, Inverse RL | 74 |
| 08 | Data & Planning: Model-Based & Offline RL | 114 |
| 09 | RL in the Real World: RLHF, Multi-Agent RL & Robotics | 54 |
| 10 | RL Frontiers: Meta-RL, Multi-task RL, Hierarchical RL, Open Problems | 64 |

</details>

<details>
<summary><b>Introduction to AI</b> — 8 decks</summary>

| # | Deck | Pages |
|---|---|---:|
| 01 | Data Science Foundations | 70 |
| 02 | Machine Learning Algorithms | 89 |
| 03 | Fundamentals of Deep Learning | 59 |
| 04 | Unsupervised Learning | 37 |
| 05 | Data Preprocessing and Data Augmentation | 104 |
| 06 | Decision Trees and their Variants | 60 |
| 07 | Linear Regression | 83 |
| 08 | Support Vector Machines (SVMs) | 50 |

</details>

<details>
<summary><b>Generative AI</b> — 1 deck</summary>

| # | Deck | Pages |
|---|---|---:|
| 01 | Generative AI for Science — Applications and Techniques | 92 |

</details>

## Labs

291 Jupyter notebooks. Course folders mirror the lecture tracks; the rest are cross-cutting.

| Folder | Notebooks | What it is |
|---|---:|---|
| [`Labs/Computer_Vision`](Labs/Computer_Vision) | 56 | CNNs through generative and foundation models |
| [`Labs/Incomplete_Labs`](Labs/Incomplete_Labs) | 51 | Mixed — see the note below |
| [`Labs/Homeworks`](Labs/Homeworks) | 54 | 27 assignment/solution pairs — CV 14, NLP 6, ML 5, RL 2 |
| [`Labs/Reinforcement_Learning`](Labs/Reinforcement_Learning) | 36 | 15 exercise/solution pairs, in course order |
| [`Labs/Natural_Language_Processing`](Labs/Natural_Language_Processing) | 46 | Classical text through agents and RAG |
| [`Labs/Introduction_To_AI`](Labs/Introduction_To_AI) | 24 | Classical ML and DL foundations |
| [`Labs/Exams`](Labs/Exams) | 20 | 10 question/solution pairs across 2025 and 2026 cohorts |
| [`Labs/Archive`](Labs/Archive) | 4 | Superseded material |

> **`Incomplete_Labs/` is a staging area, not an archive.** It holds labs that still need
> testing or changes before they're finalised.

**Notebook naming.** A student version is `<Name>_Exercise.ipynb` and the worked version is
`<Name>_Solution.ipynb` — the same rule in every folder, including `Exams/` and `Homeworks/`.
A solution is always its counterpart's name plus the suffix, so pairs match by stem and can
be found mechanically. Notebooks carry no numeric prefix; ordering comes from the course.

---

# For contributors

## Requirements

- A LaTeX distribution — TeX Live or MiKTeX
- `latexmk` (drives the build)
- `pdfinfo` (from poppler; used for the page-count report)
- Bash

Shared packages are declared in `LaTeX/preamble/packages.tex`. Builds pass `-shell-escape`
because `preamble/commands.tex` defines figure-fetching macros (`\fetchimage`,
`\convertimage`, …) that shell out to `curl` and ImageMagick's `convert`. Each is wrapped in
`\IfFileExists`, so with the figures committed a normal build never invokes them — you only
need `curl` and ImageMagick if you add a macro-fetched figure.

## Building

Run from the repository root.

```bash
./build.sh                                              # all 64 decks
./build.sh --file Computer_Vision/04_Object_Detection.tex   # one deck
./build.sh --prefix 01                                  # deck 01 of every course
./build.sh --output some/dir                            # choose the destination
./build.sh --keep-logs                                  # keep .aux/.log instead of cleaning up
```

`--file` takes a path **relative to `LaTeX/`**, i.e. `<Course>/<deck>.tex`. Those four flags,
plus `-h`/`--help`, are the complete set; anything else exits with an error.

Per deck you get either

```
ok  pages=141  overfull_vbox=0  missing_images=0
```

or a `FAILED` line, with the full log copied to `build/logs/<deck>.log`. The script exits
non-zero if any deck failed.

> **`build.sh` writes PDFs flat into `Lectures/`, but the committed layout is
> `Lectures/<Course>/`.** A plain `./build.sh` will leave 63 PDFs at the root of `Lectures/`
> alongside the course folders, rather than updating them in place. Build into the right
> folder explicitly:
> ```bash
> ./build.sh --file Computer_Vision/04_Object_Detection.tex --output Lectures/Computer_Vision
> ```

## Repository layout

```
.
├── build.sh                  # the only build entry point
├── update_version.sh         # semver bump, called by CI
├── VERSION  CHANGELOG.md     # both maintained by CI, not by hand
├── CONFIGURE.md              # environment setup notes
├── Lectures/<Course>/        # built PDFs, committed
├── Labs/                     # 291 notebooks
└── LaTeX/
    ├── Computer_Vision/            # 24 deck main files
    ├── Natural_Language_Processing/#  20
    ├── Reinforcement_Learning/     #  10
    ├── Introduction_To_AI/         #   8
    ├── Generative_AI/              #   1
    ├── preamble/             # packages, commands, beamer_settings (4 files)
    ├── sections/             # 65 topic dirs, ~950 .tex — all slide content
    ├── images/               # 69 dirs, ~2,300 figures
    ├── style_files/          # logos and .sty helpers
    ├── beamerthemeStanford.sty + 2 more, antbrief.cls
    └── references.bib
```

**Naming conventions.** Decks are `NN_Title.tex`, zero-padded, in every course, and the built
PDF keeps the same stem in `Lectures/<Course>/` — so a deck and its PDF always share a name.
Notebooks carry no numeric prefix and use `<Name>_Exercise.ipynb` / `<Name>_Solution.ipynb`.
No path anywhere in the repo contains a space.

## How a deck is assembled

A deck main file is a thin shell — all content lives in `sections/`. Every one of the 63
decks follows the same shape:

```latex
\documentclass[10pt, aspectratio=169]{beamer}
\input{preamble/packages}          % all 63 decks
\input{preamble/commands}          % all 63 decks
\input{preamble/beamer_settings}   % all 63 decks
\begin{document}
\input{sections/cover}             % all 63 decks
\input{sections/toc}               % 28 of 63
\input{sections/<topic>/<file>}    % ~13 of these per deck
\end{document}
```

So:

- **New slide** → add or edit a file under `LaTeX/sections/<topic>/`, then `\input` it from
  the deck. Don't put slide content in the deck main file.
- **New figure** → `LaTeX/images/<topic>/`, referenced as
  `\includegraphics[width=\linewidth]{images/<topic>/<file>.png}`. Image directory names
  mostly mirror section names, but that's a convention, not a rule.
- **New package** → `LaTeX/preamble/packages.tex`, so every deck picks it up. 12 decks
  currently re-declare a package locally (mostly `tikz`); treat that as legacy rather than a
  pattern to copy.

Width note: use `\linewidth`, not `\textwidth` or `\paperwidth`. Inside a list `\linewidth`
accounts for the indent; the others overflow the frame by exactly that amount.

## Releases and versioning

`.github/workflows/deploy.yml` is the only workflow. **It does not build LaTeX** — no PDF is
compiled or published by CI. It bumps the version and regenerates the changelog:

- Triggers on push to any branch **without a `/` in its name**, plus manual dispatch
  (`workflow_dispatch` ignores the branch filter). There is no `pull_request` trigger. So a
  flat branch like `nlp_review2` fires it on every push, while `user/topic` never does.
- Keywords in the commit message drive it:

| Keyword | Effect |
|---|---|
| `[major]` / `[minor]` / `[patch]` | Selects the semver bump. **Omitting it defaults to `patch`.** |
| `[skip ci]` | Skips the workflow entirely |
| `tag-release` | Cuts a GitHub Release — only on `main`, and not on a merge commit |
| `tag-repo` | Tags the repo — only on `main`, and not on a merge commit |

- **Merge commits are exempt from all of it.** The bump, the changelog, the tagging and the
  release are each gated on the head commit having fewer than two parents, so a PR merge
  landing on `main` produces nothing at all. The bump happens *earlier*, on the push to the
  topic branch — which is why the bot commit appears as the branch-side parent of the merge.
- The workflow commits `VERSION` and `CHANGELOG.md` back as
  `chore: update changelog and version [skip ci]`. **Expect a bot commit on your branch and
  to need a `git pull` before your next push.**
- `CHANGELOG.md` is generated by `conventional-changelog` — commits whose subject doesn't
  parse never appear in it.

## Commit convention

Follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):
`<type>(<scope>): <description>`, imperative mood.

```
feat(slides): add GRPO derivation to RL post-training deck
fix(cv): correct dead ATIS dataset link
docs(readme): document the CI version keywords
```

Types in use here: `feat`, `fix`, `docs`, `refactor`, `style`, `chore`. Add `[minor]` or
`[major]` when the change warrants more than a patch bump.

There is no commit linter, and a malformed prefix fails silently — `feat(slides):: …` and
`feat(slides)L …` are both in the history and neither reached the changelog.

## Things that will catch you out

- **`Lectures/` is build output but is committed.** Because a plain `./build.sh` writes flat
  (see above), it does *not* update the committed PDFs — it drops 63 new files at the root of
  `Lectures/`, next to the course folders. Build with `--output Lectures/<Course>` and you get
  the opposite problem: hundreds of MB of binary diffs, most differing from `HEAD` only by an
  embedded timestamp. Either way, don't reflexively `git add -A`; stage the decks you changed.
- **The repo is large** — roughly 4.5 GB of git objects, ~720 MB of figures and 263 MB of
  notebooks. A shallow clone (`--depth 1`) is much faster if you don't need history.
- **`build.sh` skips a `SHARED_DIRS` list that names `assets`, which doesn't exist**, and does
  *not* skip `LaTeX/build/`. That's harmless today (no `.tex` there), but a stray `.tex`
  dropped in `LaTeX/build/` would be compiled as if it were a deck.

## License

GPL-3.0 — see [LICENSE](LICENSE).
