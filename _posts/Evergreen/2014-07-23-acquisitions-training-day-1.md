---
layout: post
title: "SITKA Acquisitions Training Day 1 Notes"
categories: acquisitions,training
tags: evergreen
ticketnos:
excerpt: "First day of SITKA Acq training. Mostly settings."
---

## Default Settings before moving on

Some settings must be set at the consortium level before.

  * Currencies enter all concievable currencies
  * Exchange rates. Bug exists (1335668) that needs a patch to allow a change in exchange rates.
  * Cancel reasons. Most are default from EDI. Not a good idea to delete. It is possible to set a using library, but mostly we will want to keep them consortium. Checking 'Keep Debits' will keep the debit even after the cancel. Depending on the cancel reason, there may be a good reason to still debit the fund - i.e. backordered, accepeted with ammendment.
  * Invoice item types. Extra charges such as processing fees, shipping, import fee, etc.
  * Invoice payment methods. A list of all the ways a library could pay for their order. Cash, credit cards, wire transfer, etc. Starting by building a comprehensive list we won't have to update.
  * Line item MARC attribute Definition Editor

## Permissions

Sitka has some code that adds the ability to set secondary permission groups for a user. [LP#868653](https://bugs.launchpad.net/evergreen/+bug/868653)

It's not a great idea to add multiple "old" permission groups because of overlapping permission problems. Sitka has lots of documentation on the use of secondary permission groups.

Jennifer is going to have someone output their permission tree from the database and send it along.

## Working with libraries to get started

Sitka charges extra for Acquisitions because of the huge time invested to set up and do training.

Libraries who want to get started fill out an ["interest survey"](http://wiki.evergreen-ils.org/lib/exe/fetch.php?media=acq:acq_interest_survey_2015.pdf) (although they use Surveymonkey)

More resources on the [wiki pages](http://wiki.evergreen-ils.org/doku.php?id=acq:interest-group&s[]=acq&s[]=interest)

Once libraries decide to go ahead, they fill out a [pre-acq survey](http://wiki.evergreen-ils.org/lib/exe/fetch.php?media=acq:pre-acq_survey_2015.pdf) to help the libraries think about various questions they will need to know the answers to before moving on.

Another document, the [acquisitions planning worksheet](http://wiki.evergreen-ils.org/lib/exe/fetch.php?media=acq:aquisitions_planning_single_2015.pdf) collects information needed to do the setup.
  * Funds
  * Claim policies
  * Providers (Vendors)

### Schedule

Setting up Acquisitions takes quite a bit of time. Sitka schedules libraries to implement Acq in rounds rather than just whenever each library wants to. They require the pre-acq by Sept 5th this year, start training in November, start adding money to production in January, do ordering, and finally receiving their first order in late February. This scheudle is a part of the [pre-acq survey](http://wiki.evergreen-ils.org/lib/exe/fetch.php?media=acq:pre-acq_survey_2015.pdf)

## Training

Sitka does a few days of training once every month or so, following the natural flow of acquisitions so at each stage of their order the training is fresh.

Sitka has a great [page of training exercises](https://bc.libraries.coop/support/sitka-training-server/) that cover way more than just acquisitions. This is a cool idea.

Sitka spends as much time doing Acq training as they do with initial migration training. They see as many Acq tickets as non-acq.

They also have [a page of videos](https://bc.libraries.coop/support/videos/)

Instructions to do Fiscal Year End is not given until much closer to when they will actually need it.
