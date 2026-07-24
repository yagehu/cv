#import "lib.typ": (
  conf, award-item, edu-item, experience-item, pub-full,
  service-item,
)

#set page(
  paper: "us-letter",
  margin: 1in,
)
#set document(title: [Yage Hu])

#show: conf.with()

#title()
#align(center, [
  #link("yage.hu@uga.edu") | 530-379-5631
])

= Education

#yaml("edu.yaml").map(edu-item).join(v(0.5em))

= Publications

#pub-full(yaml("pub.yaml"))

= Awards and Honors

#yaml("award.yaml").map(award-item).join(v(0em))

= Industry Experience

#yaml("work.yaml").map(experience-item).join(v(0.5em))

= Academic Experience

#yaml("edu-exp.yaml").map(experience-item).join(v(0.5em))

= Service

#yaml("service.yaml").map(service-item).join(v(0em))
