---
title: Do you have data you cannot share?
---

:::{attention} Draft
Prose adapted from a recorded workshop session (October 2026); still being revised.
:::

:::{aside}
**Readings**

- {cite:t}`kopper2023`
- {cite:t}`brodeur2026`
- {cite:t}`valenta_piichecker`
:::

In the same way that it is easy to forget that the DHS is not shareable, it is easy to forget what is actually in your data, including the "clean" data that you think you are sharing. You might think you de-identified your data and can now share them. Is that actually true? What are the variables in the dataset you collected in your RCT, or in the survey you merged administrative data into? Can you share them? Should they even still be in there? Knowing whether you have data you cannot share, even internally, is a very important question.

## Day 1: Separate shareable and non-shareable data

- Best practices start on **Day 1**
- J-PAL guide to de-identification of data [@kopper2023]

I strongly encourage you to read the J-PAL guide to de-identification [@kopper2023]. Part of it is simply about *when* you de-identify: the moment you download the data from SurveyCTO, Qualtrics, or similar.

Conceptually, think of it in stages. What you download, with all its identifying information, sits on a secure computer in your lab, or wherever it is authorized to sit. Ideally, there is an intermediate stage: a de-identified file from which the names and clear survey identifiers have been removed, with geolocation data kept somewhere separate. By default, you work from the de-identified file, so there is no possibility of accidentally grabbing the names. And rather than running regressions on a file containing everything, extract only the variables you think you are going to use. If it turns out that your research requires some of the other data, you can add them back in. You ask yourself for permission, in the same way that you have to ask the DHS separately for the geocoded data.

Flip the table around: you are a data provider, responsible for protecting the privacy of the people reflected in your data. What would you, the data custodian, tell yourself, the researcher? In some labs, that separation is physical and organizational: one person is the data manager, and the researcher has to ask them for access, possibly with a discussion that goes back to the IRB. It does not have to be a hassle. If you build it in from the start, it can be a conversation you have with yourself. But the data are kept separate, so nothing is shared accidentally, even within your own research group.

### Automate the extraction

This separation is easiest if you automate the very first step: getting the data out of the survey platform. The [Reproducibility from Day 1](https://larsvilhuber.github.io/day1-tutorial/) tutorial walks through the whole pipeline described here. For Qualtrics, a single R package lets you download a survey into a dataset with one line of code (plus a bit of setup to tell it where the survey is). Once that step is code, you can

- keep the raw download, with its confidential content, in one area (perhaps a university-approved location), and the research data in another;
- select only the variables you need, and never select the confidential ones;
- compute what you need from confidential variables (a gender inferred from first names, a distance computed from GPS coordinates) and then drop the confidential variables right away;
- record checksums of each file, so you can later demonstrate exactly what you did, even if you cannot show the data.

Because the pipeline is reproducible, forgetting a variable is not a problem: you edit the code and rerun the extraction. That is defensive programming, and the same approach applies to administrative data sources. The same pipeline can also immediately deposit the non-confidential data in a (possibly private) repository such as Dataverse, so they are preserved from the start.

The idea is that you take on two roles. As the *data curator*, you extract the data from the survey, remove the confidential information, and publish the result to your own (for now, private) Dataverse. As the *researcher*, you use the data from that Dataverse, in the same way that you would use data downloaded from the DHS. There is now a clear point at which identifying data could leak into your research, and you can review it and add checks there. Beyond that point, you only need to worry about the research.

## Day T-1: Verify the separation

- Did you properly separate shareable and non-shareable data?
- PII-checker [@valenta_piichecker]
  - Prevalence of PII in social science replication packages [@brodeur2026]
- How can you decide what data to publish *without publishing the data*?
  - Private LLMs...

The day before you publish, check again. One way to find sensitive data is to run a checker. An older tool created by J-PAL and IPA looks at variable names: it will find variables called `name` or `latitude`, but not much more. A newer, LLM-based PII checker developed by researchers at the Institute for Replication [@valenta_piichecker] looks at the *content* of the variables. If something looks like latitude and longitude, it flags it for review. In a companion article, they document how often personally identifiable information has leaked into social science replication packages (way too often), and how long it takes authors to respond when contacted [@brodeur2026]. That is how I know how painful it can be for authors to go back to their IRB and their respondents to declare that their data were accidentally on the internet for five years and downloaded by ten people.

Note that this is a use of LLMs that does not involve training on the data or sending them anywhere: everything runs on your own computer. Setting it up is not complicated. You need Python, a tool called Ollama (easy to set up), and enough RAM. It runs a lot faster with a GPU, but it can run without one, so in principle it runs on any computer. You download one of the offline models, then feed it a dataset or an entire folder. It chugs away and produces a spreadsheet listing every variable in every dataset it found, categorized as not PII, possibly PII, or definitely PII. You can filter on that and make decisions. The first time, setting it up may take a few hours. Your research project takes years, and this prevents a lot of hassle down the road.

:::{caution} Check your data use agreements first
Some data providers prohibit *any* use of LLMs with their data, including models that run locally and offline. The HRS, for instance, currently does not allow it [@hrs_ai_policy] (see [When can you share data?](#sec-hrs-license)). Before running an LLM-based checker over a folder, make sure it does not contain licensed data whose terms forbid this. The best place to run it is on the data you collected yourself.
:::

### Content can be identifying

Because the LLM-based checker reads content, it finds things that a variable-name check never will. Ask "Who takes care of your children while you are at work?", and most people answer "my grandmother" or "my uncle", but some will write "Joe Smith, who lives next door." A free-form field intended to be innocuous may not be. In one example we have seen, respondents wrote "If you have any questions about this survey, please call me at this phone number." People want to be helpful, which means they provide information. You cannot predict this: if you have a free-form field that people can write into, people will write things into it.

So de-identification might mean removing all the variables that are clearly names. But, as above, you can flip it around: only include the variables that you know you need. If the paper is not about childcare, you do not need the childcare variable at all, and it should not even accidentally be in there.

## Case: A recent message from an author

- Context: after receiving the LLM-produced PII check

We were about to publish an author's replication package, and had sent them a question: we had some indications that there might be personally identifying information in the deposit; could they confirm that there was none? I had been experimenting with the LLM-based PII checker, run locally, and sent them its output. They responded:

> We have removed the PII and resubmitted the deposit for your review. Here's a brief overview of the changes we made for reference:
>
> - Removed PII: We removed the "name" field, subject IDs, and all location data (latitude/longitude).
> - Deleted unused files: We removed files that were not used in the analysis and would have required PII to merge with the rest of the data.

The LLM-based checker found the location data based on the content; the older name-based tool would probably have found the names and location data only if the variable names were obvious. None of these variables should have been in the deposit in the first place, because they were not used in the analysis. Neither were the unused files. Note *when* this happened: at the very end, with the article about to be published. We had already verified that the code produces the output in the article, and normally, nobody checks what *else* is in the data.

## Discussion

- What could they have done earlier?

The answer is in the Day 1 section: had the analysis data been extracted with only the variables actually used, the names, subject IDs, location data, and unused files would never have made it into the replication package.
