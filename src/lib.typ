#let conf(doc) = {
  set par(spacing: 0.5em)
  set text(size: 12pt)
  show title: set align(center)
  show heading: smallcaps
  show heading.where(level: 1): set text(fill: rgb("#801010"))
  show heading.where(level: 1): it => grid(
    columns: (1fr),
    it,
    grid.hline(stroke: 1pt),
    inset: (bottom: 0.2em),
    row-gutter: 0.5em,
  )

  doc
}

#let date_fmt = "[month]/[year]"
#let headline_size = 1.2em

#let display_date(date) = {
  if "month" not in date {
    datetime(year: date.year, month: 1, day: 1).display("[year]")
  } else if "day" not in date {
    datetime(year: date.year, month: date.month, day: 1).display("[month]/[year]")
  } else {
    datetime(year: date.year, month: date.month, day: date.day).display("[month]/[day]/[year]")
  }
}

#let experience-item(e) = {
  let start = display_date(e.start)
  let end = if "end" in e { display_date(e.end) } else { "Present" }

  [
    #grid(
      columns: (1fr, auto),
      strong(text(size: headline_size, e.title)),
      [
        #start#sym.dash.en#end
      ]
    )
    #emph(e.org)

    #if "detail" in e {
      grid(
        columns: (1em, 1fr),
        [],
        list(
          ..e.detail.map(it => eval(it, mode: "markup"))
        )
      )
    }
  ]
}

#let edu-item(edu) = {
  let date = datetime(
    year: edu.date.year,
    month: edu.date.month,
    day: if "day" in edu.date { edu.date.day } else { 1 },
  )

  [
    #grid(
      columns: (1fr, auto),
      text(size: headline_size, [#strong(edu.degree), #edu.major]),
      [
        #date.display(date_fmt)
      ]
    )
    #emph(edu.institution)

    #if "advisor" in edu { [Advisor: #edu.advisor] }
  ]
}

#let pub-item(item) = {
  let authors = item.authors.map(it => {
    if "self" in it and it.self {
      strong(it.name)
    } else {
      it.name
    }
  })

  [
    #authors.join(", ")

    "#link(item.url, item.title)"

    In: #emph(item.conference)
  ]
}

#let pub-full(pubs) = {
  show link: set text(blue)
  show link: underline

  let count = counter("pub")
  let confs = pubs.filter(it => it.type == "conference")

  //     == Conference Papers
  [
    #count.step()
    #grid(
      columns: (1cm, auto),
      column-gutter: 1em,
      align: (right, left),
      [\[#context count.display()\]],
      ..confs.map(pub-item),
    )
  ]
}

#let award-item(item) = {
  [
    #grid(
      columns: (1fr, auto),
      item.name,
      [
        #display_date(item.date)
      ]
    )
  ]
}

#let service-item(item) = {
  [
    #strong(item.name): #item.org
  ]
}
