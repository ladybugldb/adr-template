# 1. ADR title (Don't forget to modify the number!)

Date: mm/dd/yyyy

## Status

Proposed

## Context

Write a short section that gives information about the following:

- Why did you start thinking about this? Because of a new feature? A limitation
  in the current architecture? A technical debt?
- What options do you have? Any existing solutions you could use? Are there
  multiple ways to solve the problem? What are they?
- What kinds of tradeoffs do you need to consider?

**Tip:** start from the perspective of the user, not your own subsystem. Move
oustide-in, and the story will naturally unfold. For example:

> The job scheduler needs to persist its past job. We need a database for that.

Instead, you should write something like this:

> We have to provide an API where the user can query its finished and failed
> jobs. The API server has a database where we could persist them, but it is
> not the right place to do that:
>
> - The API will probably handle several types of requests for Watson Media,
>   not just enrichment jobs. It is better to keep the two systems separate.
> - The two use cases will have very different workloads. The API database
>   needs a fast database for handling small chunks of data (e.g. user credentials).
>   The job database needs to store large JSON blobs which is accessed
>   infrequently.
>
> We need a solution that is
>
> - Highly available
> - Can store large JSON files indefinitely
> - Can be searched by certain parts of the JSON payload (e.g. filename)
>   and creation date.
>
> We considered the following options:
>
> - MongoDB: It is very scalable, can search in arbitrary JSON fields,
>   and available in compose.io. On the other hand, it has known cosistency
>   issues and we do not have much experience managing it.
> - Store the JSON payloads in an object store, and the searchable meta
>   information in MySQL. We have lots of experience using both, on the other
>   hand, MySQL is not infinitely scalable.

## Decision

Summarize your decision in a sentence. Preferably it is a reference to an option
that was discussed in the previous section.

Now give a few details *why* you decided this. If there were multiple options,
what are the key advantages that are important for the current system?
Why did you choose this despite its disadvantages? - Provide enough information
so that your decision can be revised later.

If the Context section was written poorly, the decision will be short.
For example:

> We will use MySQL: we have lots of experience with it, so we will be
> able to move fast. Also, compose.io has MySQL support, so we will not
> need to maintain it.

Instead, you could write something like this:

> We will use MySQL, combined with an object store:
>
> - It is scalable enough for our purposes: MySQL can store millions of
>   job metadata on a single node, and we can shard it later if necessary.
>   The object store is horizontally scalable by design.
> - We have a limited amount of fields that should be searchable.
>   We can extend it easily with ALTERs.
> - Compose.io provides MySQL support, so we will not need to maintain the
>   database.

## Consequences

It is tempting to just repeat the advantages/disadvantages in the previous section:

> We will be able to move fast, without maintaining the database.

Instead, this is what you should write about:

- consequences for other teams
- risks for possible new features
- non-functional characteristics

For example:

> - The additional workload for the Infra team will be probably minimal: we will
>   use a service provided by Bluemix. On the other hand, if it turns out to be
>   unreliable, we will have to install and maintain our own MySQL cluster.
> - We should be adding new searchable fields with care: it will need ALTERs
>   on a large table, and existing jobs will not be searchable these with new fields.
