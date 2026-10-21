---
title: When can you share data?
---

:::{attention} Draft
Prose adapted from a recorded workshop session (October 2026); still being revised.
:::

:::{aside}
**Readings**

- {cite:t}`meyer2018`
- {cite:t}`crress2022session2`
:::

## How do you know you *can* share data?

You need to know right from the start whether you can share the data, because the answer will affect how you collect the data and how you write your code. There is no standard way in which data providers communicate this. You need to find out, keep track of it, and be on the lookout for it. When you first download a dataset, record not just the data but also the purposes, restrictions, permissions, and rights that come with your access.

### "Free" is not the same as "shareable"

Terms like "free" and "public" get used loosely. "Free" refers to the money you pay. It says nothing about what you can then do with the data. If you purchase data, you might be able to share them with other people, or with everybody. Or you might only have purchased the *right to access* the data.

Think of the long user agreements you click through when you open software for the first time. You did not purchase the software to do with it whatever you want. You purchased a non-exclusive right to use it: the company can sell that same right to others, and you have no right to resell, publish, or give out the software. On the other hand, if you pay a programmer to code up your survey instrument, the contract typically transfers ownership to you. You own the software, even though the programmer wrote it, and you can do anything you want with it. Same kind of object, very different rights. Data work the same way.

(sec-code-shareable)=
### Code is shareable even when data are not

Even when you cannot share the data, the most current transparency policies require you to provide the code you used, including the code that cleans the data. This is not pointless. Somebody else can go to the same provider, obtain the same data, run your code, and build on it. And anybody can inspect your code *without* the data, and ask whether what you are doing is reasonable.

A classic example: years of education where a missing value was coded as `99`, but the researchers had not read the documentation and never removed it. Their mean (and possibly their median) are now completely wrong, and so is everything downstream. I do not need access to the data to see that: it is literally written in the code. (How to keep confidential information out of the code itself is covered in [See also](05-see-also.md).)

## How do you know you *cannot* share data?

- **Licenses and data use agreements**
  - Example 1: Demographic and Health Surveys (DHS) [@dhs_access; @dhs_rationale; @dhs_terms]
  - Example 2: Health and Retirement Study (HRS) [@hrs_conditions; @hrs_ai_policy]
  - Example 3: World Values Survey (WVS) [@wvs_conditions; @wvs_wave7]
  - Example 4: PSID conditions of use [@psid_conditions]
- **Institutional review board (IRB)** restrictions (see [Ethics review, consent, and data sharing](01-irb-and-consent.md))
- **Confidentiality agreements**
- **Legal restrictions**
  - 🇪🇺 GDPR [@gdpr2016]
  - 🇧🇷 LGPD [@lgpd2018; @dlapiper_brazil]

### Licenses: the DHS example

The DHS program is a good example precisely because the restrictions are not obvious. The program's [Registration Rationale](https://dhsprogram.com/data/Registration-Rationale.cfm) [@dhs_rationale] starts by saying that the datasets "are publicly available and can be downloaded free of charge for research purposes," and the sidebar says that the program is "authorized to distribute, at no cost, unrestricted survey data files for legitimate academic research."

:::{figure} images/dhs-registration-rationale.png
:label: fig-dhs-rationale
:alt: Screenshot of the DHS Program "Dataset Registration Rationale" page.
The DHS Program's [Dataset Registration Rationale](https://dhsprogram.com/data/Registration-Rationale.cfm) page (screenshot taken 2026-10-21).
:::

Read further, though. The host country is the owner of the data. Agreements with host-country governments include commitments "that the data are used by real people with legitimate purposes," and many countries do not allow commercial use. You were deemed to have a legitimate purpose, which is why you got access. If you give the data to somebody else, how can you verify that they have a legitimate purpose by those same rules? You cannot. And you do not have that agreement with the host country; the DHS program does. Note also the additional protections for HIV and GPS data, which require users to sign a separate digital consent.

The only place where the restriction is front and center is the [login and registration page](https://dhsprogram.com/data/dataset_admin/login_main.cfm) [@dhs_access], which says, in bold, that "re-distribution of any DHS micro-level data, either directly or within any tool/dashboard, is not permitted." And notice *who* gets to see this: you, when you register for the first time. Years later, when you come back as a long-time user, you have forgotten about it.

:::{figure} images/dhs-login-register.png
:label: fig-dhs-login
:alt: Screenshot of the DHS Program "Login or Register for Datasets" page.
The DHS Program's [Login or Register for Datasets](https://dhsprogram.com/data/dataset_admin/login_main.cfm) page (screenshot taken 2026-10-21).
:::

The full [Terms of Use](https://dhsprogram.com/data/terms-of-use.cfm) [@dhs_terms], linked from the sidebar, spell it out: the data are to be used only for the registered research project, are not to be shared with other researchers without the written consent of the DHS Program, are to be kept in a secure location, and are not to be re-distributed. Some countries add their own conditions, such as sending copies of publications to the national statistical office.

:::{figure} images/dhs-terms-of-use.png
:label: fig-dhs-terms
:alt: Screenshot of the DHS Program "Terms of Use" page.
The DHS Program's [Terms of Use](https://dhsprogram.com/data/terms-of-use.cfm) page (screenshot taken 2026-10-21).
:::

:::{note} Data sovereignty
The DHS clause that the host country owns the data is an instance of *data sovereignty*: data about a country's people, from that country, belong to that country. Economists do not tend to write this large, but talk to anybody in, say, biology, and it is written very large. Consider a plant that grows only in Colombia and, when oxidized, produces a rare organic blue colorant. Somebody patents the process and sells the patent. Who should benefit, and where should the royalties go? Many DHS surveys are literally run by the host countries, with funding from elsewhere.
:::

(sec-hrs-license)=
### Licenses: the HRS example

The Health and Retirement Study (HRS) in the United States formalizes what is implicit in the DHS terms. Its [Conditions of Use](https://hrsdata.isr.umich.edu/data-products/conditions-of-use) [@hrs_conditions] prohibit transferring HRS data "to any third party other than staff or students for whom you are directly responsible." But a separate section explicitly allows *third-party redistribution* of HRS public release files, by data librarians, archives, and others, under four conditions:

- only public release files may be distributed;
- the third party must register as an HRS user;
- **all** recipients of the files must personally register as HRS users;
- procedures must be in place to ensure that these restrictions are fulfilled.

In other words, you may redistribute the data, as long as you can verify that every recipient has been authorized by HRS. If you cannot verify that, you cannot redistribute. The same page has a *Replication Policy*: HRS supports replication, "but does not allow third-party distribution of its data by anyone, including journals," and provides a guidance document for authors whose journals require replication packages. Users must also certify destruction of downloaded files, and anything derived from them, when HRS requests it, and must protect the data under the NIH Certificate of Confidentiality.

:::{figure} images/hrs-conditions-of-use.png
:label: fig-hrs-conditions
:alt: Screenshot of the HRS "Conditions of Use" page.
The HRS [Conditions of Use](https://hrsdata.isr.umich.edu/data-products/conditions-of-use) page, updated 2026-02-04 (screenshot taken 2026-10-21).
:::

The HRS conditions now also prohibit the use of AI programs and LLMs in conjunction with HRS data, with a separate, detailed [AI and LLM Use Policy](https://hrsdata.isr.umich.edu/data-products/ai-llm-use-policy) [@hrs_ai_policy]. It distinguishes three types of LLMs:

1. LLMs that retain user-provided data (including for training);
2. institutionally licensed LLMs that do not retain data;
3. type 2 LLMs that are isolated within a secure network with no internet access.

Under the HRS data use agreements, sending data to a type 1 LLM counts as redistribution to the company operating it. Types 2 and 3 do not count as redistribution, but HRS currently does not accept requests for either. In practice, *no* LLM use with HRS person-level data is allowed, not even a model running locally. Using an LLM to write analysis code, or sharing model coefficients and summary statistics with it, is fine as long as no microdata are uploaded. AI features in code editors that automatically index the working directory must be disabled, or the HRS data stored outside any directory they can access.

:::{figure} images/hrs-ai-llm-policy.png
:label: fig-hrs-ai
:alt: Screenshot of the HRS "AI and LLM Use Policy" page.
The HRS [AI and LLM Use Policy](https://hrsdata.isr.umich.edu/data-products/ai-llm-use-policy), updated 2026-08-04 (screenshot taken 2026-10-21).
:::

### Licenses: the WVS example

The World Values Survey (WVS) is widely used, and widely thought of as "public." The [Wave 7 download page](https://www.worldvaluessurvey.org/WVSDocumentationWV7.jsp) [@wvs_wave7] says that the data "can be used freely for non-commercial purposes such as research, publication, teaching," but also that "data redistribution is prohibited: publication of the original WVS datasets at other online platforms is against the WVSA Constitution."

:::{figure} images/wvs-wave7-download.png
:label: fig-wvs-wave7
:alt: Screenshot of the World Values Survey Wave 7 download page.
The [WVS Wave 7 (2017--2022)](https://www.worldvaluessurvey.org/WVSDocumentationWV7.jsp) download page (screenshot taken 2026-10-21).
:::

The binding terms, however, only appear in a pop-up when you actually click to download a file. You fill in a short registration form and tick a box saying "I have read the 'Conditions of use' and agree with them." The [conditions](https://www.worldvaluessurvey.org/AJDownloadLicense.jsp) [@wvs_conditions] state that the files "are available without restrictions, provided:

- a) that they are used for non-profit purposes;
- b) correct citations are provided and sent to the World Values Survey Association for each publication of results based in part or entirely on these data files;
- c) the data files themselves are not redistributed;
- d) proper citation to the WVS data is included into the references list of the publication."

"Without restrictions," followed by four restrictions, one of which is the one that matters for a replication package. The pop-up is shown once per download, and nobody keeps a copy of it. This is exactly the kind of information you should record when you first obtain the data. Note too that the WVS data are also distributed by other archives (for example, DataFirst at the University of Cape Town), and those archives may add their own conditions: always check the terms of the place you actually got the data from.

### Licenses: the PSID example

The PSID [Conditions of Use](https://simba.isr.umich.edu/U/CondUse.aspx) [@psid_conditions] are, again, a long list, but here it is much more obvious that these are conditions. They also mix their terms: these are "public release data," and yet you may "not transfer PSID public data, including user-created data extracts, to any third party," and co-investigators, collaborators, research assistants, and students must each register separately. "Public" here means that access does not require any special application. In my view, "public" is the wrong term for these: they are openly accessible data that come with restrictions.

:::{figure} images/psid-conditions-of-use.png
:label: fig-psid-conditions
:alt: Screenshot of the PSID "Conditions of Use" page.
The PSID [Conditions of Use](https://simba.isr.umich.edu/U/CondUse.aspx) page (screenshot taken 2026-10-21).
:::

Like the HRS, the PSID offers a way out for replication packages: if a journal requires you to provide access to PSID data, or you want to share extracts with others, you must deposit the extract in the PSID Public Data Extract Repository, maintained through openICPSR.

A newer clause states that "the use of Artificial Intelligence (AI) programs and Large Language Models (LLMs) in conjunction with PSID data is strictly prohibited." I have an issue with the way this is written. A likely concern is that the data could be used to *train* LLMs and incorporated in a way that was not authorized. But what if I apply an LLM to analyze the data in a private environment, where nothing is learned and nothing is published? The clause does not distinguish. When people hear "AI," they think of uploading a data file to a chat interface (which is literally what many people do), but that is not the only way to use LLMs. Do not assume the narrow reading, though: the HRS policy above, from the same institute, makes explicit that even isolated, local LLMs are currently not allowed. When in doubt, ask the provider.

### Licenses stick to the data

The license travels with the data. If you distribute data informally within your institution, you know what the restrictions are, but do the people you gave the data to know? We have seen papers by PhD students who obtained data from their thesis advisor and then published them, not knowing that they were confidential. Legally, that stickiness is there regardless, and you are not the arbiter of whether it applies.

#### Questions from participants

:::{hint} Can I share a cleaned version of the data with co-authors, or with the public?
:class: dropdown question
That depends on the data provider and what the data use agreement says. Think about both the practicalities and the legality. Some agreements simply say no. I have seen commercial agreements for stock price data that say that differenced and logged values are transformed data that you may publish, because, from the provider's point of view, that transformed data cannot replace their product. But you should ask.

For data like the DHS, it is not clear. The raw data clearly cannot be shared. But what does "clean" mean? Removing a few records does not make the data very different from the original: you are still sharing data on the respondents. If every data point on every individual has been modified, things become clearer, though not entirely clear. If you are only publishing aggregate statistics, then in principle yes, but you still have to worry about re-identification. Part of making data shareable is modifying them in certain ways, which is covered in [Making non-shareable data shareable](03-making-shareable.md).
:::

:::{hint} When I obtain data from a statistical institute, should I ask for permission before sharing data or code?
:class: dropdown question
If you get data from a statistical institute, you should always ask whether the data are shareable. The code, however, you are typically required to provide regardless (see [above](#sec-code-shareable)).
:::

### Ethics review and consent

If you collect your own data, the IRB approval and the consent your respondents gave constrain what you can share. This is discussed in [Ethics review, consent, and data sharing](01-irb-and-consent.md).

(sec-legal-restrictions)=
### Legal restrictions

Legal frameworks can turn what you think is public data into something you now have to worry about. The most obvious is the GDPR [@gdpr2016] in the European Union, which applies to anything that affects an EU citizen. But it is not restricted to Europe: Brazil's LGPD [@lgpd2018; @dlapiper_brazil] is very restrictive and has affected what researchers working with Brazilian data can make available. There may be many other such laws, in countries whose legal background I do not know, that you need to be aware of.

A key subtlety: under the GDPR, you might collect data that are *individually* public (a CV, a personal website) for hundreds of researchers by scraping their public websites. By doing so, you have constructed a database containing personally identifying information, and that database is now subject to consent. All the data that flowed into it were public, but you now must respond to people who want their data removed from your database, which is no longer possible once you have disseminated it publicly. You have become a data controller, and that database, which might be at the core of your research, cannot be redistributed. This was not clear when the GDPR was implemented, and the interpretation has moved along. In a recent case with a US institution, authors had compiled public data from various sources and wanted to make it available to future researchers, with a registration requirement. ICPSR's Disclosure Review Board declined to post it unless all the personally identifying information was stripped out, which would have made the data useless. @meyer2018 makes a related point about aggregating "public" data from an ethics perspective (see [Ethics review, consent, and data sharing](01-irb-and-consent.md)).

### Panel data and re-identification

DHS surveys are typically not panel datasets, but the PSID is: it follows people through time. It has been known for decades that being able to follow somebody over time, even in a small sample, is supremely identifying. If you set your mind to it, you can find the people in the PSID.

This has led statistical agencies to pull back from publishing panel surveys. Statistics Canada's Survey of Labour and Income Dynamics (SLID) is a case in point. To protect respondents' identity, Statistics Canada noted that "longitudinal files have been separated from cross-sectional files" [@statcan1997slid], and even the cross-sectional public-use files required aggressive data masking. When SLID replaced the Survey of Consumer Finances as Canada's official source of income data in 1998, the cross-sectional public-use files had to include household and family identifiers, which compromised any release of longitudinal public-use files. Statistics Canada instead turned to synthetic data and research data centres for the longitudinal data [@abowd2001; @abowd2018]. The cross-sectional files were protected by dropping direct identifiers, aggregating geography, grouping occupations, adding noise to year of birth, and top- and bottom-coding and perturbing income, to prevent users from linking consecutive cross-sections into their own panel [@abowd2001].

From then on, the panel was accessible only in a restricted environment: you had to be affiliated with a Canadian university and walk into a locked room. Similar arrangements exist in many countries. Researchers working with a Ugandan dataset had, years ago, kept it on their laptops; the Uganda Bureau of Statistics now requires access through a secure room in Kampala. (More on such arrangements in [Publishing data securely, with controls](04-publishing-with-controls.md).)

## Data ethics

- Discussion on data ethics (video) [@crress2022session2]
- Practical tips for ethical data sharing [@meyer2018]

See [Ethics review, consent, and data sharing](01-irb-and-consent.md) for a summary of @meyer2018 and a discussion of the video.
