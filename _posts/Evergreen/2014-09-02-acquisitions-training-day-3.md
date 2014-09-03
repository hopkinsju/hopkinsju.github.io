---
layout: post
title: "SITKA Acquisitions Training Day 3 Notes Selection & Purchasing"
categories: acquisitions,training, "acquisitions purchasing"
tags: evergreen
ticketnos:
excerpt: "Third day of SITKA Acq training, going over the staff (non-admin) functions"
---

Useful:

* [SITKA Acquisitions Manual (PDF)](http://docs.sitka.bclibraries.ca/Acq/current/pdf/Sitka_Acquisitions_Manual.pdf)
* Acquisitions -> General Search is super powerful/flexible. It can search almost anything in acquisitions.

# Selection List

A selection list is a list of items that the selector (staff) has put together that they want to buy for their library. They may not have the authority to buy, so the list. Items can be marked as 'selector ready' or 'order ready' to indicate their status.

## Creating a selection list

Selection lists can be created in numerous way. Doing a catalog search via Acquisitions -> General Search and selecting 'line items & catalog records'.

### MARC Federated Search

Can be used to search the local catalog and other catalogs for records based on availalbe search fields. Somewhat less powerful than other search methods, but may be useful if records don't exist locally.

MARC Federated search uses z39.50, so any targets that are on the usual z39.50 search will also appear here. (We need to get some new targets).

### Load Catalog Record IDs

You can import a CSV file(s) of evergreen bib id's that you want to save to a selection list (new or existing).

## Convert to purchase order

From the action menu of the selection list, choose Create Purchase order. List items can also be added to an existing list.

Pop up dialog will appear where you need to choose the ordering agency, the provider code (who you're buying the book from) so library staff will need to be familiar with the codes. Checkbox for prepayment if required will indicate later on that the order has been paid for even though an invoice may not have been received. You also have the option to import bibs and create copies, but there is another chance to do this later on so that's probably preferrable.


# Purchase orders

Purchase orders are created from selection lists. The staff member converting a selection list to a purchase order needs to check that each item has information such as estimated price, number of copies, the funds that each item will draw from. Either the selector or the purchaser can provide this information. Each item can/should also have information set such as copy location, owning branch, fund, etc.

## Pending purchase orders

Staff have another chance to set prices, select number of copies, funds etc. This must be done before the PO will be 'activatable'. Notes (both private and vendor public) can be added at this stage. Purchase orders must be named, and any name can be used except that each library can only use the same name once per fiscal year.

### Add brief record (action menu)

It is possible to add new items to the PO with a brief record.

Can be used to quickly add a record. Works for small libraries ordering few books (likely not receiving full marc records) and small staff. The interface is a series of text input fields for common marc tags - title, author, ISBN, pub date, etc. SITKA encourages Title/Author/ISBN at minimum.

## Load MARC Purchase Order

An interface very similar to the batch import/export UI but with optoins to add to selection lists, create/activate purchase orders and a few other acq related options.

Purchase orders don't have to be created at all in this step - records can just be added to a selection list.

Useful in cases where the vendor is sending you a set of records that they, for whatever reason, think you need. Some vendors allow you to go to a website and select items you want, add them to a cart, and then download the MARC records for processing through Evergreen acq rather than completing the buy on the vendors website. Libraries should be encouraged to go ahead and check the 'create purchase order' box but wait to activate until later.



## Charges

If the library is buying supplies (book jackets, labels, puppets(?) etc, anything other than books) and have an associated charge that is not for an actual book are handled differently.

Click New Charge from the PO screen. Choose the charge type, fund, title/description, estimated cost, and author/note if needed/relevant. Continue to add new charges, then 'Save New Charges'.

Charges will be encumbered when you activate the PO. It's suggested to not bother with this at the PO step, unless they are the only thigns on the PO because the charges cannot be handled properly - they can't be selected to go to the proper invoice. It's better to add the charges to a particular invoice after the PO containing bibliographic records has been activated.

## A note about currency

Good to remember that the estimated price on the PO is in the providers (vendor) currency. If the system currency is USD and the vendor is Canadian, the number entered on the PO is in Canadian.

## Buying a specific ISBN

If the record has multiple ISBNs, or if you'd like to order by another identifier, you can choose from the dropdowns on the PO screen. This will allow you to order hardback vs paperback for instance.

# Activating a purchase order

When you activate the order, it will create the bib records (where needed), add the copies (which will have status set to 'On Order'), and if the vendor uses EDI - will transmit the order to the vendor.

It is also possible to activate the PO without loading the items (the button is right next to the usual activate button). This is useful when you have electronic resources you are buying through acq - where you had set a number of copies but aren't going to be getting physical items. You can also check the box to allow the activation of the PO with zero copy line items.

## Errors preventing activation

A full breakdown of all errors that could be an obstacle are [Posted to the SITKA Acq Manual (PDF)](http://docs.sitka.bclibraries.ca/Acq/current/pdf/Sitka_Acquisitions_Manual.pdf) in Section 7.8
