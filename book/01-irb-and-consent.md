---
title: Ethics review, consent, and data sharing
short_title: Ethics review and consent
---

:::{attention} Draft
Prose adapted from a recorded workshop session (October 2026); still being revised.
:::

:::{aside}
**Readings**

- {cite:t}`meyer2018`
- {cite:t}`crress2022session2`
:::

If you collect your own data, one of the main constraints on whether and how you can share them is the approval you received from an institutional review board (IRB). IRBs and ethics boards are called different things in different places, and may be specific to an institution or to a country. If you have not yet gone through one, find out early what your institution and your study country require.

## What ethics boards weigh

IRBs weigh an intrusion into privacy against the question: why do you want to do this? This is easiest to see in a medical setting, but similar considerations apply in the social sciences. Even if you violate people's privacy just a tiny bit, there has to be something that offsets it.

Michelle Meyer [@meyer2018], drawing on the literature, argues that one way to increase the public good, and so outweigh that private cost, is to make the data as broadly available as possible. That does not mean throwing the data over the wall onto the internet. But the polar opposite is not right either. Agreements researchers write regularly say, in effect, "Trust me, I am the only one who will ever look at the data." Nobody is going to do every possible analysis with a dataset. Letting others build on the data, even if there is only a small chance that they will, possibly increases the risk, but it also increases the benefits from the harm you are causing. Not every IRB or ethics board has read Meyer's article.

## Summary: Meyer (2018), "Practical Tips for Ethical Data Sharing"

@meyer2018 is a short, practical tutorial aimed at psychologists, but it applies to anyone collecting data from human participants under US-style ethics review (the Common Rule). It opens with a quote from a real IRB submission: "After the study is completed, videotapes will be destroyed personally by the investigator with a sledgehammer." As Meyer notes, it is rather difficult to share data that have been sledgehammered to smithereens.

**Why share?** Journals, funders, and professional societies increasingly require it. Publicly funded researchers arguably owe the data back to the public. A published claim invites reanalysis and replication, which require the data. Sharing may also increase citations. And participants are often motivated by contributing to science, and want their data to be widely used. At a minimum, anyone who publishes should be prepared to share data so that others can reproduce the published analyses. Reasonable people can disagree about broader reuse, and embargoes so that data collectors can publish first can be acceptable.

**Planning ahead: three don'ts**

- **Don't promise to destroy your data.** Neither the NIH, the NSF, nor the Common Rule requires destruction. Destruction should be a rare, justified exception, for instance identifiable video of participants discussing illegal behavior. Even data that are never shared should be retained, so that researchers can check and defend their work.
- **Don't promise not to share data.** Boilerplate such as "only the research team will have access" is often copied thoughtlessly from earlier consent forms. It causes considerable difficulty when journal or funder requirements later force sharing.
- **Don't promise that analyses will be limited to certain topics.** Secondary researchers will want to ask other questions.

**Planning ahead: five dos**

- **Do get consent to retain and share data.** Tell participants who will have access (researchers at the same institution, at other institutions, commercial entities, governments, the public) and for what purposes. Err on the side of broader consent: if the data turn out to be more sensitive than anticipated, you can always share more narrowly than the consent allows, but not the reverse. Tiered consent can give participants choices, although participants should not be able to opt out of sharing for reproducing the original analysis. Template consent language is available from repositories such as ICPSR and Databrary.
- **Do incorporate data-retention and data-sharing clauses into IRB templates.** Defaults nudge researchers and IRBs from a culture of secrecy towards a culture of sharing. The question should be *how* and *with whom* to share, not *whether*.
- **Do be thoughtful about re-identification risk**, in both directions. Data are easily re-identified from a few quasi-identifiers: Sweeney famously re-identified the governor of Massachusetts from five-digit ZIP code, full birth date, and sex. And people who know a participant can recognize them in data that strangers cannot. But do not overestimate the risk either. Risk is the magnitude of harm discounted by its probability, and much research data could be re-identified without significant harm. Proper de-identification works much better than the publicity around re-identification attacks suggests: under the HIPAA "safe harbor" rules (three-digit ZIP codes, year of birth only), the share of re-identifiable individuals in Sweeney's example drops from an estimated 87% to 0.04%. Most researchers and IRBs lack de-identification expertise. Institutional privacy offices, de-identification tools, and repository curation services can help.
- **Do consider working with a data repository** rather than waiting to be asked for data. In one study, 73% of authors of articles in APA journals had still not shared their data six months after being asked, despite being bound by APA principles to do so (see also [Retention](#sec-retention)).
- **Do be thoughtful when selecting a repository.** Repositories differ in governance: fully open; restricted to "qualified researchers" who sign data use agreements; private links; embargoes. Meyer's Table 1 compares Databrary, Dryad, figshare, Harvard Dataverse, ICPSR, openICPSR, OpenfMRI, OpenNeuro, OSF, and Zenodo. See also [Publishing data securely, with controls](04-publishing-with-controls.md).

**Data already collected without consent to share.** Sharing exposes participants to two risks: being identified, and having their data used for purposes they would object to. Whether sharing is nevertheless appropriate is a case-by-case decision. The case is stronger the more of the following hold:

- the consent form was silent about sharing, rather than promising not to share;
- the data are not especially sensitive;
- the data are unlikely to be re-identified;
- access will be restricted, under agreements that prohibit re-identification;
- secondary uses stay within the scope of the original study;
- secondary uses are ones participants are not known to object to.

The case for sharing purely for *reanalysis* is especially strong: research that cannot be verified arguably does not produce knowledge at all, and so cannot justify the risks participants took. Where the consent form promised not to share, consult your IRB. Sharing would likely be a protocol violation, but an IRB may approve an amendment when the incremental risk is minimal.

**"Public" data.** Under the Common Rule, analyzing data that are not "private" (for instance, public social media posts) is not human-participants research. Yet aggregating scattered bits of public information into one dataset amplifies attention to them, enables unanticipated inferences, and creates a permanent record. Meyer's example: researchers who scraped tens of thousands of OkCupid profiles, including answers to intimate questions visible only to other members, and posted them without de-identification because the data were "already public." The GDPR reaches a similar conclusion through a different route (see [Legal restrictions](#sec-legal-restrictions)).

Meyer concludes that participants do have privacy interests, and should be asked for permission to share. But they also typically expect their data to be used to advance scientific truth, not to support claims that cannot be verified.

## Consent determines what you can share

If you are collecting data, for instance in a survey or an RCT, you got permission to run the survey, and that permission already locks you into certain things. What you ask respondents to agree to before answering is set out in consent agreements that you negotiate with your IRB, and that must also be acceptable to the respondents. If you were to say "I am going to publish these data broadly," you would probably get a lower response rate, so there is a balance to strike.

The consent determines how broadly you can share the data. It may also determine *where* the data can be used: on a specific authorized computer? On any university computer? The latter broadens access considerably, but also restricts it: a collaborator at another university might not be able to access the data on their computer (maybe you send them a loaner laptop). All of these affect how you process the data, and they are built in from the start.

It is possible to go back to respondents to ask for permission to share more broadly. We have done so in some of the surveys we have run. You may also have to go back to tell respondents that you accidentally leaked their data. That is not a good outcome, but quite a few authors have had to do so through their IRB, which proves that it can be done.

(sec-randomized-response)=
### Randomized response

There are known techniques to make individual responses private. *Randomized response* [@warner1965] was developed to elicit answers to sensitive questions, such as about illegal drug use, without the interviewer learning any individual's true answer. In a common variant, the respondent privately flips a coin, and depending on the outcome answers either an innocuous question ("Is your birthday in the first half of the year?") or the sensitive one. The researcher only sees "yes" or "no", without knowing which question was answered, but can still estimate the prevalence of the sensitive behavior in the population, because the probability of each question is known. Randomized response turns out to satisfy differential privacy [@dwork2014], a connection we return to in [Making non-shareable data shareable](03-making-shareable.md).

It is a clever mathematical method, but many usability studies find that most respondents do not understand the math, so the privacy promise embedded in it does not actually increase response rates. Respondents mostly answer truthfully because they find the interviewer trustworthy. How much information you have to convey to respondents, and how much they can absorb, is very much an open discussion.

#### Questions from participants

:::{hint} If the ethics approval requires a data transfer agreement (DTA) before data can be shared outside the country, and an external research partner has access to the shared data collection platform (e.g., a SurveyCTO server), is that access already data sharing?
:class: dropdown question
If they can download from SurveyCTO, it is data sharing. This situation is probably glossed over quite a lot, because people do not think carefully about somebody who *can* get into a server but does not intend to download anything. And again: who owns the data on the SurveyCTO server?
:::

## Further discussion

The panel discussion in @crress2022session2 brought together the head of research at J-PAL (a co-author of the J-PAL de-identification guide [@kopper2023]), Michelle Meyer, and a speaker who approached data ethics and data accessibility in a very different way. I will not give away the punchline; watch the video.
