#!/usr/bin/env python3
"""
update-index.sh — Auto-generate README.md index for the knowledge base.
Usage: ./update-index.sh [--dry-run]
"""
import json
import os
import sys
from datetime import datetime
from pathlib import Path

KB_ROOT = Path(__file__).resolve().parent
README = KB_ROOT / "README.md"
DRY_RUN = "--dry-run" in sys.argv

# Categories grouped by domain
DOMAINS = [
    ("AI & Technology", [
        "01-AI-Agents",
        "02-AI-Skills-and-Plugins",
        "03-Claude-Code",
        "04-AI-Infrastructure",
        "05-AI-Applications",
        "06-LLM-Foundations",
        "07-Software-Engineering",
    ]),
    ("Humanities & Thinking", [
        "10-Thinking-Models",
        "11-Philosophy",
        "12-Psychology",
        "13-History",
    ]),
    ("Business & Economy", [
        "20-Investment",
        "21-Business",
        "22-Political-Economy",
    ]),
    ("Science & Health", [
        "30-Medicine-and-Health",
    ]),
]


def read_metadata(meta_path: Path) -> dict:
    try:
        with open(meta_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception:
        return {}


def find_entries(cat_dir: Path) -> list[dict]:
    """Find all article directories (those containing index.md)."""
    entries = []
    for index_file in sorted(cat_dir.rglob("index.md")):
        # Skip hidden dirs
        if any(part.startswith(".") for part in index_file.parts):
            continue
        article_dir = index_file.parent
        rel_path = article_dir.relative_to(KB_ROOT)
        meta = read_metadata(article_dir / "metadata.json")

        entries.append({
            "title": meta.get("title", article_dir.name),
            "type": meta.get("type", "article"),
            "status": meta.get("status", ""),
            "author": meta.get("author", ""),
            "clipped_date": meta.get("clipped_date", ""),
            "tags": meta.get("tags", []),
            "rel_path": str(rel_path),
            "category": rel_path.parts[0] if rel_path.parts else "",
        })
    return entries


def main():
    all_entries = []
    overview_rows = []
    directory_sections = []

    for domain_name, categories in DOMAINS:
        directory_sections.append(f"\n---\n\n## {domain_name}\n")

        for cat in categories:
            cat_dir = KB_ROOT / cat
            if not cat_dir.is_dir():
                continue

            entries = find_entries(cat_dir)
            all_entries.extend(entries)

            n_articles = sum(1 for e in entries if e["type"] == "article")
            n_books = sum(1 for e in entries if e["type"] == "book")
            n_notes = sum(1 for e in entries if e["type"] == "note")
            n_total = len(entries)

            overview_rows.append(
                f"| {cat} | {n_articles} | {n_books} | {n_notes} | **{n_total}** |"
            )

            # Category listing
            lines = [f"### {cat} ({n_total})\n"]
            if entries:
                for e in entries:
                    badge = ""
                    if e["type"] == "book":
                        badge = " `[Book]`"
                    elif e["type"] == "note":
                        badge = " `[Note]`"
                    lines.append(f"  - [{e['title']}]({e['rel_path']}/index.md){badge}")
            else:
                lines.append("  *No entries yet*")
            lines.append("")
            directory_sections.append("\n".join(lines))

    # Totals
    total_articles = sum(1 for e in all_entries if e["type"] == "article")
    total_books = sum(1 for e in all_entries if e["type"] == "book")
    total_notes = sum(1 for e in all_entries if e["type"] == "note")
    total = len(all_entries)

    # Bookshelf
    books = [e for e in all_entries if e["type"] == "book"]
    reading = [b for b in books if b["status"] == "reading"]
    completed = [b for b in books if b["status"] == "completed"]
    to_read = [b for b in books if b["status"] not in ("reading", "completed")]

    bookshelf_lines = ["\n---\n\n## Bookshelf\n"]
    if not books:
        bookshelf_lines.append("*No books yet*\n")
    else:
        for label, group in [("Currently Reading", reading), ("Completed", completed), ("To Read", to_read)]:
            if group:
                bookshelf_lines.append(f"### {label}\n")
                for b in group:
                    author_str = f" — *{b['author']}*" if b["author"] else ""
                    bookshelf_lines.append(
                        f"  - [{b['title']}]({b['rel_path']}/index.md){author_str} `{b['category']}`"
                    )
                bookshelf_lines.append("")

    # Recent entries (top 20 by clipped_date desc)
    dated = [e for e in all_entries if e["clipped_date"]]
    dated.sort(key=lambda e: e["clipped_date"], reverse=True)
    recent = dated[:20]

    recent_lines = ["\n---\n\n## Recent Entries\n"]
    if recent:
        for e in recent:
            badge = ""
            if e["type"] == "book":
                badge = " `[Book]`"
            elif e["type"] == "note":
                badge = " `[Note]`"
            recent_lines.append(
                f"  - [{e['title']}]({e['rel_path']}/index.md){badge} — `{e['category']}` *({e['clipped_date']})*"
            )
    else:
        recent_lines.append("*No entries with dates yet*")
    recent_lines.append("")

    # Assemble
    output_parts = [
        "# Knowledge Base\n",
        "> Auto-generated index. Run `./update-index.sh` to refresh.\n",
        "> Classification rules: [CLASSIFICATION.md](CLASSIFICATION.md)\n",
        "## Overview\n",
        "| Category | Articles | Books | Notes | Total |",
        "|----------|----------|-------|-------|-------|",
        *overview_rows,
        f"| **Total** | **{total_articles}** | **{total_books}** | **{total_notes}** | **{total}** |\n",
        *directory_sections,
        *bookshelf_lines,
        *recent_lines,
        "---\n",
        f"*Last updated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}*\n",
    ]

    content = "\n".join(output_parts)

    if DRY_RUN:
        print(f"[dry-run] Would write to {README}")
        print(content)
    else:
        with open(README, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"Index updated: {README}")
        print(f"  Articles: {total_articles} | Books: {total_books} | Notes: {total_notes} | Total: {total}")


if __name__ == "__main__":
    main()
