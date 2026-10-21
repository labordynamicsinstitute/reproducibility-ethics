---
title: Making non-shareable data shareable
---

:::{attention} Draft
Prose adapted from a recorded workshop session (October 2026); still being revised.
:::

:::{aside}
**Readings**

- {cite:t}`minutephysics2019`
- {cite:t}`garfinkel2018`
- {cite:t}`webb2026`
:::

## Overview of methods

- Data **de-identification**
- True data **anonymization**
- **Aggregation** and summarization
- **Synthetic** data generation

All of these methods share a *privacy-accuracy trade-off*. You can have perfectly accurate data (up to whatever errors are in your survey, which is not trivial to start with), and the data are not private. Or you can have perfectly private data, which are then highly inaccurate. Somewhere along that line is where you want to be.

## De-identification

The standard, in the J-PAL guide [@kopper2023] and similar resources, is to strip out what is clearly personally identifying information. Unless you actually require names (to infer language, ethnicity, or gender, say), your analysis dataset should not have names in it. But as discussed in [Do you have data you cannot share?](02-identifying-nonshareable.md), content intended to be innocuous may not be, and the more robust approach is to include only the variables you need. De-identification is not perfect, which is why we often need to go further.

## Anonymization: k-anonymity

- Hands-on tutorial: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/labordynamicsinstitute/reproducibility-curriculum/blob/main/extras/k_anonymity_tutorial.ipynb)

Anonymization methods take de-identified data and make them anonymous, in the sense that no record can be assigned to any particular person. There are, in general, two simple techniques:

- **Generalization** (or aggregation, coarsening): replace a specific value by a broader one. Geographic coordinates become a political entity (a county, a state) or an arbitrary geographic unit, such as a hexagon larger than the original resolution. This is not collapsing the data into a new statistic for that cell: each record keeps its row, but is assigned attributes at the aggregated level.
- **Suppression**: remove certain records or values from the data, either whole rows or particular cells, because leaving them in would almost certainly describe a specific person.

Neither is perfect on its own. Coarsen locations into big hexagons, but in an arid part of the country there is only one farm in a hexagon: even without the precise address, a look at the map identifies the farm. So these methods often add a criterion on the number of entities in each cell, for instance at least 10 farms for the cell to be published, and otherwise make the cell larger or suppress it. If a county has only one farm, no statistic for that county can avoid revealing its owner. Suppression can actually be good statistical practice: you tend to want inference based on large numbers, not small counts, and the outliers that inordinately influence your results tend to be the same observations that suppression would drop. Not always, but mostly.

The hands-on tutorial works in a free Google Colab account, and you can modify it to use your own data. The raw data contain names, ages, ZIP codes, and a diagnosis. Suppose you want to study the relationship between the diagnosis and age and gender. If you only have first names and want to analyze by gender, you need the names to infer gender, so you cannot simply strip them. (There are two ZIP codes in the example because Ithaca has two: one for Cornell and one for everybody else.)

To anonymize, generalize age into 10-year intervals, blank out the last digit of the ZIP code (collapsing the two ZIP codes into one), and drop the names (so no more gender analysis). Then ask: is this sufficient? *k-anonymity* asks how many entities (people here, but they could be farms or firms) fall into each cell defined by all possible combinations of the identifying variables. Here, with one ZIP code and two age groups, there are two cells, each containing four people. A dataset is *k-anonymous* if every cell has at least *k* entities. With *k* = 2, if I think a record is you, there is still a 50-50 chance that I am wrong about your diagnosis. Make the age groups finer, and the smallest cell drops to two: the data still satisfy 2-anonymity, but fail 4-anonymity.

What is the right *k*? That is a conversation with your IRB. And notice how much variability has been removed: no gender, fairly coarse age groups, only a minor modification to ZIP codes. k-anonymity is a good compromise between modifying the data to create a public-use file and preserving some anonymity, but it has weaknesses. Computer scientists love to pick holes in such methods, and a "litany of letters" followed: *l*-diversity, *t*-closeness, and more, each addressing weaknesses of the previous, and each found to have weaknesses of its own. Whether it is good enough is a decision you have to make.

## Anonymization: differential privacy

- Video introduction [@minutephysics2019] ([start at 5:50](https://youtu.be/pT19VwBAqKA?t=350))
- Database reconstruction attacks [@garfinkel2018]
- Utility of differential privacy for RCTs [@webb2026]

Differential privacy *does* provide a guarantee: done correctly, it mathematically bounds the probability that anybody can be identified. It works by modifying the data, by just a tiny bit, in a very principled way. The downside is that the principled way might make the data useless. In the simplest implementations, every cell gets noise added to it, even cells containing many people. If you want to be sure that nobody, under any circumstances, can be re-identified, you may end up with very coarse data. The video [@minutephysics2019] is a very well done treatment of a very complex topic, and illustrates the privacy-accuracy trade-off. The article by @garfinkel2018 is short and easy to read. It hides a lot of the complexity, but you get the gist of it, and of the risks, which is the part you need to worry about.

### Can we republish an RCT with protected data?

In @webb2026, we try to illustrate that doing this in a principled way is not easy. The starting point is not that many papers contain personally identifying information, but that many RCTs have probably not done much to their survey data beyond de-identification, and we know that de-identification is not perfect. Can we modify the data and maintain their utility? Is the inference drawn from an RCT affected by working with anonymized data?

We take an RCT with about 1,000 participants in Sierra Leone (not ours) and ask: could we republish it, using modern differentially private (or quasi-differentially private) methods, with only the protected data? The confidential data stay where they are, our conclusions are based on the protected data, and everybody else can obtain the protected data and redo our analysis. If we impose on ourselves the same rules we would impose on anybody else, do we come to the same conclusions? It is not a trivial matter.

This has implications for transparency more generally. If you use the DHS, you are already using post-anonymization data, modified to some extent by the data producer. You take it as given that your conclusions are valid, but some findings could be artifacts of the anonymization.

Some referees asked: why not embed the privacy protection in the survey from the start? Randomized response ([Ethics review, consent, and data sharing](#sec-randomized-response)) dates back to the 1960s [@warner1965], and differential privacy was developed in the early 2000s, but it turns out that randomized response is differentially private [@dwork2014]. Nothing is perfect, but the probability of violating somebody's privacy can be quantified, and it is very small. In many cases, though, this is not possible: you need enough precision from the data collected in your RCT.

One strand of the privacy literature quantifies the cost of privacy as equivalent to a cost in sample size. You can incorporate the uncertainty added by privacy protection into your power calculation: how many additional units must I survey, given the protection I will apply, to still have power to detect an effect of a certain size? More sample means more cost, so you are literally quantifying the cost of privacy protection. If that is what you or your IRB intends, the consideration moves not just into the conduct of the RCT, not just into its planning, but into its *funding*: you need to request from your funder the resources to incorporate the protection your ethics board will sign off on. Tools exist to incorporate this into power calculations. They are not perfect, but they exist. Then again, maybe k-anonymity is sufficient for your purposes.

Part of our back-and-forth with referees was that our methods were not *perfectly* differentially private. Our response: if they were, we could no longer draw the inferences the original study drew. (I am tempted to publish those referee reports as part of the article.)

## Aggregation and summarization

Publishing only aggregate statistics, such as counts or means for all respondents in a county, is in principle shareable, since the data are no longer individual records. But aggregation does not eliminate the risk of re-identification: small cells can reveal individuals, and @garfinkel2018 shows how many published aggregates can be combined to reconstruct the underlying records. The cell-size rules and suppression discussed above apply here as well.

## Synthetic data generation

If you cannot publish the data because removing information or making them anonymous would destroy their utility, one partial way around this is synthetic data: data that look like the data you collected but are not the data you collected, so that your analysis can still run. Instead of Bob, the record is called Jack, and instead of Jill, Jane; you can synthesize ZIP codes and all sorts of other variables.

Proponents of synthetic data make it out to be easier than it actually is. Having worked with synthetic data for a decade and a half: you can easily generate synthetic data that make your code run. It is an extremely hard endeavor to create synthetic data that produce results *similar* to yours, and virtually impossible to reproduce your results *exactly*, because that puts you back into the differential privacy world. Synthetic data that make the code run do provide some transparency. But behind the scenes, you are still generating the results from data that you do not publish, which is why synthetic data are most useful in combination with the access mechanisms in [Publishing data securely, with controls](04-publishing-with-controls.md).
