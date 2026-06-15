# Beyond Household Headship: Gendered Agriculture and Food-Security Pathways in Somalia

![Project dashboard](figures/project_dashboard_card.png)

## Core idea

Food-security analysis often starts with one question: **is the household head male or female?**

That question is useful, but it can miss important agricultural roles. In farming, agro-pastoral and dryland livelihood systems, the person who heads a household is not always the person who operates land, contributes agricultural labour, manages crops, mobilises hired labour, participates in livestock-product decisions, or carries pressure when shocks hit.

This mini-project demonstrates a simple role-sensitive framing:

> **Better gender data starts by asking better agricultural questions.**

## What this repository contains

This is a concise public research-communication package using **derived, aggregate, non-identifiable outputs** from secondary survey analysis. It is designed for GitHub, LinkedIn/Facebook communication, portfolio use and research discussion.

It includes:

- public-safe aggregate tables;
- clean figures;
- a short methods note;
- a data privacy note;
- a reproducible R script for public figures;
- one polished LinkedIn/Facebook post.

## What this repository does not contain

This repository does **not** include raw SIHBS household microdata, household-level extracts, restricted survey files, internal audit files, correspondence, or full draft manuscripts.

## Key public insights

The derived outputs highlight four messages:

1. Gender-sensitive food-security analysis can improve when it moves beyond household-head sex and considers agricultural roles.
2. Female primary agricultural land operators represent a substantial share of agricultural land-operating households in the derived outputs.
3. Climate-livelihood shock exposure is high across both female- and male-operated agricultural households.
4. Adjusted patterns suggest that labour mobilisation and crop composition may reveal gendered pathways that simple food-insecurity comparisons alone can miss.

All estimates should be interpreted as **associations**, not causal effects.

## Repository structure

```text
.
├── README.md
├── PROJECT_BRIEF.md
├── CITATION.cff
├── LICENSE
├── data/
│   ├── README.md
│   └── derived_outputs/
├── docs/
│   ├── data_privacy_note.md
│   ├── methods_note.md
│   └── linkedin_facebook_post.md
├── figures/
├── scripts/
│   └── make_public_figures.R
└── social_cards/
    └── linkedin_launch_card.png
```

## Reproduce public figures

From the repository root, run:

```r
source("scripts/make_public_figures.R")
```

The script uses only aggregate CSV files from `data/derived_outputs/`.

## Suggested use

Use this repository as a public-facing mini-project for research communication, portfolio presentation, responsible open science, and discussion with scholars, professors, food-security analysts, gender researchers and development practitioners.

## Author

Ahmed Hussein Ismail  
Agro-Meteorology and Natural Risk Management researcher  
Hargeisa, Somaliland
