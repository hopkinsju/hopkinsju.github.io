---
layout: post
title: "SITKA Acquisitions Training Day 2 Notes"
categories: acquisitions,training
tags: evergreen
ticketnos:
excerpt: "Second day of SITKA Acq training."
---

## One thing from yesterday...
###Claim Types

Enter various claim types and their org units. Used for orders that are not complete, have problems, etc. Put them all at the top system level and make a list of all possible values. Sitka has a list of theirs online.

## Claiming

Acq -> Claim ready items

### Claim Policies

Create a list of policies that will later be hooked into other parts/pieces to perform actions. Configured per system/branch.

### Claim Event Types

Tells the library what action to take. Configured per sysetm/branch.

### Claim Policy Actions

Puts the previous two sections together. Choose Event types (i.e. Email) action interval is the wait time between the when the order is placed and when the action should be taken. "Send the library an email telling them to make a claim if an order hasn't been received in 28 days"

## Library Settings related to Acq

Some really matter, others not so much.

* Allow funds to be rolled over without bringing the money along - what rolls over is the money they've spent (encumberances). Most libraries don't bring the money over - they will need to pay with the new FY's money.
* Allow patrons to create automatic holds from purchase requests - Currently there is no display in the OPAC, so patrons would need to ask staff for help. When the items comes in there's no way to match new items to requests. This seems totally broken.
* Default circ modifier & copy location. Libraries should create an "On Order" copy location. System will use a copy location that exists in the MARC records from the vendor over the default.
* _IMPORTANT_ Temporary barcode prefix. Each library uses a unique prefix for their acq orders. Sitka uses their library shortname + "a".
* _COOL_ Set Defaults for the Load MARC Order Records interface. (merge profile, match set, provider, etc)

## Funds

### Funding Sources

Admin -> System admin -> Funding sources

* Create funding source name
* Set owning branch/system
* Set Code - can be anything, and may overlap with codes used by other libraries. Check the owner when looking at codes.
* Set currency

Clicking on the name of the funding source let's you 'go into it' so you can view it's balanaces, etc.

### Creating Funds

* Name (i.e. Adult Fiction)
* Code (i.e. AF_BRL_AHL)
* Year (2014)
* Org Unit (i.e. BRL-AHL)
* Currency Type
* Active (T/F)
* Balance Stop Percent Have the system stop funding when % of fund has been spent (i.e. only allow spending a fund to 95%)
* Balance Warning Percent
* Propogate will create an identical fund at years end for the following year
* Rollover - allows rollover of both encumberances & money. The majority of funds will both propogate & rollover.

Hit reload to see the new fund.

### Apply credit to Funding Source

Go back to Funding Sources and click the name of the source. Hit Apply Credit to add money to that source.

Then Allocate to a fund using dropdown.

You can transfer between funds betwee

## Providers

* Providers can be shared by libraries, but it can be tricky and confusion to support.
* Choose the currency of the providers - if it's a US company USD
* Enter default claim policy
* Holding subfield - for records that come from vendors with holdings information in the MARC. At the very least you have to coose owning_lib. Holdings tag is defined earlier, this is just the subfield.

## Line Item Texts

* Code
* Description
* Owning Library

If you put an alert on an item when the item is received a pop up will appear saying Code & Description. i.e. AWARD - Please place an award sticker on this item. RUSH - please send directly to cataloging.

## Distribution Formulas

Defines how multiple copies are distributed to various owning libraries. In the case of only one branch per system it serves as a template for setting copy location, fund, circ mod.

## Purchase Order Screen

Choosing a Distribution Formula when creating a purchase order will prefill the number of copies to order.

## Bug Fixes
[Rendering the fund-dropdown in the line batch update controls can be slow - 1254918](https://bugs.launchpad.net/evergreen/+bug/1254918)
