---
name: submit-github-pr-review
description: "Turn a local Markdown code-review file into one submitted GitHub pull-request review using the gh CLI. Use whenever the user wants to post, apply, publish, or submit findings from review.md or another review document as GitHub inline review comments, especially when each finding must become a separate comment in one REQUEST_CHANGES, APPROVE, or COMMENT review."
---

# Submit a GitHub PR review from Markdown

Use this workflow to convert a local review document into **one GitHub pull-request review** with separate inline comments.

## Inputs

Identify from the request or repository context:

- The review Markdown file.
- The PR number or URL.
- The requested review event: `REQUEST_CHANGES`, `COMMENT`, or `APPROVE`.
- Tone requirements, if any.

If the review event is not explicitly specified, prepare the comments and ask for the event before submitting. Submitting a review is an external mutation; obtain explicit approval immediately before the POST unless the user has already directly instructed submission in the current conversation.

## Parse the review file

1. Read the file and identify actionable findings. Do not turn headings, summaries, or verification notes into inline comments unless requested.
2. Preserve one comment per finding, even where a finding cites multiple files. Attach it to the most relevant changed line and mention the secondary file only when needed for context.
3. Extract the path and line/range from each finding. When a range is given, anchor the comment to the changed line that best represents the concern.
4. Rewrite each comment to match the requested tone. For a confirmation-oriented review, prefer language such as:
   - “Is it intended that …?”
   - “Please check whether …”
   - “Please confirm that …”

Do not dilute the technical evidence: retain the affected behavior, concrete failure mode, and relevant configuration or security consequence.

## Validate the target

Before posting:

1. Use `gh pr view <PR> --json number,url,headRefOid,headRepository,baseRefName,state,isDraft` to confirm the PR is open and obtain its exact head SHA.
2. Confirm each proposed anchor exists in the PR head. Read the narrow source range locally when the worktree corresponds to the PR head; otherwise use GitHub’s PR-files API.
3. Use only changed lines for inline review anchors. GitHub requires a file `path`, a right-side `line`, and the exact `commit_id` for each inline comment.
4. Count findings and comments. The counts must match.

## Submit one grouped review

Build a temporary JSON payload, then submit it with one API request:

```json
{
  "commit_id": "<head SHA>",
  "event": "REQUEST_CHANGES",
  "body": "<short review summary>",
  "comments": [
    {
      "path": "path/to/file.py",
      "line": 123,
      "side": "RIGHT",
      "body": "Is it intended that …?"
    }
  ]
}
```

Use a review summary that establishes the tone. For confirmation-oriented findings:

> Please ignore any items that are intentional or already handled elsewhere. The inline comments below are confirmation requests for paths that may affect correctness, security, reliability, or resource usage.

Submit exactly one review:

```bash
gh api --method POST repos/<owner>/<repo>/pulls/<PR>/reviews --input <payload.json>
```

Do not post comments individually or create a separate review for each finding.

## Verify and clean up

1. Query the created review with `gh api repos/<owner>/<repo>/pulls/<PR>/reviews/<review-id>` and confirm its `state`, `commit_id`, summary body, and URL.
2. Query `.../reviews/<review-id>/comments` and confirm the comment count matches the finding count.
3. Delete the temporary payload after successful verification.
4. Report the review URL, event/state, reviewed SHA, and number of inline comments.

## Failure handling

- If GitHub rejects an anchor, do not submit a partial replacement review. Re-check the PR patch and correct every invalid anchor before retrying.
- If the PR head changes before submission, regenerate the payload with the new SHA and revalidate anchors.
- If the review file contains uncertainty or unsupported claims, preserve the uncertainty in the comment rather than asserting a defect.
- Never expose secrets from the review file, manifest, command output, or environment in the submitted text.
