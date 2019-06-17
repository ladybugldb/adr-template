# Contributing

## TL;DR

**ADRs are about communication. You should communicate all the technical
decisions of your team that affects the system architecture as a whole, the
technical decisions of other teams or important non-functional properties
of the system. You must communicate why the decision was made, what tradeoffs
were considered, and how it affects other teams.**

## When should I write an ADR?

Reading the TL;DR section carefully should answer most of the questions
about *when* an ADR should be created and *what* to write in it. Let's look
into the details of the wording:

**ADRs are about *technical* decisions.** Other reference materials like naming
conventions, best practices are not ADRs, and should be documented elsewhere.
This "elsewhere" can be in this repository if it makes sense (this document
is an example for that), but not in the form of ADRs.

**ADRs should be about things that affect other teams.** You write an ADR
because you want to help other teams to understand how the system works as a
whole. If your ADR is about something that is local to your team, it does not
help the other teams, it just creates noise. It still might be useful to
document it: have an adr/ directory in your own repo.

There are three primary reasons why a decision should be documented as ADR:

1. **The decision modifies the architecture.** If you make a decision that
   modifies a box, line or label on the architecture diagram, it definitely
   needs an ADR.
2. **The decision affects the technical decisions of other teams.** For
   example, if you choose a network protocol that other teams will need to use,
   it needs an ADR. On the other hand, you don't need to document a particular
   choice of programming language or framework if other teams will not need
   to use it.
3. **The decision affects an important non-functional property of the system.**
   For example, if you choose a database engine, it will have certain tradeoffs
   in terms of consistency guarentees, reliability, scalability. This definitely
   needs an ADR because it may limit the future features or scale of the system.

## How should I write an ADR?

Use the Golden Rule: write in a way so that if you were in another team, it
would be most helpful for you.

Copy the [ADR template](adr/_template.md) and follow the guidleines
on how to fill the three sections (Context, Decision, Consequences). It
is very important that you fill them all: if you have nothing to say, it is
likely that one of the following cases happens:

1. You are not communicating the whole picture, especially in
   the Context field (see the [ADR template](adr/_template.md) why)
2. The decision is not ADR material
3. The decision was made without proper consideration. You are an awesome
   programmer, so this is the least likely option. I would bet on case (1) or (2).

Should you write one long ADR or split every single decision to short ADRs?
There are no hard rules here, except the Golden Rule: how would you like
to read it? Sometimes it is good to see the whole picture at once
(for example when creating a whole new subsystem), and sometimes there are
so many details that need lots of consideration that it is worth writing
several ADRs.

## ADR approval process

1. When you make a significant change (create an ADR, modify it significantly),
   create a pull request to this repo. It will send a notification to the
   `#wm-vlm-adr` channel. If your modification is minor (e.g. fixing a typo or
   a broken link), it is OK to push to the master branch directly.
2. Each team should have at least one person who is responsible for reviewing
   ADRs. One person from each team should write a review to the pull request
   within a day.
3. The pull request can be merged if there is an OK reaction from every team.
   There are no write restrictions, anybody can press the merge button.
4. When the pull request is merged, the merger **MUST** notify the `#wm-vlm-adr`
   channel so that the whole team is notified about the change.

The `#wm-vlm-adr` channel is used for meta-ADR issues like the following:

- Asking each other to write or clarify ADRs
- Asking whether something is ADR material or not
- Facilitating the ADR process (asking teams to have a review)

