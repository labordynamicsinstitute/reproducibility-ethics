---
title: See also
---

:::{attention} Draft
Prose adapted from a recorded workshop session (October 2026); still being revised.
:::

## When data are not shareable

- Preparing code when data are not shareable [@vilhuber2025confidential]

### Don't let the data seep into your code

When data are confidential, you also need to keep the confidential data out of your code. How would they get there? Data cleaning. Suppose one respondent miscoded their address. It pops out when you look at your aggregations, and you recode the bad address into a good one with an if-then-else statement. Now your code contains the original confidential value, and possibly another confidential value. The [example](https://labordynamicsinstitute.github.io/reproducibility-confidential/11-avoiding-confidential-data-code.html) in @vilhuber2025confidential uses presidential names: all the presidents in the list have full names, so `Joe Biden` is replaced with `Joseph Robinette Biden Jr.`; and a county name that does not exist, the misspelled `Tompins, NY`, is normalized to `Tompkins County, NY`. But what if the names were confidential, or counties had to be suppressed? When a data editor knocks on your door, or for transparency more generally, you will have to publish that code, and you will have to find and redact all the confidential data in it.

One way is to plan ahead and put all such mappings into a separate code file. You can then say: I cannot show you this file because it contains confidential information, but here is what kind of mapping it does, and everything else can be published without further thought. That is very hard to do after the fact, but easy if you think about it from the start.

A better solution is to treat the mappings as what they are: data. If you already know that some of your data are confidential, creating additional confidential data is no problem. Put the mappings in a CSV file in the same place as the other confidential data, and merge (`left_join`) it into the dataset you want to process. The code then contains only a generic modification, with no confidential values, and once a mapping has been applied, the extra column is deleted. The mapping file is confidential data, and clearly labeled as such, but the code is completely transparent about what it does.

Could somebody still suspect that you are manipulating the data? Of course: that is intrinsic to not being able to show all your cards. But you can show that the code is set up in a reasonable way. And there are mechanisms to bring in somebody to audit your code where the data live: as a data editor, I have accessed confidential data on a researcher's secure server to audit their work, bringing all the (public) code from the outside, while the confidential data never leave that server.

It is clear which data files are confidential. Figuring out which *lines of code* are confidential is a much bigger problem. So plan from the start, and don't let the data seep into your code. A complete R example is in the [`examples/confidential-merge`](https://github.com/labordynamicsinstitute/reproducibility-confidential/tree/main/examples/confidential-merge) folder of the [reproducibility-confidential](https://github.com/labordynamicsinstitute/reproducibility-confidential) repository, and is explained in [Avoiding confidential data in your code](https://labordynamicsinstitute.github.io/reproducibility-confidential/11-avoiding-confidential-data-code.html) [@vilhuber2025confidential].
