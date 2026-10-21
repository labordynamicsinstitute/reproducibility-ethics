---
title: Publishing data securely, with controls
---

:::{attention} Draft
Prose adapted from a recorded workshop session (October 2026); still being revised.
:::

If you cannot make the data less revealing without destroying their utility, can you control who accesses them? The honest answer is that it is not obvious.

## Keeping data at your institution

At a minimum, you can work with your institution to keep the data securely there. That still requires thought: a USB drive in your office is not enough. My university requires an encrypted hard drive on any computer that holds personally identifying information, and, over the years, has also required an escrowed encryption key, so that IT staff can unlock the computer when I am not there. Ask yourself:

- What happens if I leave the institution, but the data must stay? I need to hand them off to somebody, and ideally plan that ahead rather than at the last minute.
- What if this computer falls into the water? Is this the only place the data exist? Are they in the backups?
- Where can I actually run my code on the confidential data, throughout the project?

These are questions for your research, even before thinking about five years after publication.

(sec-retention)=
## Retention

- Journal policies require "5 years retention"
- How do you ensure that?

The downside of journal policies that require five years of retention is that you have to answer the emails. As data editors, we generally do not like to have to ask researchers to provide data after publication, because, as documented in various studies, about 70% of authors never answer (in one study cited by @meyer2018, 73% of authors had not shared their data six months after being asked): publication is done, and they do not care any more. Other authors are willing, but worry: what if the data become very popular? They do not want to become the DHS program, answering requests, without staff or systems to do so. So where can you hand this off?

- **Your institute or research center.** Going one level up from the researcher can work: a center may have staff for whom handling data requests is a small part of their job, with monitored email inboxes and procedures. Going higher up in a university rarely works: nobody has the funding for it.
- **Data repositories with access controls**, discussed next.
- **National statistical offices and archives**, discussed below.

How long should data be kept? Journals say five years, which roughly matches how long it takes for citations to decline. But people actually keep things around for a long time. We once found that a replication package from around 2015, from before I became data editor, had corrupted data. I emailed the author, and the next day she sent an updated ZIP file: her computer still had everything. That is a well-organized person who has not changed institutions. It may be a very different story when somebody moves institutions or retires, and people who leave academia are almost unfindable. That is where handing the data off to somebody else becomes very useful. Whether every dataset from every experiment should be kept for a hundred years is a different question.

## Repositories with access controls

- Data repositories have mechanisms
  - e.g., [ICPSR](https://www.icpsr.umich.edu/web/pages/)
  - e.g., [Dataverse](https://dataverse.org/)
  - e.g., [Zenodo](https://zenodo.org/)

These repositories preserve the data and handle access, and they can require users to register with an email address and agree to terms of use. That may be sufficient for some data. But when you cannot de-identify, for instance because the names are critical to the research, you are back in the world where collecting the names required IRB approval, and using the data will require IRB approval as well. Most repositories have no simple mechanism to verify that a user has IRB approval. ICPSR does, but, as described in [When can you share data?](01-can-you-share.md), its Disclosure Review Board has its own opinion of what data should go there, often much more restrictive than the original IRB. It is also not very convenient: rather than trusting users to keep the data in a specific place, ICPSR requires them to run their analysis on its own (not very powerful) cloud computers, for a fee of several hundred dollars. Depositing costs you nothing, but future users have to accommodate that.

## National statistical offices and archives

Statistical offices and national archives sometimes have mechanisms like the secure room at the Uganda Bureau of Statistics in Kampala. In my role as data editor, we have worked with a Swedish national data archive to deposit data subject to the GDPR: somebody needs to verify that each use complies with the GDPR, and the archive handles that. France and Germany have similar national archives, with admissibility criteria (you may or may not qualify, for instance depending on whether you work in Germany) and a workflow to verify that users have IRB approval before accessing the data. I have not seen strong options of this kind in Latin America, though Chile has a fairly robust institutional architecture. There is also decent institutional architecture in Africa to store African datasets with an access protocol around them. It is worth looking into what exists locally, and where you can offload the data once your research is done.

## Flip it: You are the licensor!

Everything the DHS program imposes on the users of its data (registration, legitimate purposes, no redistribution) can be a model for you. When you collected the data yourself, or created them in collaboration with an administration, you are the data distributor. You do not want to just throw the data out there; you want to ensure that people use them in a reasonable way. Can you put something like the DHS conditions in place? Probably not as big and fancy, but the repositories and archives above can help, and the separation of the *data curator* and *researcher* roles described in [Do you have data you cannot share?](02-identifying-nonshareable.md) is a first step.

### When the data provider disappears

#### Questions from participants

:::{hint} I have collected household-level data for many years, but the original funder no longer exists, its data-sharing systems were dismantled, and a co-funder has lost interest. What do I do with the data now?
:class: dropdown question
The participant had collected food security data in Malawi: not highly sensitive, but still personal. The data are now shared informally and de-identified within the university, and it is not clear what the IRB allows. Situations like this are not unusual. Becoming the licensor, and finding a repository or archive that can take on the role the funder was supposed to play, is one way forward. It also matters that the people receiving the data informally know which restrictions apply to them, because the license sticks to the data.
:::
